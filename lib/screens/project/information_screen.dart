import 'package:db_app/widgets/bottomnavbar.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'virtual_data.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Cần cài thư viện percent_indicator

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class PlanItem {
  final String title;
  final String total;
  final String approved;
  final String processing;
  final double progress; // Phần trăm tiến độ

  PlanItem({
    required this.title,
    required this.total,
    required this.approved,
    required this.processing,
    required this.progress, // Phần trăm tiến độ (giá trị từ 0.0 đến 1.0)
  });
}

class TodoListItem {
  final String content;
  final String date;

  TodoListItem({
    required this.content,
    required this.date,
  });
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    List<TodoListItem> todoitems = [
      TodoListItem(content: 'Hồ sơ nghiệm thu', date: '01 Nov'),
      TodoListItem(content: 'Biên bản họp thống nhất vấn đề', date: '01 Nov'),
      TodoListItem(
          content: 'Danh mục vật tư đệ trình phê duyệt', date: '01 Aug'),
      TodoListItem(content: ' Đề nghị thanh toán tạm ứng', date: '01 Aug'),
      TodoListItem(
          content: ' Hồ sơ tạm ứng/thanh toán - Bảo lãnh', date: '01 Aug'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/Icon/Vector2.svg',
            width: 15,
            height: 15,
            fit: BoxFit.contain,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Information',
          style: TextStyle(
            color: Color(0xFF17244A),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => Container(
              margin: const EdgeInsets.only(right: 5.5),
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
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 0.75,
                  color: const Color(0xFFD4D4D4),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 34.5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9).withOpacity(0.28),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            // Thực hiện logic tìm kiếm ở đây
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double baseWidth = constraints.maxWidth; // Độ rộng màn hình
              final double smallFontSize = baseWidth * 0.03; // Kích thước nhỏ
              final double mediumFontSize =
                  baseWidth * 0.04; // Kích thước trung bình
              final double largeFontSize = baseWidth * 0.05; // Kích thước lớn
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // tiêu đề project name
                  const SizedBox(height: 6),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Text(
                      'Project Name',
                      style: TextStyle(
                        fontSize: largeFontSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF17244A),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius:
                          BorderRadius.circular(8), // Border-radius of 8px
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(
                              187, 187, 187, 0.25), // Shadow color
                          blurRadius: 31, // Blur effect of the shadow
                          offset: const Offset(0, 5), // Position of the shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${tasks.length}',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Total ticket',
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  // fontWeight: FontWeight.bold,
                                  color: const Color(0xFF17244A),
                                ),
                              ),
                              SizedBox(height: 2),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 4.0,
                              percent: 1.0,
                              center: Text(
                                '100%',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  color: const Color(0xFF17244A),
                                ),
                              ),
                              progressColor:
                                  const Color.fromARGB(255, 255, 0, 0),
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF34A846),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Completed',
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  // fontWeight: FontWeight.bold,
                                  color: const Color(0xFF17244A),
                                ),
                              ),
                              SizedBox(height: 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // tiêu đề Processed Images
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: largeFontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF17244A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 1; i <= 4; i++)
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: InstaImageViewer(
                                  child: Image.asset(
                                      'assets/images/project_img_$i.png'),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // tiêu đề Record
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          'Record',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF17244A),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Khoảng cách giữa text và line
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.9, // Tỷ lệ width (90% màn hình)
                        height: 0.75, // Chiều cao của line
                        color: const Color(0xFFD4D4D4), // Màu của line
                      ),
                    ],
                  ),

                  Container(
                    height: 150.0, // Set a fixed height for the container
                    padding:
                        const EdgeInsets.all(8.0), // Padding inside the border
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(
                            0, 33, 149, 243), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: todoitems.map((todo) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              final double fontSizeContent =
                                  constraints.maxWidth *
                                      0.045; // Font size for content
                              final double fontSizeDate = constraints.maxWidth *
                                  0.04; // Font size for date
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(5),
                                color: const Color.fromARGB(42, 255, 255, 255),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            todo.content,
                                            style: TextStyle(
                                              fontSize: fontSizeContent,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                            ),
                                            softWrap: true,
                                          ),
                                          Text(
                                            'Due on: ${todo.date}',
                                            style: TextStyle(
                                              fontSize: fontSizeDate,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                            ),
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icon/Document 2.svg',
                                          width: 24.0,
                                          height: 24.0,
                                        ),
                                        const SizedBox(
                                            height:
                                                4), // Khoảng cách giữa icon và chữ
                                        const Text(
                                          'file',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: const Color(0xFF17244A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // tiêu đề Master List
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          'Master List',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF17244A),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Khoảng cách giữa text và line
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.9, // Tỷ lệ width (90% màn hình)
                        height: 0.75, // Chiều cao của line
                        color: const Color(0xFFD4D4D4), // Màu của line
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          0, 255, 255, 255), // Background color
                      borderRadius:
                          BorderRadius.circular(8), // Border-radius of 8px
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(
                              187, 187, 187, 0.25), // Shadow color
                          blurRadius: 31, // Blur effect of the shadow
                          offset: const Offset(0, 5), // Position of the shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Tiêu đề "Material"
                              Text(
                                '3D',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  // fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                      255, 255, 102, 0), // Màu cam như hình
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      10), // Khoảng cách giữa tiêu đề và vòng tròn
                              // Vòng tròn với phần trăm
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 4.0,
                                percent: 1.0, // Tương ứng với 75%
                                center: Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                progressColor: const Color.fromARGB(
                                    255, 255, 102, 0), // Màu cam
                                backgroundColor: Colors.white,// Màu xanh đậm
                              ),
                              const SizedBox(
                                  height:
                                      10), // Khoảng cách giữa vòng tròn và dòng "Total"
                              // Dòng "Total 20 | 25"
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '1 ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 102, 0), // Màu cam
                                    ),
                                  ),
                                  Text(
                                    '| ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Tiêu đề "Material"
                              Text(
                                'Shopdrawing',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  // fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                      255, 255, 102, 0), // Màu cam như hình
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      10), // Khoảng cách giữa tiêu đề và vòng tròn
                              // Vòng tròn với phần trăm
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 4.0,
                                percent: 1.0, // Tương ứng với 75%
                                center: Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                progressColor: const Color.fromARGB(
                                    255, 255, 102, 0), // Màu cam
                                backgroundColor: const Color.fromARGB(
                                    255, 0, 0, 50), // Màu xanh đậm
                              ),
                              const SizedBox(
                                  height:
                                      10), // Khoảng cách giữa vòng tròn và dòng "Total"
                              // Dòng "Total 20 | 25"
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '1 ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 102, 0), // Màu cam
                                    ),
                                  ),
                                  Text(
                                    '| ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Tiêu đề "Material"
                              Text(
                                'Material',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  // fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                      255, 255, 102, 0), // Màu cam như hình
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      10), // Khoảng cách giữa tiêu đề và vòng tròn
                              // Vòng tròn với phần trăm
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 4.0,
                                percent: 0.75, // Tương ứng với 75%
                                center: Text(
                                  '75%',
                                  style: TextStyle(
                                    fontSize: mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                progressColor: const Color.fromARGB(
                                    255, 255, 102, 0), // Màu cam
                                backgroundColor: const Color.fromARGB(
                                    255, 0, 0, 50), // Màu xanh đậm
                              ),
                              const SizedBox(
                                  height:
                                      10), // Khoảng cách giữa vòng tròn và dòng "Total"
                              // Dòng "Total 20 | 25"
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '20 ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 102, 0), // Màu cam
                                    ),
                                  ),
                                  Text(
                                    '| ',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '25',
                                    style: TextStyle(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
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
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
