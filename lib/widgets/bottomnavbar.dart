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
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
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
          label: 'Home ',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Icon/Case.svg', width: 25, height: 25),
          label: 'ProJect',
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
          label: 'Support ',
        ),
      ],
    );
  }
}
