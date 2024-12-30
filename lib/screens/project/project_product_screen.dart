import 'package:db_app/main.dart';
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
import 'package:percent_indicator/percent_indicator.dart';

class ProjectProductScreen extends StatefulWidget {
  const ProjectProductScreen({super.key});

  @override
  _ProjectProductScreenState createState() => _ProjectProductScreenState();
}

class PlanItem {
  final String title;
  final String total;
  final String approved;
  final String processing;
  final double progress;

  PlanItem({
    required this.title,
    required this.total,
    required this.approved,
    required this.processing,
    required this.progress,
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

class ProjectProductScreenState extends StatefulWidget {
  const ProjectProductScreenState({super.key});

  @override
  _ProjectProductScreenState createState() => _ProjectProductScreenState();
}

class _ProjectProductScreenState extends State<ProjectProductScreen> {
  bool isCompletedSelected = false;
  bool isApprovedSelected = false;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    List<TodoListItem> todoitems = [
      TodoListItem(content: 'Công tác chuẩn bị hồ sơ', date: '01 Oct'),
      TodoListItem(content: 'Phê duyệt bản vẽ', date: '01 Oct'),
      TodoListItem(content: 'Trình duyệt mẫu', date: '01 oct'),
      TodoListItem(content: ' Đặt hàng theo mẫu duyệtg', date: '01 oct'),
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
        title: const Text(
          'Pre Contruction',
          style: TextStyle(
            color: const Color(0xFF17244A),
            fontWeight: FontWeight.bold,
          ),
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
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double baseWidth = constraints.maxWidth;
              final double smallFontSize = baseWidth * 0.03;
              final double mediumFontSize = baseWidth * 0.04;
              final double largeFontSize = baseWidth * 0.05;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  RadioExamplee
                  const SizedBox(height: 6),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 9.0),
                    child: RadioExample(),
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
                        Builder(
                          builder: (context) {
                            double screenWidth =
                                MediaQuery.of(context).size.width;

                            return Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(0, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/Icon/calendarremove.svg',
                                      width: 30.0,
                                      height: 30.0,
                                    ),
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );

                                      if (pickedDate != null) {
                                        setState(() {
                                          _selectedDate = pickedDate;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 10.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Due Date",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.045,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF17244A),
                                        ),
                                      ),
                                      Text(
                                        _selectedDate != null
                                            ? "${_selectedDate!.day}/${_selectedDate!.month}"
                                            : "No date ",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 4.0,
                              percent: 0.7,
                              center: Text(
                                '70%',
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
                                'Progress Completed',
                                style: TextStyle(
                                  fontSize: smallFontSize * 1.4,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF17244A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // tiêu đề To Do List
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          'To Do List',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.bold,
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
                    height: 300.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(0, 33, 149, 243),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: todoitems.map((todo) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              final double fontSizeContent =
                                  constraints.maxWidth * 0.045;
                              final double fontSizeDate =
                                  constraints.maxWidth * 0.04;
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Tooltip(
                                          message: 'Completed',
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    // Toggle only the completed status
                                                    isCompletedSelected =
                                                        !isCompletedSelected;
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                  isCompletedSelected
                                                      ? 'assets/Icon/checkbox.svg'
                                                      : 'assets/Icon/checkbox_checked.svg',
                                                  width: 24,
                                                  height: 24,
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                child: Text(
                                                  'Completed',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Tooltip(
                                          message: 'Approved',
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    // Toggle only the approved status
                                                    isApprovedSelected =
                                                        !isApprovedSelected;
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                  isApprovedSelected
                                                      ? 'assets/Icon/checkbox_checked.svg' // Replace with the path to your "selected" icon
                                                      : 'assets/Icon/checkbox.svg', // Replace with the path to your "unselected" icon
                                                  width:
                                                      24, // Adjust the size as needed
                                                  height:
                                                      24, // Adjust the size as needed
                                                  color: const Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0), // Icon color
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                child: Text(
                                                  'Approved',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Tooltip(
                                          message: 'Delete',
                                          child: GestureDetector(
                                            // onTap: () => _deleteTask(task),
                                            child: Column(
                                              mainAxisSize: MainAxisSize
                                                  .min, // Ensure the column only takes up as much space as needed
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/Icon/Document 2.svg', // Path to your Coffee.svg
                                                  width:
                                                      24, // Adjust the size as needed
                                                  height:
                                                      24, // Adjust the size as needed
                                                  color: const Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0), // Icon color
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 2.0),
                                                  child: Text(
                                                    'Report',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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

                  // tiêu đề Sub Task of To Do List
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          'Sub Task of To Do List',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.bold,
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
                  // Container(
                  //   margin: const EdgeInsets.all(10),
                  //   padding: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: const Color.fromARGB(
                  //         0, 255, 255, 255), // Background color
                  //     borderRadius:
                  //         BorderRadius.circular(8), // Border-radius of 8px
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: const Color.fromRGBO(
                  //             187, 187, 187, 0.25), // Shadow color
                  //         blurRadius: 31, // Blur effect of the shadow
                  //         offset: const Offset(0, 5), // Position of the shadow
                  //       ),
                  //     ],
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         flex: 1,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             // Tiêu đề "Material"
                  //             Text(
                  //               '3D',
                  //               style: TextStyle(
                  //                 fontSize: mediumFontSize,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: const Color.fromARGB(
                  //                     255, 255, 102, 0), // Màu cam như hình
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //                 height:
                  //                     10), // Khoảng cách giữa tiêu đề và vòng tròn
                  //             // Vòng tròn với phần trăm
                  //             CircularPercentIndicator(
                  //               radius: 40.0,
                  //               lineWidth: 4.0,
                  //               percent: 1.0, // Tương ứng với 75%
                  //               center: Text(
                  //                 '100%',
                  //                 style: TextStyle(
                  //                   fontSize: mediumFontSize,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: const Color.fromARGB(255, 0, 0, 0),
                  //                 ),
                  //               ),
                  //               progressColor: const Color.fromARGB(
                  //                   255, 255, 102, 0), // Màu cam
                  //               backgroundColor: const Color.fromARGB(
                  //                   255, 0, 0, 50), // Màu xanh đậm
                  //             ),
                  //             const SizedBox(
                  //                 height:
                  //                     10), // Khoảng cách giữa vòng tròn và dòng "Total"
                  //             // Dòng "Total 20 | 25"
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text(
                  //                   'Total ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '1 ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: const Color.fromARGB(
                  //                         255, 255, 102, 0), // Màu cam
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '| ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '1',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(width: 10),
                  //       Expanded(
                  //         flex: 1,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             // Tiêu đề "Material"
                  //             Text(
                  //               'Shopdrawing',
                  //               style: TextStyle(
                  //                 fontSize: mediumFontSize,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: const Color.fromARGB(
                  //                     255, 255, 102, 0), // Màu cam như hình
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //                 height:
                  //                     10), // Khoảng cách giữa tiêu đề và vòng tròn
                  //             // Vòng tròn với phần trăm
                  //             CircularPercentIndicator(
                  //               radius: 40.0,
                  //               lineWidth: 4.0,
                  //               percent: 1.0, // Tương ứng với 75%
                  //               center: Text(
                  //                 '100%',
                  //                 style: TextStyle(
                  //                   fontSize: mediumFontSize,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: const Color.fromARGB(255, 0, 0, 0),
                  //                 ),
                  //               ),
                  //               progressColor: const Color.fromARGB(
                  //                   255, 255, 102, 0), // Màu cam
                  //               backgroundColor: const Color.fromARGB(
                  //                   255, 0, 0, 50), // Màu xanh đậm
                  //             ),
                  //             const SizedBox(
                  //                 height:
                  //                     10), // Khoảng cách giữa vòng tròn và dòng "Total"
                  //             // Dòng "Total 20 | 25"
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text(
                  //                   'Total ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '1 ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: const Color.fromARGB(
                  //                         255, 255, 102, 0), // Màu cam
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '| ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '1',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(width: 10),
                  //       Expanded(
                  //         flex: 1,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             // Tiêu đề "Material"
                  //             Text(
                  //               'Material',
                  //               style: TextStyle(
                  //                 fontSize: mediumFontSize,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: const Color.fromARGB(
                  //                     255, 255, 102, 0), // Màu cam như hình
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //                 height:
                  //                     10), // Khoảng cách giữa tiêu đề và vòng tròn
                  //             // Vòng tròn với phần trăm
                  //             CircularPercentIndicator(
                  //               radius: 40.0,
                  //               lineWidth: 4.0,
                  //               percent: 0.75, // Tương ứng với 75%
                  //               center: Text(
                  //                 '75%',
                  //                 style: TextStyle(
                  //                   fontSize: mediumFontSize,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: const Color.fromARGB(255, 0, 0, 0),
                  //                 ),
                  //               ),
                  //               progressColor: const Color.fromARGB(
                  //                   255, 255, 102, 0), // Màu cam
                  //               backgroundColor: const Color.fromARGB(
                  //                   255, 0, 0, 50), // Màu xanh đậm
                  //             ),
                  //             const SizedBox(
                  //                 height:
                  //                     10), // Khoảng cách giữa vòng tròn và dòng "Total"
                  //             // Dòng "Total 20 | 25"
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text(
                  //                   'Total ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '20 ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: const Color.fromARGB(
                  //                         255, 255, 102, 0), // Màu cam
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '| ',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '25',
                  //                   style: TextStyle(
                  //                     fontSize: smallFontSize,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: const Color.fromARGB(255, 0, 0, 0),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(204, 202, 202, 0.474),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
                30), // Adjust the radius for the top-left corner
            topRight: Radius.circular(
                30), // Adjust the radius for the top-right corner
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home, // Route của trang ban đầu
                  (Route<dynamic> route) => false, // Xóa tất cả route trước đó
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
              ),
              child: SvgPicture.asset(
                'assets/Icon/logo-dbhome.svg',
                width: 25,
                height: 25,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateNewTicketScreen()));
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
              ),
              child: const Text(
                'CATEGORIES',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(initialIndex: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
              ),
              child: const Icon(
                Icons.settings,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioExample extends StatefulWidget {
  @override
  _RadioExampleState createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double smallFontSize = baseWidth * 0.03;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 20.0,
          children: [
            for (var option in [
              {'value': 1, 'label': 'All'},
              {'value': 2, 'label': 'Completed'},
              {'value': 3, 'label': 'Processing'},
              {'value': 4, 'label': 'Late'},
              {'value': 5, 'label': 'Early'},
            ])
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<int>(
                    value: option['value'] as int,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                  Text(
                    option['label'] as String,
                    style: TextStyle(
                      fontSize:
                          smallFontSize, // Sử dụng kích thước chữ dựa trên baseWidth
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
