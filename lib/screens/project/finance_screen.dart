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
        title: Padding(
          padding: const EdgeInsets.only(left: 19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Customer Name',
                style: TextStyle(
                  color: Color(0xFF17244A),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  height: 1.4,
                  letterSpacing: 0.5,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
              const Text(
                'Good Morning',
                style: TextStyle(
                  color: Color(0xFFEF5C3B),
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  height: 1.42857,
                  letterSpacing: 0.5,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ],
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
                    'assets/Icon/Bell.svg',
                    width: 30.0,
                    height: 30.0,
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
          preferredSize: const Size.fromHeight(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Container(
                  width: double.infinity,
                  height: 0.75,
                  color: const Color(0xFFD4D4D4),
                ),
              ),
            ],
          ),
        ),
      ),
      // drawer: const CustomDrawer(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 6),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total project value',
                          style: TextStyle(
                            color: Color(0xFF17244A),
                            fontFamily: 'Poppins',
                            fontSize: largeFontSize * 0.8,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.42857,
                            letterSpacing: 0.5,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '1.000.000.000',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: largeFontSize * 1.5,
                                color: Color(0xFFEF5C3B),
                              ),
                            ),
                            Text(
                              '   VND',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: largeFontSize * 0.8,
                                color: Color(0xFFEF5C3B),
                              ),
                            ),
                          ],
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
                          width: MediaQuery.of(context).size.width * 0.9,
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
                                'Đã Thanh Toán',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: largeFontSize * 0.8,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  height: 1.42857,
                                  letterSpacing: 0.5,
                                  color: Color(0xFF17244A),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '300M ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: largeFontSize * 1.5,
                                      color: const Color(0xFF00BBFF),
                                    ),
                                  ),
                                  Text(
                                    ' VND ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
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
                          width: MediaQuery.of(context).size.width * 0.9,
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
                                'Dự Thu',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: largeFontSize * 0.8,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  height: 1.42857,
                                  letterSpacing: 0.5,
                                  color: Color(0xFF17244A),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '200M ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: largeFontSize * 1.5,
                                      color: const Color(0xFF223F96),
                                    ),
                                  ),
                                  Text(
                                    ' VND ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
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
                        border: Border.all(color: Color(0xFF17244A), width: 1),
                      ),
                      child: Center(
                        child: CustomToggleButtons(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Container(
                    height: 400.0,
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
                                  constraints.maxWidth * 0.035;
                              final double fontSizeDate =
                                  constraints.maxWidth * 0.025;

                              final bool isPaymentDue =
                                  todo.content == 'Đợt Dự Thu';

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
                                    const SizedBox(width: 1),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            todo.content,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: fontSizeContent * 1.1,
                                              color: isPaymentDue
                                                  ? const Color(0xFFFF8903)
                                                  : const Color.fromARGB(
                                                      255, 0, 0, 0),
                                            ),
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 0.5),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                ' ${todo.date}',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: fontSizeDate,
                                                  color: isPaymentDue
                                                      ? const Color(0xFFFF8903)
                                                      : const Color(0xFFEF5C3B),
                                                ),
                                                softWrap: false,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                ' | ',
                                                style: TextStyle(
                                                  fontSize: fontSizeDate * 1.6,
                                                  color: const Color.fromARGB(
                                                      143, 155, 155, 155),
                                                ),
                                                softWrap: true,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ' ${todo.money}',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: fontSizeDate,
                                                  color: isPaymentDue
                                                      ? const Color(0xFFFF8903)
                                                      : const Color(0xFFEF5C3B),
                                                ),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
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
  final double largeFontSize = 16.0;
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
                    ? const Color(0xFF17244A)
                    : const Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(20), // Bo góc cho từng nút
              ),
              child: Text(
                _options[index],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: largeFontSize * 0.8,
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
