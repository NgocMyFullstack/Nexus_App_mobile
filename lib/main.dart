import 'package:db_app/screens/project/finance_screen.dart';
import 'package:db_app/screens/project/information_screen.dart';
import 'package:db_app/screens/project/project_product_screen.dart';
import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'widgets/bottomnavbar.dart';
import 'screens/home_screen.dart';
import 'screens/project/project_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/customer_care_screen.dart';
import 'screens/product_screen.dart';
import 'screens/login/welcome_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<_MyHomePageState> homePageKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (_) => WelcomeScreen(),
        AppRoutes.login: (_) => LoginScreen(),
        AppRoutes.signup: (_) => SignUpScreen(),
        AppRoutes.home: (_) => const MyHomePage(
              initialIndex: 0,
            ),
        AppRoutes.project: (_) => const ProjectScreen(),
        AppRoutes.chat: (_) => const Chat(),
        AppRoutes.product: (_) => const Product(),
        AppRoutes.customercate: (_) => const CustomerCare(),
        AppRoutes.informationscreen: (_) => const InformationScreen(),
        AppRoutes.financescreen: (_) => const FinanceScreen(),
        AppRoutes.projectproductscreen: (_) => const ProjectProductScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int initialIndex;

  const MyHomePage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Khởi tạo từ tham số
  }

  final List<Widget> _screens = const [
    HomeScreen(),
    ProjectScreen(),
    Chat(),
    Product(),
    CustomerCare(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
