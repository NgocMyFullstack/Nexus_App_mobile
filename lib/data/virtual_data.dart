import 'package:db_app/routes/app_routes.dart';

final now = new DateTime.now();

List<Map<String, dynamic>> tasks = [];

List<Map<String, dynamic>> products = [
  {
    "product_name": "Decor Lighting",
    "create_date": "01 Oct",
    "plan_delivery_date": "25 Oct",
    "is_ordered_yet": 2, // Đã đặt hàng
    "is_in_production": 0, // Đang sản xuất
    "is_quality_control": 0, // Đang kiểm tra chất lượng
    "is_delivered_yet": 0, // Đã giao hàng
    "in_production_images": [],
    "quality_control_images": [],
    "delivery_images": [],
    "deliveried_images": []
  },
  {
    "product_name": "Sofa",
    "create_date": "01 Oct",
    "plan_delivery_date": "25 Oct",
    "is_ordered_yet": 2, // Đã đặt hàng
    "is_in_production": 0, // Đang sản xuất
    "is_quality_control": 0, // Đang kiểm tra chất lượng
    "is_delivered_yet": 0, // Đã giao hàng
    "in_production_images": [],
    "quality_control_images": [],
    "delivery_images": [],
    "deliveried_images": []
  },
  {
    "product_name": "Cabinet",
    "create_date": "01 Oct",
    "plan_delivery_date": "25 Oct",
    "is_ordered_yet": 2, // Đã đặt hàng
    "is_in_production": 0, // Đang sản xuất
    "is_quality_control": 0, // Đang kiểm tra chất lượng
    "is_delivered_yet": 0, // Đã giao hàng
    "in_production_images": [],
    "quality_control_images": [],
    "delivery_images": [],
    "deliveried_images": []
  },
  {
    "product_name": "Bedroom Set",
    "create_date": "01 Oct",
    "plan_delivery_date": "25 Oct",
    "is_ordered_yet": 2, // Đã đặt hàng
    "is_in_production": 0, // Đang sản xuất
    "is_quality_control": 0, // Đang kiểm tra chất lượng
    "is_delivered_yet": 0, // Đã giao hàng
    "in_production_images": [],
    "quality_control_images": [],
    "delivery_images": [],
    "deliveried_images": []
  },
];

List<Map<String, dynamic>> notifications = [
  {
    'image': 'assets/Avata/gr.png',
    'reminder': 'Bạn có đợt dự thu vào ngày 15 tháng 06 năm 2024',
    'datetime': now.toString(),
    'route': AppRoutes.financescreen,
    'isRead': false,
  }
];
