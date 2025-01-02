// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     // Khởi tạo timezone
//     tz.initializeTimeZones();

//     // Cấu hình cho Android
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     // Cấu hình cho iOS
//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );

//     // Khởi tạo cấu hình
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse details) {
//         print('Notification clicked: ${details.payload}');
//       },
//     );
//   }

//   Future<void> showNotification({
//     required int id,
//     required String title,
//     required String body,
//     String? payload,
//   }) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//       iOS: iOSDetails,
//     );

//     await flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       details,
//       payload: payload,
//     );
//   }

//   // Lên lịch notification với zonedSchedule
//   Future<void> scheduleNotification({
//     required int id,
//     required String title,
//     required String body,
//     required DateTime scheduledDate,
//   }) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();

//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//       iOS: iOSDetails,
//     );

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledDate, tz.local),
//       details,
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }
