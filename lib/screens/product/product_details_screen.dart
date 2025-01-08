import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double smallFontSize = MediaQuery.of(context).size.width * 0.03;

    final List<Map<String, String>> similarProducts = [
      {
        'image': 'assets/Image/Productpic.png',
        'name': 'Sverom chair',
        'price': '\$400'
      },
      {
        'image': 'assets/Image/Rectangle.png',
        'name': 'Grundtal sofa',
        'price': '\$499'
      },
      {
        'image': 'assets/Image/Rectangle2.png',
        'name': 'Poäng table',
        'price': '\$99'
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/Icon/IconBack.svg',
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
                    'assets/Icon/IconShare.svg',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(product['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Thông tin sản phẩm
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product['price']}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE29547),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/Icon/IconMinus.svg',
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {},
                          ),
                          const Text("1", style: TextStyle(fontSize: 16)),
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/Icon/IconPlus.svg',
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 20),
                      const Icon(Icons.star, color: Colors.orange, size: 20),
                      const Icon(Icons.star, color: Colors.orange, size: 20),
                      const Icon(Icons.star, color: Colors.orange, size: 20),
                      const Icon(Icons.star_border,
                          color: Colors.grey, size: 20),
                      const SizedBox(width: 10),
                      const Text("4.6"),
                      const SizedBox(width: 5),
                      Text("(98 Reviews)",
                          style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 238, 238, 238),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TabBar(
                            dividerColor: Colors.transparent,
                            labelColor: const Color(0xFFE29547),
                            unselectedLabelColor: Colors.grey,
                            indicator: BoxDecoration(
                              color: const Color.fromARGB(83, 226, 148, 71),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Materials",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                  "Nunc consectetur velit at massa vehicula, quis fringilla urna gravida.",
                                  style: TextStyle(
                                    height: 1.5,
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Center(
                                  child: Text(
                                "Materials details here",
                                style: TextStyle(
                                  height: 1.5,
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              )),
                              Center(
                                  child: Text(
                                "Reviews will be shown here",
                                style: TextStyle(
                                  height: 1.5,
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 10, // Chiều cao
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Similar products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: similarProducts.map((product) {
                        return Builder(
                          builder: (BuildContext context) {
                            return _buildSimilarProductCard(
                              context: context,
                              image: product['image']!,
                              name: product['name']!,
                              price: product['price']!,
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Nút Add to bag
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFAAAAAA)),
                  color: Colors.white,
                ),
                child: SvgPicture.asset(
                  'assets/Icon/WishlistIcon.svg',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Logic thêm vào giỏ hàng
                  },
                  child: const Text(
                    "Add to bag",
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
      ),
    );
  }

  Widget _buildSimilarProductCard({
    required BuildContext context,
    required String image,
    required String name,
    required String price,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: {'image': image, 'name': name, 'price': price},
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 290,
        width: 210,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hình ảnh sản phẩm
                  Container(
                    width: 190,
                    height: 180,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Thông tin sản phẩm
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Tên sản phẩm
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Giá sản phẩm
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Biểu tượng trái tim ở góc trên phải
              Positioned(
                top: 25,
                right: 25,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Xử lý khi nhấn vào trái tim
                    },
                    icon: SvgPicture.asset(
                      'assets/Icon/Wishlist.svg',
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
