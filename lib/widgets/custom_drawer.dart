import 'package:db_app/main.dart';
import 'package:db_app/screens/project/construction_screen.dart';
import 'package:db_app/screens/project/finance_screen.dart';
import 'package:db_app/screens/project/information_screen.dart';
import 'package:db_app/screens/project/project_product_screen.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onSelectScreen;

  const CustomDrawer({Key? key, required this.onSelectScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: Drawer(
        backgroundColor: const Color.fromARGB(26, 0, 0, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDrawerItem(
                context,
                title: 'THÔNG TIN DỰ ÁN',
                onTap: () {
                  onSelectScreen(5);
                  Navigator.pop(context);
                },
              ),
              _buildDrawerItem(
                context,
                title: 'TIẾN ĐỘ DỰ ÁN',
                onTap: () {
                  onSelectScreen(6);
                  Navigator.pop(context);
                },
              ),
              _buildDrawerItem(
                context,
                title: 'TÀI CHÍNH DỰ ÁN',
                onTap: () {
                  onSelectScreen(7);
                  Navigator.pop(context);
                },
              ),
              _buildDrawerItem(
                context,
                title: 'HÀNG HÓA DỰ ÁN',
                onTap: () {
                  onSelectScreen(8);
                  Navigator.pop(context);
                },
              ),
              _buildDrawerItem(
                context,
                title: 'LƯU Ý - NHẮC NHỞ',
                onTap: () {
                  onSelectScreen(9);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(255, 164, 80, 1),
            fontSize: 26,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
