import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService{
//   final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();
//
//   Future<void> initializeNotification() async{
//     AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('mipmap/ic_launcher');
//
//     final initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid);
//
//     await notifications.initialize(
//         initializationSettings,
//         // onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async{}
//     );
//   }
//
//   // holds what notification will show
//   notificationDetails(){
//     return const NotificationDetails(
//       android: AndroidNotificationDetails('channelId', 'channelName', importance: Importance.max)
//     );
//   }
//
//   Future showNotification(int id, String title, String body, String payload) async{
//     return notifications.show(
//         id,
//         title,
//         body,
//         await notificationDetails()
//     );
//   }
// }

class NotificationService{

  final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('mipmap/ic_launcher');

  Future<void> initialNotification() async{
    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid
    );
    notifications.initialize(initializationSettings);
  }

  void sendNotification(int id, String title, String body) async{
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.max
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );

    await notifications.show(
        id,
        title,
        body,
        notificationDetails
    );
  }
}