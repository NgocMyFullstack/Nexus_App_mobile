import 'package:db_app/screens/project/construction_screen.dart';
import 'package:db_app/screens/project/finance_screen.dart';
import 'package:db_app/screens/project/information_screen.dart';
import 'package:db_app/screens/project/task_detail_screen.dart';
import 'package:db_app/screens/project/task_list.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:db_app/screens/project/create_new_ticket_screen.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Cần cài thư viện percent_indicator
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../routes/app_routes.dart';

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

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool isCompletedSelected = false; // Trạng thái của nút Completed
  bool isApprovedSelected = false; // Trạng thái của nút Approved

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
    // Dữ liệu mẫu
    List<PlanItem> planitems = [
      PlanItem(
          title: '3D', total: '1', approved: '1', processing: '0', progress: 1),
      PlanItem(
          title: 'MATERIAL',
          total: '25',
          approved: '20',
          processing: '2',
          progress: 0.75),
      PlanItem(
          title: 'SHOP DRAWINGS',
          total: '1',
          approved: '1',
          processing: '1',
          progress: 0.95),
      PlanItem(
          title: 'DOCUMENTS',
          total: '1',
          approved: '1',
          processing: '1',
          progress: 1),
    ];

    List<TodoListItem> todoitems = [
      TodoListItem(content: 'Bắn tấm nền MDF', date: '01 Aug'),
      TodoListItem(content: 'Thi công hệ sắt gia cố vách', date: '01 Aug'),
      TodoListItem(content: 'Hoàn thiện trần ốp gỗ laminate', date: '01 Aug'),
      TodoListItem(
          content: 'Bả xả, hoàn thiện sơn nước trần thạch cao, khe rèm',
          date: '01 Aug'),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70, // Điều chỉnh chiều cao của AppBar
        leading: Padding(
          padding: const EdgeInsets.only(left: 0), // Thêm padding cho leading
          child: IconButton(
            icon: CircleAvatar(
              radius: 35, // Điều chỉnh bán kính của avatar
              backgroundImage:
                  AssetImage('assets/Avata/avata1.png'), // Hình avatar
              backgroundColor: Colors.transparent, // Màu nền trong suốt
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.customercate);
            },
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PROJECT NAME',
              style: TextStyle(
                color: Color.fromARGB(203, 255, 0, 0),
                fontSize: 18,
              ),
            ),
            Text(
              'Customer Name',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
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
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tiêu đề cho danh sách cuộn ngang
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Text(
                        'Yesterdays Project Gallery',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // Danh sách cuộn ngang
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: InstaImageViewer(
                              child: Image.asset(
                                  'assets/images/project_img_1.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: InstaImageViewer(
                              child: Image.asset(
                                  'assets/images/project_img_2.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: InstaImageViewer(
                              child: Image.asset(
                                  'assets/images/project_img_3.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Danh sách cuộn dọc
                Container(
                  height: 300.0, // Set a fixed height for the container
                  padding:
                      const EdgeInsets.all(8.0), // Padding inside the border
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(0, 255, 0, 0), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(
                        10.0), // Optional: for rounded corners
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: planitems.map((project) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            final double fontSizeTitle =
                                constraints.maxWidth * 0.045;
                            final double fontSizeText =
                                constraints.maxWidth * 0.035;
                            return Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                    255, 255, 255, 255), // Màu nền
                                borderRadius:
                                    BorderRadius.circular(8.0), // Bo góc
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                        15, 22, 22, 22), // Màu bóng (rgba)
                                    offset: const Offset(
                                        0, 2), // Độ lệch bóng (x, y)
                                    blurRadius: 10.0, // Độ mờ của bóng
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // Cột thông tin dự án
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          project.title,
                                          style: TextStyle(
                                            fontSize: fontSizeTitle,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Total : ${project.total}',
                                          style:
                                              TextStyle(fontSize: fontSizeText),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Approved: ${project.approved}',
                                          style:
                                              TextStyle(fontSize: fontSizeText),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Processing: ${project.processing}',
                                          style:
                                              TextStyle(fontSize: fontSizeText),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),

                                  // Cột tiến độ (vòng tròn)
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: CircularPercentIndicator(
                                        radius: 50.0,
                                        lineWidth: 4.0,
                                        percent: project.progress,
                                        center: Text(
                                          '${(project.progress * 100).toStringAsFixed(0)}%',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        progressColor: const Color.fromARGB(
                                            255, 255, 0, 0),
                                        backgroundColor:
                                            const Color.fromARGB(255, 0, 0, 0),
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

                const SizedBox(height: 15),
                // Tiêu đề cho To-Do List
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Text(
                        'To-Do List',
                        style: TextStyle(
                          fontSize: constraints.maxWidth *
                              0.05, // Điều chỉnh font chữ
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                // Danh sách cuộn dọc

                Container(
                  height: 250.0, // Set a fixed height for the container
                  padding:
                      const EdgeInsets.all(8.0), // Padding inside the border
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          const Color.fromARGB(0, 33, 149, 243), // Border color
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
                              padding: const EdgeInsets.all(10),
                              color: const Color.fromARGB(255, 255, 255, 255),
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
                                  SvgPicture.asset(
                                    'assets/Icon/check1.svg',
                                    width: 24.0,
                                    height: 24.0,
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),

                // tiêu đề Processed Images
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Text(
                        'Todays Processed Images',
                        style: TextStyle(
                          fontSize: constraints.maxWidth *
                              0.05, // Điều chỉnh font chữ
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),

                Column(
                  children: tasks.map((task) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailScreen(task: task),
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
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    softWrap: true,
                                  ),
                                  Text(
                                    'Due One: ${task["create_date"]}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                            fontSize: 12,
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
                                          color: Colors.white, // Icon color
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Text(
                                          'Approved',
                                          style: TextStyle(
                                            fontSize: 12,
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
                                              fontSize: 12,
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
            ),
          ),
        ),
      ),
    );
  }
}
