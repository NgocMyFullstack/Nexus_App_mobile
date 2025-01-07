import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                        TabBar(
                          labelColor: Color(0xFFE29547),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Color(0xFFE29547),
                          tabs: const [
                            Tab(text: "Description"),
                            Tab(text: "Materials"),
                            Tab(text: "Reviews"),
                          ],
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
                                  style: TextStyle(height: 1.5),
                                ),
                              ),
                              Center(child: Text("Materials details here")),
                              Center(child: Text("Reviews will be shown here")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Sản phẩm tương tự
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
                      children: [
                        _buildSimilarProductCard(
                          image: 'assets/Image/image34.png',
                          name: 'Sverom chair',
                          price: '\$400',
                        ),
                        _buildSimilarProductCard(
                          image: 'assets/Image/image35.png',
                          name: 'Grundtal sofa',
                          price: '\$499',
                        ),
                      ],
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
      ),
    );
  }

  Widget _buildSimilarProductCard(
      {required String image, required String name, required String price}) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          Text(price,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
