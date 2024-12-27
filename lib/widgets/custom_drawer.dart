import 'package:db_app/screens/project/construction_screen.dart';
import 'package:db_app/screens/project/finance_screen.dart';
import 'package:db_app/screens/project/information_screen.dart';
import 'package:db_app/screens/project/project_product_screen.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InformationScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                title: 'TIẾN ĐỘ DỰ ÁN',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Construction(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                title: 'TÀI CHÍNH DỰ ÁN',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinanceScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                title: 'HÀNG HÓA DỰ ÁN',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectProductScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                title: 'LƯU Ý - NHẮC NHỞ',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketScreen(),
                    ),
                  );
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
