import 'package:db_app/screens/notification/notification_screen.dart';
import 'package:db_app/screens/project/construction_screen.dart';
import 'package:db_app/screens/project/finance_screen.dart';
import 'package:db_app/screens/project/information_screen.dart';
import 'package:db_app/screens/project/project_product_screen.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:db_app/widgets/custom_drawer.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

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
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.project: (_) => const ProjectScreen(),
        AppRoutes.chat: (_) => const Chat(),
        AppRoutes.product: (_) => const Product(),
        AppRoutes.customercate: (_) => const CustomerCare(),
        AppRoutes.informationscreen: (_) => const InformationScreen(),
        AppRoutes.financescreen: (_) => const FinanceScreen(),
        AppRoutes.projectproductscreen: (_) => const ProjectProductScreen(),
        AppRoutes.notificationscreen: (_) => const NotificationScreen(),
      },
    );
  }
}
