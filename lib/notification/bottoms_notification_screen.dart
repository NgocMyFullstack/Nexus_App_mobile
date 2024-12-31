import 'package:flutter/material.dart';

class ButtomNotificationScreen extends StatelessWidget {
  const ButtomNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for notifications
    List<Map<String, String>> notifications = [
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'You better be ready! flight is tomorrow at 9am',
        'date': '24min ago',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'You have 1 invitation tonight at 17pm',
        'date': '2h 17min ago ',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'There is only 1 day left to reserve your hotel room!',
        'date': 'Yesterday, 17:35 pm',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'There is only 1 day left to reserve your hotel room!',
        'date': 'Yesterday, 17:35 pm',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'You better be ready! flight is tomorrow at 9am',
        'date': '24min ago',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'You have 1 invitation tonight at 17pm',
        'date': '2h 17min ago ',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'There is only 1 day left to reserve your hotel room!',
        'date': 'Yesterday, 17:35 pm',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'There is only 1 day left to reserve your hotel room!',
        'date': 'Yesterday, 17:35 pm',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'You better be ready! flight is tomorrow at 9am',
        'date': '24min ago',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'You have 1 invitation tonight at 17pm',
        'date': '2h 17min ago ',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'There is only 1 day left to reserve your hotel room!',
        'date': 'Yesterday, 17:35 pm',
      },
      {
        'image': 'assets/Avata/gr.png',
        'reminder': 'There is only 1 day left to reserve your hotel room!',
        'date': 'Yesterday, 17:35 pm',
      },
    ];

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
                    'Reminder: ${notification['reminder']}',
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
                    Navigator.of(context).maybePop();
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
