import 'package:db_app/screens/project/information_screen.dart';
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
  final String status;
  final double progress; // Phần trăm tiến độ

  PlanItem({
    required this.title,
    required this.total,
    required this.approved,
    required this.processing,
    required this.status,
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

class Construction extends StatelessWidget {
  const Construction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    List<PlanItem> planitems = [
      PlanItem(
          title: 'Pre Contruction',
          total: '10',
          approved: '07',
          processing: '21 Nov',
          status: 'Normal',
          progress: 0.75),
      PlanItem(
          title: 'Fit Out',
          total: '20',
          approved: '12',
          processing: '21 Aug',
          status: 'Late',
          progress: 0.6),
      PlanItem(
          title: 'Mep',
          total: '20',
          approved: '12',
          processing: '02 Oct',
          status: 'Waring',
          progress: 0.7),
      PlanItem(
          title: 'Furniture',
          total: '20',
          approved: '12',
          processing: '02 Oct',
          status: 'Waring',
          progress: 0.7),
    ];
    Color _getStatusColor(String status) {
      switch (status) {
        case 'Normal':
          return Colors.green;
        case 'Late':
          return Colors.red;
        case 'Waring':
          return Colors.orange;
        default:
          return Colors.grey;
      }
    }

    List<TodoListItem> todoitems = [
      TodoListItem(content: 'Bắn tấm nền MDF', date: '01 Aug'),
      TodoListItem(content: 'Thi công hệ sắt gia cố vách', date: '01 Aug'),
      TodoListItem(content: 'Hoàn thiện trần ốp gỗ laminate', date: '01 Aug'),
      TodoListItem(
          content: 'Bả xả, hoàn thiện sơn nước trần thạch cao, khe rèm',
          date: '01 Aug'),
    ];

    return Scaffold(
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
                        'Completed Today',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.05,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF17244A),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // Danh sách cuộn ngang
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Thẻ đầu tiên
                      Container(
                        width: 250, // Chiều rộng thẻ
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF17244A),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fit Out',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Location: 1st Floor',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Department: Bedroom',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Description: Chống Thấm Sàn WC',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Days To Complete:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '03',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/05',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 1.0, // Tiến độ hoàn thành (60%)
                              backgroundColor: Colors.white.withOpacity(0.2),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 255, 255, 255)),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Thẻ thứ hai với màu cam
                      Container(
                        width: 250, // Chiều rộng thẻ
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF5C3B),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MEP',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Location: 1st Floor',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Department: Bedroom',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Description: Chống Thấm Sàn ',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Days To Complete:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '05',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 233, 233, 233),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/05',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 1.0, // Tiến độ hoàn thành (50%)
                              backgroundColor: Colors.white.withOpacity(0.2),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 255, 255, 255)),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 250, // Chiều rộng thẻ
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF5C3B),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fur',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Location: 1st Floor',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Department: Bedroom',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'Description: Shelf MDF melamine ',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Days To Complete:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '05',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 233, 233, 233),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/05',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 1.0, // Tiến độ hoàn thành (50%)
                              backgroundColor: Colors.white.withOpacity(0.2),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 255, 255, 255)),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
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

                const SizedBox(height: 16),
                // Tiêu đề cho To-Do List
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Text(
                        'Ongoing Projects',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.05,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF17244A),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                // Danh sách cuộn dọc
                Container(
                  height: 400.0, // Set a fixed height for the container
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
                                    color: const Color.fromARGB(15, 22, 22, 22),
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
                                            color: const Color(0xFF17244A),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Total: ${project.total}',
                                          style: TextStyle(
                                            fontSize: fontSizeText,
                                            color: const Color(0xFF17244A),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Total Complete: ${project.approved}',
                                          style: TextStyle(
                                            fontSize: fontSizeText,
                                            color: const Color(0xFF17244A),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Due On: ${project.processing}',
                                          style: TextStyle(
                                            fontSize: fontSizeText,
                                            color: const Color(0xFF17244A),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            const Text(
                                              'Status: ',
                                              style: TextStyle(
                                                color: const Color(0xFF17244A),
                                              ),
                                            ),
                                            Text(
                                              project
                                                  .status, // Hiển thị trạng thái
                                              style: TextStyle(
                                                color: _getStatusColor(project
                                                    .status), // Gọi hàm đổi màu
                                              ),
                                            ),
                                          ],
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
                                            color: const Color(0xFF17244A),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
