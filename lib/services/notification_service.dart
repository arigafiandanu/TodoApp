import 'package:agenda_hari_ini/model/taskModel.dart';
import 'package:agenda_hari_ini/ui/homepage_ui.dart';
import 'package:agenda_hari_ini/ui/notifpage_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  void initializeNotification() async {
    // tz.initializeTimeZones();
    _configureLocalTimeZone();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    final DarwinInitializationSettings initializationSettingsDarwom =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: selectNotification,
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(Text("hallo"));
  }

  void onDidReceiveNotificationResponse() {
    Get.dialog(Text("hallo"));
  }

  void selectNotification(NotificationResponse notifrespon) async {
    // if (payload != null) {
    //   print('notification payload: $payload');
    // } else {
    //   print("Notification Done");
    // }
    Get.to(
      () => homepageUi(),
    );
  }

  Future bukanotif(String payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    Get.to(() => NotifPage());
  }

  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
      icon: 'appicon',
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'default_sound',
    );
  }

  scheduledNotification(int hour, int minute, TaskModel taskModel) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      taskModel.id!.toInt(),
      taskModel.title,
      taskModel.note,
      // _convertTime
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      _convertTime(hour, minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          // icon: 'appicon',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,

      // payload: "${taskModel.title}" + "${taskModel.note}|",
    );
  }

  tz.TZDateTime _convertTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime sceduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (sceduleDate.isBefore(now)) {
      sceduleDate = sceduleDate.add(const Duration(days: 1));
    }

    return sceduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }
}
