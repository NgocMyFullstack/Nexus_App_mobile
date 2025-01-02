import 'package:db_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'project_product_detail_screen.dart';
import 'virtual_data.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Cần cài thư viện percent_indicator

class ProjectProductScreen extends StatefulWidget {
  const ProjectProductScreen({super.key});

  @override
  _ProjectProductScreenState createState() => _ProjectProductScreenState();
}

class _ProjectProductScreenState extends State<ProjectProductScreen> {
  Widget _buildStatusIndicator(String label, int status) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Center(
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: status == 0
                    ? Colors.white
                    : status == 1
                        ? const Color(0xFF007AFF)
                        : status == 2
                            ? const Color(0xFF00D09E)
                            : Colors
                                .white, // Màu mặc định cho giá trị không hợp lệ
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double baseWidth = constraints.maxWidth; // Độ rộng màn hình
              final double smallFontSize = baseWidth * 0.03; // Kích thước nhỏ
              final double mediumFontSize =
                  baseWidth * 0.04; // Kích thước trung bình
              final double largeFontSize = baseWidth * 0.05; // Kích thước lớn
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // tiêu đề project name
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Text(
                      'Tên dự án',
                      style: TextStyle(
                        fontSize: largeFontSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius:
                          BorderRadius.circular(8), // Border-radius of 8px
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(
                              187, 187, 187, 0.25), // Shadow color
                          blurRadius: 31, // Blur effect of the shadow
                          offset: const Offset(0, 5), // Position of the shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${tasks.length}',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'ĐÃ ĐẶT HÀNG',
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(height: 2),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 4.0,
                              percent: 0.8,
                              center: Text(
                                '80%',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              progressColor:
                                  const Color.fromARGB(255, 255, 0, 0),
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF00D09E),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'ĐÃ NHẬN HÀNG',
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(height: 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // tiêu đề Processed Images
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Text(
                      'HÀNG NHẬN NGÀY HÔM NAY',
                      style: TextStyle(
                        fontSize: largeFontSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 1; i <= 3; i++)
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: InstaImageViewer(
                                  child: Image.asset(
                                      'assets/images/project_img_$i.png'),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // tiêu đề Record
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          'DANH SÁCH ĐẶT HÀNG',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Khoảng cách giữa text và line
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.9, // Tỷ lệ width (90% màn hình)
                        height: 0.75, // Chiều cao của line
                        color: const Color(0xFFD4D4D4), // Màu của line
                      ),
                    ],
                  ),

                  Container(
                    padding:
                        const EdgeInsets.all(8.0), // Padding inside the border
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(
                            0, 33, 149, 243), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    child: Column(
                      children: products.map((product) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProjectProductDetailScreen(
                                        product: product),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFF17244A), // Background color
                              border: Border.all(
                                color: const Color(0xFF17244A), // Border color
                                width: 2.0, // Border width
                              ),
                              borderRadius: BorderRadius.circular(
                                  8.0), // Optional: rounded corners
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 16),
                                      Text(
                                        product["product_name"].toString(),
                                        style: TextStyle(
                                          fontSize: mediumFontSize,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        softWrap: true,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Create date: ${product["create_date"]}',
                                        style: TextStyle(
                                          fontSize: mediumFontSize,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        softWrap: true,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Plan Delivery date: ${product["plan_delivery_date"]}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildStatusIndicator(
                                        "Đã đặt",
                                        product["is_ordered_yet"],
                                      ),
                                      const SizedBox(width: 12),
                                      _buildStatusIndicator(
                                        product["is_in_production"] == 2
                                            ? "Đã\nsản\nxuất"
                                            : product["is_in_production"] == 1
                                                ? "Đang\nsản\nxuất"
                                                : "Sản\nxuất",
                                        product["is_in_production"],
                                      ),
                                      const SizedBox(width: 12),
                                      _buildStatusIndicator(
                                        product["is_quality_control"] == 1
                                            ? "Đang\nkiểm\ntra"
                                            : "QC",
                                        product["is_quality_control"],
                                      ),
                                      const SizedBox(width: 12),
                                      _buildStatusIndicator(
                                        product["is_delivered_yet"] == 2
                                            ? "Đã\ngiao\nhàng"
                                            : "Giao\nhàng",
                                        product["is_delivered_yet"],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
