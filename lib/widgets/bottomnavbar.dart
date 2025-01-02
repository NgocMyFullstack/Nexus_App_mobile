import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/project');
            break;
          case 2:
            Navigator.pushNamed(context, '/chat');
            break;
          case 3:
            Navigator.pushNamed(context, '/product');
            break;
          case 4:
            Navigator.pushNamed(context, '/customercate');
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      unselectedItemColor: const Color.fromARGB(255, 4, 0, 48),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/Icon/Home.svg',
            width: 25,
            height: 25,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Icon/Case.svg', width: 25, height: 25),
          label: 'Project',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Icon/Message.svg',
              width: 25, height: 25),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Icon/Bag2.svg', width: 25, height: 25),
          label: 'Product',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Icon/User.svg', width: 25, height: 25),
          label: 'Support',
        ),
      ],
    );
  }
}
