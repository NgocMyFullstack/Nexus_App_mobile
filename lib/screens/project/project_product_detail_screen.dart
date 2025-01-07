import 'dart:io';
import 'package:db_app/data/virtual_data.dart';
import 'package:db_app/routes/app_routes.dart';
import 'package:db_app/screens/project/project_product_screen.dart';
import 'package:db_app/services/notifi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

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

  Future<void> _updateProductStatus() async {
    // Lưu trạng thái cũ trước khi cập nhật
    final oldInProduction = productData["is_in_production"];
    final oldQualityControl = productData["is_quality_control"];
    final oldDelivery = productData["is_delivered_yet"];

    // In Production status
    if (productData["in_production_images"].isNotEmpty) {
      // Chỉ thêm thông báo khi trạng thái thay đổi từ chưa sản xuất (0 hoặc null) sang đang sản xuất (1)
      if (productData["is_in_production"] < 1) {
        productData["is_in_production"] = 1; // Started production
        addNotification(
            image: 'assets/Avata/gr.png',
            reminder: 'Đã bắt đầu sản xuất sản phẩm $productName',
            route: AppRoutes.project_product);
        await NotificationService().scheduleNotification(
          id: 2,
          title: 'Thông báo',
          body: 'Đã bắt đầu sản xuất sản phẩm $productName',
          route: AppRoutes.notificationscreen,
          scheduledDate: DateTime.now().add(const Duration(seconds: 10)),
        );
      }
    }

    // Quality Control status
    if (productData["quality_control_images"].isNotEmpty) {
      // Chỉ thêm thông báo khi chuyển sang trạng thái QC mới
      if (productData["is_quality_control"] < 1) {
        productData["is_in_production"] = 2; // Completed production
        productData["is_quality_control"] = 1; // Started QC
        addNotification(
            image: 'assets/Avata/gr.png',
            reminder: 'Đang kiểm tra chất lượng sản phẩm $productName',
            route: AppRoutes.project_product);
        await NotificationService().scheduleNotification(
          id: 2,
          title: 'Thông báo',
          body: 'Đang kiểm tra chất lượng sản phẩm $productName',
          route: AppRoutes.notificationscreen,
          scheduledDate: DateTime.now().add(const Duration(seconds: 10)),
        );
      }
    }

    // Delivery status
    if (productData["delivery_images"].isNotEmpty) {
      if (productData["is_delivered_yet"] < 1) {
        productData["is_quality_control"] = 2; // Completed QC
        productData["is_delivered_yet"] = 1; // Started delivery
      }
    }

    // Delivered status
    if (productData["deliveried_images"].isNotEmpty) {
      // Chỉ thêm thông báo khi chuyển sang trạng thái đã giao hàng
      if (productData["is_delivered_yet"] < 2) {
        productData["is_delivered_yet"] = 2; // Completed delivery
        addNotification(
            image: 'assets/Avata/gr.png',
            reminder: 'Giao hàng thành công sản phẩm $productName',
            route: AppRoutes.project_product);
        await NotificationService().scheduleNotification(
          id: 2,
          title: 'Thông báo',
          body: 'Giao hàng thành công sản phẩm $productName',
          route: AppRoutes.notificationscreen,
          scheduledDate: DateTime.now().add(const Duration(seconds: 10)),
        );
      }
    }
  }

  void addNotification({
    required String image,
    required String reminder,
    required String route,
  }) {
    notifications.add({
      'image': image,
      'reminder': reminder,
      'datetime': DateTime.now().toString(),
      'route': route,
      'isRead': false,
    });

    // Sắp xếp lại sau khi thêm
    notifications.sort((a, b) {
      DateTime dateA = DateTime.parse(a['datetime']!);
      DateTime dateB = DateTime.parse(b['datetime']!);
      return dateB.compareTo(dateA);
    });
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectProductScreen(),
              ),
            );
          },
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
