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
        AppRoutes.notificationscreen: (_) => const NotificationScreen(),
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
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = const [
    HomeScreen(),
    ProjectScreen(),
    Chat(),
    Product(),
    CustomerCare(),
  ];

  final List<Widget> _specialScreens = const [
    InformationScreen(),
    Construction(),
    FinanceScreen(),
    ProjectProductScreen(),
    TicketScreen(),
    NotificationScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onSelectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSpecialScreen = _selectedIndex >= 5;
    final bool isTicketScreen = _selectedIndex >= 8;

    PreferredSizeWidget? appBar;
    switch (_selectedIndex) {
      case 0:
        appBar = AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          leading: Builder(
            builder: (context) => Container(
              margin: const EdgeInsets.only(left: 5.5),
              width: 70,
              height: 70,
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
          title: const Text(
            'Tên khách hàng',
            style: TextStyle(
              color: Color(0xFF17244A),
            ),
          ),
          actions: [
            IconButton(
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
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 1:
        appBar = AppBar(
          toolbarHeight: 70,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/Avata/avata1.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Project Name',
                    style: TextStyle(
                      color: Color.fromARGB(203, 255, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Customer name',
                    style: TextStyle(
                      color: Color(0xFF17244A),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
              ],
            ),
          ),
        );
        break;

      case 2:
        appBar = AppBar(
          toolbarHeight: 70,
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
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
          title: const Text(
            'Tên khách hàng',
            style: TextStyle(
              color: Color(0xFF17244A),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
              ],
            ),
          ),
        );

        break;
      case 3:
        appBar = AppBar(
          toolbarHeight: 70,
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
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
          title: const Text(
            'Tên khách hàng',
            style: TextStyle(
              color: Color(0xFF17244A),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
              ],
            ),
          ),
        );

        break;

      case 4:
        appBar = AppBar(
          toolbarHeight: 70,
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
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
          title: const Text(
            'Tên khách hàng',
            style: TextStyle(
              color: Color(0xFF17244A),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
              ],
            ),
          ),
        );

        break;
      case 5:
        appBar = AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/Icon/Vector2.svg',
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (Route<dynamic> route) => false,
              );
            },
          ),
          title: const Text(
            'Information',
            style: TextStyle(
              color: Color(0xFF17244A),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 34.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9).withOpacity(0.28),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (value) {
                              // Thực hiện logic tìm kiếm ở đây
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 6:
        appBar = AppBar(
          toolbarHeight: 70,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/Avata/avata1.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Project Name',
                    style: TextStyle(
                      color: Color.fromARGB(203, 255, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Customer name',
                    style: TextStyle(
                      color: Color(0xFF17244A),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 34.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9).withOpacity(0.28),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (value) {
                              // Thực hiện logic tìm kiếm ở đây
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 7:
        appBar = AppBar(
          toolbarHeight: 70,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          title: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Customer Name',
                  style: TextStyle(
                    color: Color(0xFF17244A),
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    height: 1.4,
                    letterSpacing: 0.5,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
                const Text(
                  'Good Morning',
                  style: TextStyle(
                    color: Color(0xFFEF5C3B),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.42857,
                    letterSpacing: 0.5,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 16.0),
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/Icon/Bell.svg',
                      width: 30.0,
                      height: 30.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 8:
        appBar = AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/Icon/Vector2.svg',
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (Route<dynamic> route) => false,
              );
            },
          ),
          title: const Text(
            'HÀNG HÓA DỰ ÁN',
            style: TextStyle(
              color: Color(0xFF17244A),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 34.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9).withOpacity(0.28),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (value) {
                              // Thực hiện logic tìm kiếm ở đây
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 9:
        appBar = AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/Icon/Vector2.svg',
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (Route<dynamic> route) => false,
              );
            },
          ),
          title: const Text(
            'Ticket',
            style: TextStyle(
              color: Color(0xFF17244A),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Container(
                margin: const EdgeInsets.only(right: 5.5),
                width: 70,
                height: 70,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.75,
                    color: const Color(0xFFD4D4D4),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 34.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9).withOpacity(0.28),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (value) {
                              // Thực hiện logic tìm kiếm ở đây
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;

      default:
        appBar = AppBar(
          title: const Text('App Title'),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        );
    }

    return Scaffold(
      appBar: appBar,
      drawer: CustomDrawer(onSelectScreen: onSelectScreen),
      body: isSpecialScreen
          ? _specialScreens[_selectedIndex - 5]
          : _screens[_selectedIndex],
      bottomNavigationBar: isTicketScreen
          ? null
          : BottomNavBar(
              currentIndex: isSpecialScreen ? 0 : _selectedIndex,
              onTap: onItemTapped,
            ),
    );
  }
}
