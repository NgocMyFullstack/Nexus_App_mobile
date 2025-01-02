import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:image_painter/image_painter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:db_app/screens/project/ticket_screen.dart';
import '../../main.dart';
import 'virtual_data.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_svg/svg.dart';

// Biến trạng thái để lưu giá trị được chọn
String _selectedFloor = 'Floor 1'; // Giá trị mặc định
String _selectedDepartment = ''; // Giá trị mặc định
String _floorImage = 'assets/images/layout_floor_1_ticket.png';
String? _editedImagePath;
// String? _capturedImagePath;
List<String> _capturedImagePaths = []; // List to hold capture image data

class CreateNewTicketScreen extends StatefulWidget {
  const CreateNewTicketScreen({super.key});

  @override
  _CreateNewTicketScreenState createState() => _CreateNewTicketScreenState();
}

class _CreateNewTicketScreenState extends State<CreateNewTicketScreen> {
  List<Map<String, Object>> tickets = []; // List to hold ticket data
  String? _tasktitle;
  var taskTitleTextController = new TextEditingController();

  Future<void> _showTicketDetails(Map<String, dynamic> ticket) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateDialog) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      title: const Text("View Ticket"),
                      automaticallyImplyLeading: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: TextEditingController(
                                text: ticket["description"]),
                            decoration: InputDecoration(
                              hintText: "Nhập mô tả lỗi...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            readOnly:
                                true, // Make this field read-only for viewing
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Vị Trí",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Hình Lỗi",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    if (ticket["editedImagePath"] != null)
                                      InstaImageViewer(
                                          child: Image.file(
                                        File(ticket["editedImagePath"]),
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ))
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                  width: 1, color: Colors.grey),
                              Expanded(
                                child: Column(
                                  children: [
                                    if (ticket["capturedImagePaths"].isNotEmpty)
                                      SizedBox(
                                        height: 200,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: ticket["capturedImagePaths"]
                                              .map<Widget>((path) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 4.0),
                                                  child: InstaImageViewer(
                                                      child: Image.file(
                                                    File(path),
                                                    height: 200,
                                                    fit: BoxFit.contain,
                                                  ))))
                                              .toList(),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: const Text("Close"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _deleteTicket(Map<String, dynamic> ticket) {
    setState(() {
      // Xóa ticket từ danh sách
      tickets.remove(ticket);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ticket đã được xóa!")),
      );
    });
  }

  Future<void> _openEditDialog() async {
    final ImagePainterController localController = ImagePainterController(
      color: const Color.fromARGB(255, 255, 0, 0),
      strokeWidth: 2,
      mode: PaintMode.rect,
    );

    await showDialog(
      context: context,
      barrierDismissible: true, // Cho phép đóng dialog khi bấm ra ngoài
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateDialog) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    AppBar(
                      title: const Text("Edit Image"),
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.save_alt),
                          onPressed: () async {
                            Uint8List? byteArray =
                                await localController.exportImage();
                            if (byteArray != null) {
                              final directory =
                                  await getApplicationDocumentsDirectory();
                              final timestamp =
                                  DateTime.now().millisecondsSinceEpoch;
                              final filePath =
                                  '${directory.path}/edited_image_$timestamp.png';
                              final file = File(filePath);
                              await file.writeAsBytes(byteArray);

                              setState(() {
                                _editedImagePath = filePath;
                              });

                              Navigator.pop(context); // Đóng dialog
                              _openFormDialog(filePath); // Mở form dialog
                            }
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ImagePainter.asset(
                        _floorImage,
                        controller: localController,
                        scalable: true,
                        textDelegate: TextDelegate(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );

    localController.dispose();
  }

  Future<void> _openFormDialog(String imagePath) async {
    final ImagePicker picker = ImagePicker();
    String? _description;

    // Reset lại các giá trị ảnh trước khi mở dialog
    setState(() {
      _capturedImagePaths = []; // Xóa đường dẫn ảnh chụp cũ
    });

    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateDialog) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      title: const Text("Create Ticket"),
                      automaticallyImplyLeading: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Nhập mô tả lỗi...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            onChanged: (value) {
                              setStateDialog(() {
                                _description = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Vị Trí",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Hình Lỗi",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    if (_editedImagePath != null)
                                      Image.file(
                                        File(_editedImagePath!),
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                  width: 1, color: Colors.grey),
                              Expanded(
                                child: Column(
                                  children: [
                                    if (_capturedImagePaths.isNotEmpty)
                                      SizedBox(
                                        height: 200,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: _capturedImagePaths
                                              .map<Widget>((path) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.0),
                                                    child: Image.file(
                                                      File(path),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    const SizedBox(height: 16),
                                    IconButton(
                                      icon: const Icon(Icons.camera_alt,
                                          size: 50),
                                      onPressed: () async {
                                        final XFile? image =
                                            await picker.pickImage(
                                                source: ImageSource.camera);
                                        if (image != null) {
                                          final directory =
                                              await getApplicationDocumentsDirectory();
                                          final timestamp = DateTime.now()
                                              .millisecondsSinceEpoch;
                                          final newImagePath =
                                              '${directory.path}/captured_image_$timestamp.png';

                                          await image.saveTo(newImagePath);

                                          setStateDialog(() {
                                            _capturedImagePaths
                                                .add(newImagePath);
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_description != null &&
                                    _description!
                                        .trim()
                                        .isNotEmpty && // Kiểm tra mô tả không rỗng
                                    _editedImagePath != null &&
                                    _capturedImagePaths.isNotEmpty) {
                                  final ticket = {
                                    "floor": _selectedFloor,
                                    "department": _selectedDepartment,
                                    "description": _description!
                                        .trim(), // Loại bỏ khoảng trắng thừa
                                    "editedImagePath": _editedImagePath!,
                                    "capturedImagePaths":
                                        List.from(_capturedImagePaths),
                                  };
                                  setState(() {
                                    tickets.add(ticket);
                                    print("Ticket added: $tickets");
                                  });
                                  Navigator.pop(context); // Đóng form dialog
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Saved!")),
                                  );
                                } else {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.warning,
                                    text:
                                        'Vui lòng kiểm tra lại thông tin mô tả và ảnh chụp hình lỗi!',
                                  );
                                }
                              },
                              child: const Text("Kết thúc"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/Icon/Vector2.svg',
            width: 15.0,
            height: 15.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Create New Ticket',
          style: TextStyle(
            color: const Color(0xFF17244A),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Title
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 21,
                    color: const Color(0xFF17244A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                child: TextField(
                  readOnly: true,
                  controller: taskTitleTextController,
                  textInputAction: TextInputAction.send,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: const Color.fromARGB(255, 141, 141, 141),
                  maxLines: 1,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  ),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 26,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Task Details
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Task Details',
                  style: TextStyle(
                    fontSize: 21,
                    color: const Color(0xFF17244A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Floor',
                        style: TextStyle(
                          fontSize: 21,
                          color: const Color(0xFF17244A),
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedFloor,
                        dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                        style: const TextStyle(
                          fontSize: 26,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        isExpanded: true,
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedFloor = newValue!;
                            if (_selectedFloor == 'Floor 1') {
                              _floorImage =
                                  'assets/images/layout_floor_1_ticket.png';
                            } else if (_selectedFloor == 'Floor 2') {
                              _floorImage =
                                  'assets/images/layout_floor_2_ticket.png';
                            } else if (_selectedFloor == 'Floor 3') {
                              _floorImage =
                                  'assets/images/layout_floor_3_ticket.png';
                            }
                            taskTitleTextController.text =
                                "$_selectedFloor - $_selectedDepartment";
                            _tasktitle = taskTitleTextController.text;
                          });
                        },
                        items: <String>['Floor 1', 'Floor 2', 'Floor 3']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Department',
                        style: TextStyle(
                          fontSize: 21,
                          color: const Color(0xFF17244A),
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Cắt ngắn nếu không đủ không gian
                        softWrap: false, // Không xuống dòng
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Khoảng cách giữa nhãn và Dropdown
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1), // Màu nền
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.send,
                        textCapitalization: TextCapitalization.words,
                        cursorColor: const Color.fromARGB(255, 145, 145, 145),
                        maxLines: 1,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedDepartment = value;
                            taskTitleTextController.text =
                                "$_selectedFloor - $_selectedDepartment";
                            _tasktitle = taskTitleTextController.text;
                          });
                        },
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 21), // Khoảng cách giữa các dòng
              // Layout and List Ticket
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 9.0),
                child: const Text(
                  'LAYOUT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 122, 0, 1),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    // ignore: unnecessary_null_comparison
                    if (_selectedDepartment == '' ||
                        _selectedDepartment == null) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        text: 'Vui lòng điền tên khu vực lỗi',
                      );
                    } else {
                      _openEditDialog();
                    }
                  },
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: FittedBox(
                        fit: BoxFit.fill, child: Image.asset(_floorImage)),
                  )),

              const SizedBox(height: 16),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'List Ticket',
                  style: TextStyle(
                    fontSize: 21,
                    color: const Color(0xFF17244A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ...tickets.asMap().entries.map((entry) {
                final index = entry.key; // Lấy chỉ mục của ticket
                final ticket = entry.value; // Lấy nội dung ticket
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF17244A), // Background color
                    border: Border.all(
                      color: const Color(0xFF17244A), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius:
                        BorderRadius.circular(8.0), // Optional: rounded corners
                  ),
                  child: Row(
                    children: [
                      // Phần nội dung của ticket
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              '${index + 1} - : ${ticket["floor"]} - ${ticket["department"]}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              softWrap: true,
                            ),
                            Text(
                              'Description: ${ticket["description"]}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      // Phần biểu tượng ở bên phải
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Tooltip(
                          //   message: 'Edit', // Tiêu đề cho nút Edit
                          //   child: IconButton(
                          //     icon: const Icon(Icons.edit,
                          //         color: Color.fromARGB(255, 255, 255, 255)),
                          //     onPressed: () {
                          //       // Logic sửa ticket
                          //       // _editTicket(ticket);
                          //     },
                          //   ),
                          // ),
                          Tooltip(
                            message: 'Delete', // Tiêu đề cho nút Delete
                            child: IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              onPressed: () {
                                // Logic xóa ticket
                                _deleteTicket(ticket);
                              },
                            ),
                          ),
                          Tooltip(
                            message: 'View Details', // Tiêu đề cho nút View
                            child: IconButton(
                              icon: const Icon(Icons.visibility,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              onPressed: () {
                                _showTicketDetails(ticket);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(204, 202, 202, 0.474),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
                20), // Adjust the radius for the top-left corner
            topRight: Radius.circular(
                20), // Adjust the radius for the top-right corner
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_selectedDepartment == '' || _selectedDepartment == null) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    text: 'Vui lòng điền tên khu vực lỗi',
                  );
                } else {
                  _openEditDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
              ),
              child: const Icon(
                Icons.add,
                size: 26,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_selectedDepartment == '' || _selectedDepartment == null) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    text: 'Vui lòng điển Task Title',
                  );
                } else if (tickets.isEmpty) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    text: 'Vui lòng nhập thông tin ticket',
                  );
                } else {
                  DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm");
                  Map<String, List<Map<String, dynamic>>> groupedTickets = {};

// Nhóm các ticket
                  for (var ticket in tickets) {
                    if (ticket['floor'] == null ||
                        ticket['department'] == null) {
                      print("Invalid ticket: $ticket");
                      continue;
                    }

                    final key = "${ticket['floor']}-${ticket['department']}";
                    if (!groupedTickets.containsKey(key)) {
                      groupedTickets[key] = [];
                    }

                    var optimizedTicket = Map<String, dynamic>.from(ticket);
                    groupedTickets[key]!.add(optimizedTicket);
                  }

// Kiểm tra groupedTickets
                  if (groupedTickets.isEmpty) {
                    print("groupedTickets is empty. Check the tickets input.");
                    return;
                  }

// Tạo danh sách _tasks từ groupedTickets
                  List<Map<String, dynamic>> _tasks =
                      groupedTickets.entries.map((entry) {
                    final floorDepartment = entry.key.split("-");
                    return {
                      "taskTitle":
                          "${floorDepartment[0]} - ${floorDepartment[1]}",
                      "is_completed": false,
                      "is_approved": false,
                      "floor": floorDepartment[0], // Sử dụng chuỗi "Floor 1"
                      "department": floorDepartment[1], // Sử dụng chuỗi "HR"
                      "create_date": dateFormat.format(DateTime.now()),
                      "tickets": entry.value,
                    };
                  }).toList();

// Kiểm tra _tasks trước khi thêm vào tasks
                  print("Generated _tasks: ${jsonEncode(_tasks)}");
                  if (_tasks.isEmpty) {
                    print("No tasks generated. Check the grouping logic.");
                    return;
                  }

// Cập nhật danh sách tasks
                  setState(() {
                    tasks.addAll(_tasks);
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TicketScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
