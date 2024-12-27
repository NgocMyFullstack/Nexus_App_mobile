import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../routes/app_routes.dart';

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print('Không thể mở liên kết: $url');
  }
}

void _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Không thể mở số điện thoại $url';
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> _images = [
    'assets/Image/Welcome-1.png',
    'assets/Image/Welcome-2.png',
    'assets/Image/Welcome4.png',
    'assets/Image/Welcome5.png',
  ];

  int _currentImageIndex = 0;
  late Timer _timer;
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: AnimatedSwitcher(
          //     duration: const Duration(seconds: 3),
          //     switchInCurve: Curves.easeInOut,
          //     switchOutCurve: Curves.easeInOut,
          //     child: Image.asset(
          //       _images[_currentImageIndex],
          //       key: ValueKey<int>(_currentImageIndex),
          //       fit: BoxFit.cover,
          //       alignment: Alignment.center,
          //     ),
          //   ),
          // ),
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: Image.asset(
                _images[_currentImageIndex],
                key: ValueKey<int>(_currentImageIndex),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),

          //
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: SvgPicture.asset(
                'assets/Icon/NEXUS.svg',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 10.0,
                right: 15.0,
              ),
              child: IconButton(
                icon: Image.asset(
                  'assets/MenuIcon/Ellipse.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Language',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       'Vi',
                              //       style: TextStyle(
                              //         fontSize: 16,
                              //         color: isEnglish
                              //             ? Colors.black54
                              //             : Colors.black,
                              //       ),
                              //     ),
                              //     Switch(
                              //       value: isEnglish,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           isEnglish = value;
                              //         });
                              //       },
                              //       activeColor: Colors.white,
                              //       activeTrackColor: Colors.blue,
                              //       inactiveTrackColor: Colors.grey.shade300,
                              //       inactiveThumbColor: Colors.white,
                              //     ),
                              //     Text(
                              //       'En',
                              //       style: TextStyle(
                              //         fontSize: 16,
                              //         color: isEnglish
                              //             ? Colors.black
                              //             : Colors.black54,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Divider(),
                              ListTile(
                                leading: SvgPicture.asset(
                                  'assets/Icon/Document.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                title: Text(
                                  'Social Media',
                                  style: TextStyle(color: Colors.black),
                                ),
                                trailing: Icon(Icons.chevron_right,
                                    color: Colors.black),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 350,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Social Media',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                ListTile(
                                                  leading: GestureDetector(
                                                    child: Image.asset(
                                                      'assets/Icon/fb.png',
                                                      width: 24,
                                                      height: 24,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  title: GestureDetector(
                                                    child: Text(
                                                      'Faceaboock',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  trailing: GestureDetector(
                                                    child: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://www.facebook.com/DBHomesVietNam/');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Image.asset(
                                                    'assets/Icon/yt.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  title: Text(
                                                    'Youtube',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://www.youtube.com/@DBHOMESVIETNAM');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Image.asset(
                                                    'assets/Icon/LinkedIn.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  title: Text(
                                                    'Linkedin',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://www.linkedin.com/company/dbhomes-better-living/');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Image.asset(
                                                    'assets/Icon/Pinterest.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  title: Text(
                                                    'Pinterest',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://www.pinterest.com/dbhomes2023/');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Image.asset(
                                                    'assets/Icon/Website.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  title: Text(
                                                    'Website',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://dbhomes.com.vn/');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Image.asset(
                                                    'assets/Icon/tt.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  title: Text(
                                                    'Tiktok',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://www.tiktok.com/@dbhomes_');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Image.asset(
                                                    'assets/Icon/Instagram.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  title: Text(
                                                    'Instagram',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://www.instagram.com/dbhomesvn/');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),

                              ListTile(
                                leading: SvgPicture.asset(
                                  'assets/Icon/Send.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                title: Text(
                                  'Location',
                                  style: TextStyle(color: Colors.black),
                                ),
                                trailing: Icon(Icons.chevron_right,
                                    color: Colors.black),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 180,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Location',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                ListTile(
                                                  leading: GestureDetector(
                                                    child: SvgPicture.asset(
                                                      'assets/Icon/location.svg',
                                                      width: 24,
                                                      height: 24,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  title: GestureDetector(
                                                    child: Text(
                                                      'Thành phố Hồ Chí Minh',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  trailing: GestureDetector(
                                                    child: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://shorturl.at/yFqeu');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: SvgPicture.asset(
                                                    'assets/Icon/location.svg',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  title: Text(
                                                    'Thủ Đô Hà Nội',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black),
                                                  onTap: () {
                                                    launchURL(
                                                        'https://shorturl.at/Hn7gu');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              ListTile(
                                leading: SvgPicture.asset(
                                  'assets/Icon/Call.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                title: Text(
                                  'Contact',
                                  style: TextStyle(color: Colors.black),
                                ),
                                trailing: Icon(Icons.chevron_right,
                                    color: Colors.black),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Hotline',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                ListTile(
                                                  leading: GestureDetector(
                                                    child: SvgPicture.asset(
                                                      'assets/Icon/Call.svg',
                                                      width: 24,
                                                      height: 24,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  title: GestureDetector(
                                                    child: Text(
                                                      '0931167567',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  trailing: GestureDetector(
                                                    child: Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    _makePhoneCall(
                                                        'tel:0931167567');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      '...Developed by DBHomes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(366, 52),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      alignment: Alignment.center,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    child: const Text('Log In'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(366, 52),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      alignment: Alignment.center,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
