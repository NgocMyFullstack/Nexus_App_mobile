import 'package:db_app/notification/bottoms_notification_screen.dart';
import 'package:db_app/routes/app_routes.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Project {
  final String name;
  final List<String> imagePaths;

  Project({required this.name, required this.imagePaths});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Project> projects = [
    Project(
      name: 'D1 Mension',
      imagePaths: [
        'assets/images/110.jpg',
        'assets/images/115.jpg',
        'assets/images/117.jpg',
        'assets/images/119.jpg',
      ],
    ),
    Project(
      name: 'Đảo Kim Cương',
      imagePaths: [
        'assets/images/222.jpg',
        'assets/images/223.jpg',
        'assets/images/224.jpg',
        'assets/images/225.jpg',
      ],
    ),
    Project(
      name: 'Define anh Hà',
      imagePaths: [
        'assets/images/444.jpg',
        'assets/images/445.jpg',
        'assets/images/446.jpg',
        'assets/images/447.jpg',
        'assets/images/448.jpg',
      ],
    ),
    Project(
      name: 'Filmore',
      imagePaths: [
        'assets/images/551.jpg',
        'assets/images/555.jpg',
        'assets/images/553.jpg',
        'assets/images/554.jpg',
      ],
    ),
    Project(
      name: 'Horizon Phú Mỹ Hưng',
      imagePaths: [
        'assets/images/661.jpg',
        'assets/images/662.jpg',
        'assets/images/663.jpg',
        'assets/images/666.jpg',
      ],
    ),
    Project(
      name: 'Metropole',
      imagePaths: [
        'assets/images/771.jpg',
        'assets/images/772.jpg',
        'assets/images/773.jpg',
        'assets/images/774.jpg',
        'assets/images/775.jpg',
      ],
    ),
    Project(
      name: 'MidTown',
      imagePaths: [
        'assets/images/881.jpg',
        'assets/images/882.jpg',
        'assets/images/883.jpg',
        'assets/images/884.jpg',
      ],
    ),
  ];

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0; // Màn hình mặc định khi bắt đầu
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void onSelectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        leading: Builder(
          builder: (context) => Container(
            margin: const EdgeInsets.only(left: 5.5),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/Icon/Burger.svg',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
        ),
        title: const Text(
          'Tên khách hàng',
          style: TextStyle(
            color: Color(0xFF17244A),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/Icon/Bell.svg',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ButtomNotificationScreen(),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Column(
            children: [
              Container(
                width: 366.0,
                height: 0.5,
                color: const Color(0xFFD4D4D4),
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(onSelectScreen: onSelectScreen),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // product
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PROJECT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF17244A),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: projects.map((project) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the full-screen gallery for the selected project
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenGallery(
                                imageUrls: project.imagePaths,
                                initialIndex: 0, // Default to the first image
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 200,
                          width: 200,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  project.imagePaths
                                      .first, // Display the first image of the project
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Text(
                                  project.name, // Display the project name
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                //  video
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Video',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF17244A),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.youtube.com/watch?v=HtDTh3PXqAo&t=5s'); // Đường dẫn cần mở
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/Image/video2.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Text(
                                  'Đường cong tinh tế',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.youtube.com/watch?v=cHDGXJGcMvI&t=40s'); // Đường dẫn cần mở
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/Image/video1.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Text(
                                  'Căn hộ Metropole',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.youtube.com/watch?v=mPM45JSqZZg&t=1s'); // Đường dẫn cần mở
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/Image/video3.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Text(
                                  'Đường Cong Cuốn Hút',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // postcard
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Postcard',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF17244A),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/Welcome-2.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 60),
                                child: Transform.rotate(
                                  angle: -1.57,
                                  child: Text(
                                    'Sip & Bite',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 220, 214, 214),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/Welcome4.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 60),
                                child: Transform.rotate(
                                  angle: -1.57,
                                  child: Text(
                                    'Sip & Bite',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 220, 214, 214),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/Welcome-1.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 60),
                                child: Transform.rotate(
                                  angle: -1.57,
                                  child: Text(
                                    'Sip & Bite',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 220, 214, 214),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/Welcome-3.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 60),
                                child: Transform.rotate(
                                  angle: -1.57,
                                  child: Text(
                                    'Sip & Bite',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 90, 90, 90),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //  Promotion
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Promotion',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF17244A),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/promotion-2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          children: [],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/promotion-1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          children: [],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/promotion-3.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
                // New
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'News',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF17244A),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://dbhomes.com.vn/chuyen-muc/tin-tuc/doi-song/'); // Đường dẫn cần mở
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/Image/doisong.JPG'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                                height: 1), // Khoảng cách giữa hình và tiêu đề
                            const Text(
                              'Đời sống', // Tiêu đề của hình ảnh
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      GestureDetector(
                          onTap: () {
                            _launchURL(
                                'https://dbhomes.com.vn/chuyen-muc/tin-tuc/nha-dep/'); // Đường dẫn cần mở
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/Image/nhadep.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 1),
                              const Text(
                                'Nhà đẹp',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),

                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://dbhomes.com.vn/chuyen-muc/tin-tuc/noi-that/'); // Đường dẫn cần mở
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/Image/noithat.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 1),
                            const Text(
                              'Nội Thất',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://dbhomes.com.vn/chuyen-muc/tin-tuc/van-hoa/'); // Đường dẫn cần mở
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/Image/vanhoa.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 1),
                            const Text(
                              'Văn hóa',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://dbhomes.com.vn/chuyen-muc/tin-tuc/xu-huong/'); // Đường dẫn cần mở
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/Image/xuhuong.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 1),
                            const Text(
                              'Xu hướng',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenGallery extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const FullScreenGallery(
      {Key? key, required this.imageUrls, required this.initialIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: PageView.builder(
        itemCount: imageUrls.length,
        controller: PageController(
            initialPage: initialIndex), // Set initial image based on index
        itemBuilder: (context, index) {
          return Center(
            child: Image.asset(
              imageUrls[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
