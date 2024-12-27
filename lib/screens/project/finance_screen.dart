import 'package:db_app/routes/app_routes.dart';
import 'package:db_app/screens/home_screen.dart';
import 'package:db_app/screens/project/construction_screen.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:db_app/screens/project/create_new_ticket_screen.dart';
import 'package:db_app/screens/project/task_detail_screen.dart';
import 'package:db_app/screens/project/project_screen.dart';
import 'package:flutter_svg/svg.dart';
import '../project/task_list.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Cần cài thư viện percent_indicator

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
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
  final String money;

  TodoListItem({
    required this.content,
    required this.date,
    required this.money,
  });
}

class _FinanceScreenState extends State<FinanceScreen> {
  @override
  Widget build(BuildContext context) {
    List<TodoListItem> todoitems = [
      TodoListItem(
          content: 'Phase 01', date: '01 April 2024', money: '100M VND'),
      TodoListItem(
          content: 'Phase 02', date: '25 April 2024', money: '100M VND'),
      TodoListItem(content: 'Phase 03', date: '15 May 2024', money: '100M VND'),
      TodoListItem(
          content: ' Phase 04', date: '30 April 2024', money: '100M VND'),
      TodoListItem(
          content: 'Đợt Dự Thu', date: '15 June 2024', money: '200M VND'),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/Icon/Vector2.svg',
            width: 15.0,
            height: 15.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Customer Name',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4), // Tạo khoảng cách giữa hai dòng
            const Text(
              'Good Morning',
              style: TextStyle(
                color: Color(0xFFEF5C3B), // Màu #EF5C3B
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => Container(
              margin: const EdgeInsets.only(right: 16.0),
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/Icon/Burger.svg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  onPressed: () {
                    Scaffold.of(context)
                        .openDrawer(); // Mở Drawer khi nhấn biểu tượng Burger
                  },
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Column(
            children: [
              // Đường kẻ ngang
              Container(
                width: 366.0, // Chiều rộng của đường kẻ
                height: 0.75, // Chiều cao của đường kẻ
                color: const Color(0xFFD4D4D4), // Màu sắc của đường kẻ
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              //   child: Container(
              //     width: 366.0,
              //     height: 34.5,
              //     decoration: BoxDecoration(
              //       color: const Color(0xFFD9D9D9).withOpacity(0.28),
              //       borderRadius: BorderRadius.circular(6.0),
              //     ),
              //     child: Row(
              //       children: [
              //         const Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 8.0),
              //           child: Icon(
              //             Icons.search,
              //             color: Colors.grey,
              //           ),
              //         ),
              //         Expanded(
              //           child: TextField(
              //             decoration: const InputDecoration(
              //               hintText: 'Search...',
              //               border: InputBorder.none,
              //               hintStyle: TextStyle(color: Colors.grey),
              //             ),
              //             onChanged: (value) {
              //               // Thực hiện logic tìm kiếm ở đây
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
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
                    width: MediaQuery.of(context).size.width *
                        0.9, // Chiều rộng là 90% màn hình
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(187, 187, 187, 0.25),
                          blurRadius: 31,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Total project value',
                          style: TextStyle(
                            fontSize: largeFontSize,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1.000.000.000 VND',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: largeFontSize * 1.5,
                            color: Color(0xFFEF5C3B),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container thứ nhất
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.fromLTRB(17, 10, 17, 10),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color.fromRGBO(187, 187, 187, 0.25),
                                blurRadius: 31,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'đã thanh toán',
                                style: TextStyle(
                                  // Loại bỏ const ở đây
                                  fontSize: largeFontSize * 0.8,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '300M ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: largeFontSize * 1.0,
                                      color: const Color(0xFF00BBFF),
                                    ),
                                  ),
                                  Text(
                                    'VND ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: largeFontSize * 0.8,
                                      color: const Color(0xFF00BBFF),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container thứ hai
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.fromLTRB(17, 10, 17, 10),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color.fromRGBO(187, 187, 187, 0.25),
                                blurRadius: 31,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dự thu',
                                style: TextStyle(
                                  fontSize: largeFontSize * 0.8,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '200M ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: largeFontSize * 1.0,
                                      color: const Color(0xFF223F96),
                                    ),
                                  ),
                                  Text(
                                    'VND ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: largeFontSize * 0.8,
                                      color: const Color(0xFF223F96),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Đường line
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),

                  // buttom
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 320,
                      height: 63,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(0, 238, 238, 238),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.indigo, width: 2),
                      ),
                      child: Center(
                        child: CustomToggleButtons(),
                      ),
                    ),
                  ),

                  // tiêu đề Master List
                  const SizedBox(height: 16),
                  Container(
                    height: 400.0, // Set a fixed height for the container
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
                                      0.035; // Font size for content
                              final double fontSizeDate = constraints.maxWidth *
                                  0.03; // Font size for date
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(5),
                                color: const Color.fromARGB(42, 255, 255, 255),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icon/Coins.svg',
                                          width: 27.0,
                                          height: 27.0,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            todo.content,
                                            style: TextStyle(
                                              fontSize: fontSizeContent * 1.1,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                            ),
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' ${todo.date}',
                                            style: TextStyle(
                                              fontSize: fontSizeDate,
                                              color: const Color.fromARGB(
                                                  255, 255, 132, 0),
                                            ),
                                            softWrap: true,
                                          ),
                                          Text(
                                            ' |',
                                            style: TextStyle(
                                              fontSize: fontSizeDate * 1.0,
                                              color: const Color.fromARGB(
                                                  143, 155, 155, 155),
                                            ),
                                            softWrap: true,
                                          ),
                                          Text(
                                            ' ${todo.money}',
                                            style: TextStyle(
                                              fontSize: fontSizeDate,
                                              color: const Color.fromARGB(
                                                  255, 255, 132, 0),
                                            ),
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({Key? key}) : super(key: key);

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  int _selectedIndex = 2; // Mặc định chọn "Monthly"

  final List<String> _options = ["Daily", "Weekly", "Monthly"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_options.length, (index) {
        final isSelected = _selectedIndex == index;
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8), // Khoảng cách giữa các nút
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(255, 2, 19, 117)
                    : const Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(20), // Bo góc cho từng nút
              ),
              child: Text(
                _options[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
