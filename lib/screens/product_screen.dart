import 'package:flutter/material.dart';

class TodoItem {
  final String title;
  final String imagePath;

  TodoItem({required this.title, required this.imagePath});
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TodoItem> products = [
      TodoItem(title: 'Sofa', imagePath: 'assets/Images/sofa.png'),
      TodoItem(title: 'Tủ', imagePath: 'assets/Images/tu1.png'),
      TodoItem(title: 'Tủ Đầu Gường', imagePath: 'assets/Images/tu2.png'),
      TodoItem(title: 'Bàn & Ghế', imagePath: 'assets/Images/ban.png'),
      TodoItem(title: 'kệ Tivi', imagePath: 'assets/Images/tivi.png'),
    ];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 30,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17244A),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: products.map((product) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            print('${product.title} Button Pressed');
                          },
                          child: Container(
                            width: 133,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      product.title,
                                      style: const TextStyle(
                                        color: Color(0xFF262525),
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25,
                                        letterSpacing: 0.08,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(product.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 30,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 270,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/Image/image299.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Sofa',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'SF04',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$400',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration: BoxDecoration(
                                                        color: Colors.teal[400],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        icon: Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 270,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/Image/image30.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Tủ đầu giường',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'NS02',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$370',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration: BoxDecoration(
                                                        color: Colors.teal[400],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        icon: Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 270,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/Image/image 34.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Armchair ',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'AC08',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$370',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration: BoxDecoration(
                                                        color: Colors.teal[400],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        icon: Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 270,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/Image/image 31.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Bàn làm việc ',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'D04',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$450',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration: BoxDecoration(
                                                        color: Colors.teal[400],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        icon: Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 270,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/Image/image 32.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Bàn Coffee  ',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'CF11',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$590',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration: BoxDecoration(
                                                        color: Colors.teal[400],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        icon: Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 270,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/Image/image 35.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Armchair  ',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'AC02',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$790',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration: BoxDecoration(
                                                        color: Colors.teal[400],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        icon: Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Rooms',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 36.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  'Living Rooms',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 37.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  'Bedrooms ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 38.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  'Dining Rooms ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 39.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  'Home offices ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 40.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  'Small Spaces ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 41.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  'Outdoor Spaces ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'News Collection',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 42.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          children: [],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 43.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          children: [],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 44.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          children: [],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Image/image 45.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          children: [],
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
