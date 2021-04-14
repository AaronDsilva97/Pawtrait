import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PetNotification extends StatefulWidget {
  @override
  _PetNotificationState createState() => _PetNotificationState();
}

class _PetNotificationState extends State<PetNotification> {
  FlutterLocalNotificationsPlugin flutterLocalNotifications =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotifications.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
      'Channel ID',
      "Pawtrait",
      "This is my new notification",
      importance: Importance.max,
    );

    var generalNotificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotifications.show(
      0,
      "Task",
      "You created a task",
      generalNotificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: <Widget>[
          Text("Notification"),
          ElevatedButton(
            onPressed: _showNotification,
            child: Text("Send Notification"),
          ),
        ],
      ),
    );
  }

  Future selectNotification(String payload) async {
    return "Hello";
  }
}
