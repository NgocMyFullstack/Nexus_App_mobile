import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String NOTIFICATION_ROUTE_KEY = 'notification_route';
  
  // Track badge support status
  bool? _isBadgeSupported;

  Future<void> init() async {
    // Initialize timezone
    tz.initializeTimeZones();
    
    // Check badge support
    _isBadgeSupported = await _checkBadgeSupport();
    if (_isBadgeSupported == true) {
      try {
        await FlutterAppBadgeControl.removeBadge();
      } catch (e) {
        debugPrint('Failed to remove badge: $e');
      }
    }

    // Configure for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Configure for iOS
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: false,
      requestAlertPermission: true,
    );

    // Initialize settings
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationTap,
      onDidReceiveBackgroundNotificationResponse: _handleBackgroundNotificationTap,
    );

    await _checkForInitialNotification();
  }

  // Check if badge control is supported on the current platform
  Future<bool> _checkBadgeSupport() async {
    try {
      final isSupported = await FlutterAppBadgeControl.isAppBadgeSupported();
      debugPrint('Badge support status: $isSupported');
      return isSupported;
    } catch (e) {
      debugPrint('Error checking badge support: $e');
      return false;
    }
  }

  // Safe badge control wrapper with support check
  Future<void> _safeBadgeControl(Future<void> Function() badgeOperation) async {
    if (_isBadgeSupported != true) {
      debugPrint('Badge control not supported on this platform');
      return;
    }

    try {
      await badgeOperation();
    } catch (e) {
      debugPrint('Badge control operation failed: $e');
    }
  }

  void _handleNotificationTap(NotificationResponse details) {
    if (details.payload != null) {
      _navigateToRoute(details.payload!);
    }
  }

  @pragma('vm:entry-point')
  static void _handleBackgroundNotificationTap(NotificationResponse details) async {
    if (details.payload != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(NOTIFICATION_ROUTE_KEY, details.payload!);
    }
  }

  Future<void> _checkForInitialNotification() async {
    final NotificationAppLaunchDetails? launchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
        
    if (launchDetails != null && 
        launchDetails.didNotificationLaunchApp &&
        launchDetails.notificationResponse?.payload != null) {
      _navigateToRoute(launchDetails.notificationResponse!.payload!);
    } else {
      final prefs = await SharedPreferences.getInstance();
      final savedRoute = prefs.getString(NOTIFICATION_ROUTE_KEY);
      if (savedRoute != null) {
        _navigateToRoute(savedRoute);
        await prefs.remove(NOTIFICATION_ROUTE_KEY);
      }
    }
  }

  void _navigateToRoute(String route) {
    Future.delayed(const Duration(milliseconds: 100), () {
      final context = navigatorKey.currentContext;
      if (context != null) {
        Navigator.of(context).pushNamed(route);
      }
    });
  }

  void handleNotificationTap(NotificationResponse details) {
    if (details.payload != null) {
      final context = navigatorKey.currentContext;
      if (context != null) {
        Navigator.of(context).pushNamed(details.payload!);
      }
    }
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String route,
    int? badgeCount,
  }) async {
    const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
      sound: 'default',
    );

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      channelDescription: 'Default channel for notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(
      iOS: iOSDetails,
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: route,
    );

    // Update badge count if provided and supported
    if (badgeCount != null) {
      await _safeBadgeControl(() async {
        await FlutterAppBadgeControl.updateBadgeCount(badgeCount);
      });
    }
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required String route,
    required DateTime scheduledDate,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
      presentBadge: false,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      details,
      payload: route,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}