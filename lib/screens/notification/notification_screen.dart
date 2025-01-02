import 'package:db_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for notifications
    List<Map<String, String>> notifications = [
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'Bạn có đợt dự thu vào ngày 15 tháng 06 năm 2024',
        'date': 'now',
        'route': AppRoutes.financescreen,
      }
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          ),
        ],
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF17244A),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: notifications.map((notification) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    notification['image']!,
                    width: 60,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Thông báo: ${notification['reminder']}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    notification['date']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed(notification['route']!);
                    Navigator.of(context).pushNamed(AppRoutes.financescreen);
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
