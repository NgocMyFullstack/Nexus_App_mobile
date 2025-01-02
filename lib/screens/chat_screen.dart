import 'package:db_app/screens/notification/notification_screen.dart';
import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import 'package:db_app/screens/project/create_new_ticket_screen.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Row(
                      children: [
                        Image.asset(
                          'assets/Avata/gr.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Create Group',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      print('Create Group button pressed');
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata2.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Amelia',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata1.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Alexander',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata3.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Avery',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata4.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Asher',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata5.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Berret',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata6.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Benjamin',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata7.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Brayden',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata8.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Berrett',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata9.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Braxton',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata2.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Amelia',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata1.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Alexander',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata3.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Avery',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata4.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Asher',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata5.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Berret',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata6.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Benjamin',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata7.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Brayden',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata8.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Berrett',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata9.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Braxton',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata2.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Amelia',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata1.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Alexander',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata3.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Avery',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata4.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Asher',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata5.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Berret',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata6.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Benjamin',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata7.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Brayden',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata8.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Berrett',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Avata/avata9.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Braxton',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
