import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

// Model to represent a project with a list of image paths
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
  // List of projects, each with its own images
  final List<Project> projects = [
    Project(
      name: 'D1 Mension',
      imagePaths: [
        'assets/Project/project1/110.jpg',
        'assets/Project/project1/115.jpg',
        'assets/Project/project1/117.jpg',
        'assets/Project/project1/119.jpg',
      ],
    ),
    Project(
      name: 'Đảo Kim Cương',
      imagePaths: [
        'assets/Project/project2/KHACHBEP_343 copy.jpg',
        'assets/Project/project2/KHACHBEP_PRONT.jpg',
        'assets/Project/project2/KHACHBEP3.jpg',
        'assets/Project/project2/MASTER_FRONT.jpg',
      ],
    ),
    Project(
      name: 'Define anh Hà',
      imagePaths: [
        'assets/Project/Project3/1.png',
        'assets/Project/Project3/2.png',
        'assets/Project/Project3/4.png',
        'assets/Project/Project3/10.png',
      ],
    ),
    Project(
      name: 'Define anh Hà',
      imagePaths: [
        'assets/Project/Project4/2.jpg',
        'assets/Project/Project4/3.jpg',
        'assets/Project/Project4/4.jpg',
        'assets/Project/Project4/6.jpg',
        'assets/Project/Project4/10.jpg',
      ],
    ),
    Project(
      name: 'Filmore',
      imagePaths: [
        'assets/Project/Project5/TIN00159.jpg',
        'assets/Project/Project5/TIN00379_la-phang-giuong__.jpg',
        'assets/Project/Project5/TIN00803_fix (1).jpg',
        'assets/Project/Project5/TIN01371.jpg',
      ],
    ),
    Project(
      name: 'Horizon Phú Mỹ Hưng',
      imagePaths: [
        'assets/Project/Project6/22.jpg',
        'assets/Project/Project6/23.jpg',
        'assets/Project/Project6/29.jpg',
        'assets/Project/Project6/The Horizon_A405_28.jpg',
      ],
    ),
    Project(
      name: 'Metropole',
      imagePaths: [
        'assets/Project/Project7/12 JBG00292-HDR.jpg',
        'assets/Project/Project7/28 JBG00393-HDR.jpg',
        'assets/Project/Project7/29 JBG00385-Enhanced-NR.jpg',
        'assets/Project/Project7/34 JBG00432-HDR.jpg',
      ],
    ),
    Project(
      name: 'MidTown',
      imagePaths: [
        'assets/Project/Project8/1.jpg',
        'assets/Project/Project8/10.07.24 MIDTOWN - MRS. KIM - Living roomjpg (3).jpg',
        'assets/Project/Project8/10.07.24 MIDTOWN - MRS. KIM - Living roomjpg (5).jpg',
        'assets/Project/Project8/10.07.24 MIDTOWN - MRS. KIM -master room (2).jpg',
      ],
    ),
  ];
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          Builder(
            builder: (context) => Container(
              margin: const EdgeInsets.only(right: 16.0),
              width: 50,
              height: 50,
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
                    Scaffold.of(context).openDrawer(); // Mở drawer
                  },
                ),
              ),
            ),
          ),
        ],
        title: const Text(
          'Tên khách hàng',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/Icon/Bell.svg',
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Mở drawer
          },
        ),
      ),
      drawer: const CustomDrawer(),
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
                      'PRODUCT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
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
                        color: Color.fromARGB(255, 0, 0, 0),
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
                        color: Color.fromARGB(255, 0, 0, 0),
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
                        color: Color.fromARGB(255, 0, 0, 0),
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
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
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
                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/Image/nhadep.jpg'),
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
                      ),
                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      Column(
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
                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      Column(
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
                      const SizedBox(
                          width: 16), // Khoảng cách giữa các khối hình ảnh
                      Column(
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
