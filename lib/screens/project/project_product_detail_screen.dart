import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../main.dart';
import '../../widgets/custom_drawer.dart';
import 'project_product_screen.dart';

class ProjectProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProjectProductDetailScreen({super.key, required this.product});

  @override
  _ProjectProductDetailScreenState createState() =>
      _ProjectProductDetailScreenState();
}

class _ProjectProductDetailScreenState
    extends State<ProjectProductDetailScreen> {
  String productName = '';
  final ImagePicker picker = ImagePicker();
  late Map<String, dynamic> productData;

  @override
  void initState() {
    super.initState();
    // Initialize with default structure
    productData = {
      "product_name": widget.product["product_name"] ?? "",
      "create_date": widget.product["create_date"] ?? "",
      "plan_delivery_date": widget.product["plan_delivery_date"] ?? "",
      "is_ordered_yet": widget.product["is_ordered_yet"] ?? 0,
      "is_in_production": widget.product["is_in_production"] ?? 0,
      "is_quality_control": widget.product["is_quality_control"] ?? 0,
      "is_delivered_yet": widget.product["is_delivered_yet"] ?? 0,
      "in_production_images":
          List<String>.from(widget.product["in_production_images"] ?? []),
      "quality_control_images":
          List<String>.from(widget.product["quality_control_images"] ?? []),
      "delivery_images":
          List<String>.from(widget.product["delivery_images"] ?? []),
      "deliveried_images":
          List<String>.from(widget.product["deliveried_images"] ?? [])
    };
    productName = productData["product_name"];
  }

  Future<void> _captureImage(String key) async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final newImagePath = '${directory.path}/captured_image_$timestamp.png';

      await image.saveTo(newImagePath);

      setState(() {
        // Add new image to the appropriate list
        List<String> updatedList = List<String>.from(productData[key]);
        updatedList.add(newImagePath);
        productData[key] = updatedList;

        // Update status based on current state
        _updateProductStatus();
      });

      // Sync with parent widget's data
      widget.product.addAll(productData);
    }
  }

  void _updateProductStatus() {
    // In Production status
    if (productData["in_production_images"].isNotEmpty) {
      productData["is_in_production"] = 1; // Started production
    }

    // Quality Control status
    if (productData["quality_control_images"].isNotEmpty) {
      productData["is_in_production"] = 2; // Completed production
      productData["is_quality_control"] = 1; // Started QC
    }

    // Delivery status
    if (productData["delivery_images"].isNotEmpty) {
      productData["is_quality_control"] = 2; // Completed QC
      productData["is_delivered_yet"] = 1; // Started delivery
    }

    // Delivered status
    if (productData["deliveried_images"].isNotEmpty) {
      productData["is_delivered_yet"] = 2; // Completed delivery
    }
  }

  Widget _buildImageSection(String title, String imageKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            color: Color.fromRGBO(23, 36, 74, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.camera_alt, size: 50),
              onPressed: () => _captureImage(imageKey),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: productData[imageKey].isEmpty
                  ? const Text(
                      "Chưa có dữ liệu",
                      style: TextStyle(
                          color: Color.fromRGBO(23, 36, 74, 1), fontSize: 16),
                    )
                  : SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productData[imageKey].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: InstaImageViewer(
                              child: Image.file(
                                File(productData[imageKey][index]),
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/Icon/Vector2.svg',
            width: 15.0,
            height: 15.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          productData["product_name"],
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageSection("Sản Xuất", "in_production_images"),
              _buildImageSection(
                  "Kiểm Tra Hàng Trước Khi Giao", "quality_control_images"),
              _buildImageSection("Đóng Gói & Giao Hàng", "delivery_images"),
              _buildImageSection("Nhận Hàng", "deliveried_images"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
              ),
              child: const Icon(
                Icons.settings,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
