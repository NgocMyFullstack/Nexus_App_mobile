import 'package:db_app/notification/bottoms_notification_screen.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:db_app/screens/project/create_new_ticket_screen.dart';

class CustomerCare extends StatelessWidget {
  const CustomerCare({Key? key}) : super(key: key);

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
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          ),
        ],
        title: const Text(
          'Tên khách hàng',
          style: TextStyle(
            color: const Color(0xFF17244A),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ButtomNotificationScreen(),
              ),
            );
          },
        ),
      ),
      // drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/Avata/avata1.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Born in 1990',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Contact Information:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Phone: +1234567890'),
            const Text('Email: johndoe@example.com'),
            const Text('Address: 1234 Main Street, City, Country'),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.welcome);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
