// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_timezone/flutter_timezone.dart';

// class LocalNotifService {
//   // Setup
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Method to handle notification taps
//   static Future<void> onTap(NotificationResponse notificationResponse) async {
//     // Handle notification tap here
//   }

//   // Initialize the notification settings
//   static Future<void> init() async {
//     // Initialization settings for Android and iOS
//     const InitializationSettings settings = InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//       ),
//     );

//     // Initialize the plugin with the settings
//     await flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );
//   }

//   // Handle notifications received while the app is in the foreground (iOS)
//   static Future<void> onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // Handle the notification here
//   }

//   // Schedule a notification
//   static Future<void> scheduledNotification() async {
//     // Initialize time zones
//     tz.initializeTimeZones();
//     print(tz.local.name);
//     print("before"+tz.TZDateTime.now(tz.local).hour.toString());
//     final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(currentTimeZone));
//     print("after " + tz.TZDateTime.now(tz.local).hour.toString());
//     // Notification details for Android and iOS
//     const NotificationDetails details = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'id_1',
//         'scheduled_notification',
//         channelDescription: 'Scheduled Notification',
//         importance: Importance.max,
//         priority: Priority.high,
//         // Deprecated parameter removed, use androidScheduleMode instead
//       ),
//       iOS: DarwinNotificationDetails(),
//     );

//     // Schedule the notification
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       2,
//       'Scheduled Notif',
//       'This is a scheduled notification.'
//       // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
//       ,
//       tz.TZDateTime(tz.local, 2024, 7, 8, 1, 9),
//       details,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidScheduleMode: AndroidScheduleMode.exact, // New parameter
//     );
//   }

//   // Show a basic notification
//   static Future<void> showBasicNotification() async {
//     // Notification details for Android and iOS
//     const NotificationDetails details = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'id_1',
//         'basic_notification',
//         channelDescription: 'Basic Notification',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//       iOS: DarwinNotificationDetails(),
//     );

//     // Show the notification
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Basic Notif',
//       'This is a basic notification.',
//       details,
//     );
//   }
// }

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class LocalNotifService {
  // Setup
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Method to handle notification taps
  static Future<void> onTap(NotificationResponse notificationResponse) async {
    // Handle notification tap here
  }

  // Initialize the notification settings
  static Future<void> init() async {
    // Initialization settings for Android and iOS
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      ),
    );

    // Initialize the plugin with the settings
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  // Handle notifications received while the app is in the foreground (iOS)
  static Future<void> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // Handle the notification here
  }

  // Schedule a notification
  static Future<void> scheduledNotification() async {
    // Initialize time zones
    tz.initializeTimeZones();

    // Get the current time zone
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // Notification details for Android and iOS
    const NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'id_1',
        'scheduled_notification',
        channelDescription: 'Scheduled Notification',
        importance: Importance.max,
        priority: Priority.high,
        // Deprecated parameter removed, use androidScheduleMode instead
      ),
      iOS: DarwinNotificationDetails(),
    );

    // Calculate the notification time for every day
    tz.TZDateTime scheduledDate = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)); // Default to 10 seconds from now

    // Schedule the notification to repeat every day at 9:00 AM
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Scheduled Notif',
      'This is a scheduled notification.',
      tz.TZDateTime(tz.local, tz.TZDateTime.now(tz.local).year, tz.TZDateTime.now(tz.local).month, tz.TZDateTime.now(tz.local).day, 9,48),
      details
      ,androidScheduleMode: AndroidScheduleMode.exact,
      matchDateTimeComponents: DateTimeComponents.time, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, // Ensure it matches every day at the specified time
    );
  }

  // Show a basic notification
  static Future<void> showBasicNotification() async {
    // Notification details for Android and iOS
    const NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'id_1',
        'basic_notification',
        channelDescription: 'Basic Notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      0,
      'Basic Notif',
      'This is a basic notification.',
      details,
    );
  }
}