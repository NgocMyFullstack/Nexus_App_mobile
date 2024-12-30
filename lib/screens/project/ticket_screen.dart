import 'package:db_app/routes/app_routes.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:db_app/screens/project/create_new_ticket_screen.dart';
import 'package:db_app/screens/project/task_detail_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'task_list.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Cần cài thư viện percent_indicator
import '../../main.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  void _deleteTask(Map<String, dynamic> task) {
    setState(() {
      // Xóa ticket từ danh sách
      tasks.remove(task);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ticket đã được xóa!")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
          'TICKET',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Column(
            children: [
              // Đường kẻ ngang
              Container(
                width: 366.0, // Chiều rộng của đường kẻ
                height: 0.75, // Chiều cao của đường kẻ
                color: const Color(0xFFD4D4D4), // Màu sắc của đường kẻ
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: 366.0,
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
      // drawer: const CustomDrawer(),
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
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
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
                                'TOTAL TICKET',
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
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
                              percent: 0.8,
                              center: Text(
                                '80%',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
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
                                  color: const Color(0xFF00D09E),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'COMPLETED',
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
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
                      'Todays Processed Images',
                      style: TextStyle(
                        fontSize: largeFontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 1; i <= 3; i++)
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
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Text(
                      'Todays Processed Images',
                      style: TextStyle(
                        fontSize: largeFontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: tasks.map((task) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TaskDetailScreen(task: task),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF17244A), // Background color
                            border: Border.all(
                              color: const Color(0xFF17244A), // Border color
                              width: 2.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                8.0), // Optional: rounded corners
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 16),
                                    Text(
                                      task["taskTitle"].toString(),
                                      style: TextStyle(
                                        fontSize: mediumFontSize,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      softWrap: true,
                                    ),
                                    Text(
                                      'Create Date: ${task["create_date"]}',
                                      style: TextStyle(
                                        fontSize: mediumFontSize,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
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
                                              task["is_completed"] =
                                                  !task["is_completed"];
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            task["is_completed"]
                                                ? 'assets/Icon/checkbox.svg' // Replace with the path to your "selected" icon
                                                : 'assets/Icon/checkbox_checked.svg', // Replace with the path to your "unselected" icon
                                            width:
                                                24, // Adjust the size as needed
                                            height:
                                                24, // Adjust the size as needed
                                            color: Colors.white, // Icon color
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Text(
                                            'Completed',
                                            style: TextStyle(
                                              fontSize: smallFontSize,
                                              color: Colors.white,
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
                                              task["is_approved"] =
                                                  !task["is_approved"];
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            task["is_approved"]
                                                ? 'assets/Icon/checkbox_checked.svg' // Replace with the path to your "selected" icon
                                                : 'assets/Icon/checkbox.svg', // Replace with the path to your "unselected" icon
                                            width:
                                                24, // Adjust the size as needed
                                            height:
                                                24, // Adjust the size as needed
                                            color: Colors.white, // Icon color
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Text(
                                            'Approved',
                                            style: TextStyle(
                                              fontSize: smallFontSize,
                                              color: Colors.white,
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
                                      onTap: () => _deleteTask(task),
                                      child: Column(
                                        mainAxisSize: MainAxisSize
                                            .min, // Ensure the column only takes up as much space as needed
                                        children: [
                                          SvgPicture.asset(
                                            'assets/Icon/Coffee.svg', // Path to your Coffee.svg
                                            width:
                                                24, // Adjust the size as needed
                                            height:
                                                24, // Adjust the size as needed
                                            color: Colors.white, // Icon color
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                fontSize: smallFontSize,
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
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
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
                'Add Ticket',
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
