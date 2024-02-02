import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

import 'api/local_notifications.dart';

class FirebaseApi {
  // instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //
  Future<void> initializeNotifications() async {
    await _firebaseMessaging.requestPermission();
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display heads-up notifications
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> sendPushMessage(String hisToken, String body, String title)async {
    try{
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAuTr1sas:APA91bEZwVweGQa2dJRqhJLND6k_QoLH3WCnHEl9oZMnv-8nCKVD-6wjbfBKbontkvYNrGy9pv4ivnhFTwo36DsPImw3tYH6X4E2i4xZxSOOXIURe8-BUxbJ6soBze1uKnMBORYVGHn1'
        },
        body: jsonEncode(
         <String, dynamic>{
           'priority': 'high',

           'data': <String, dynamic>{
             'click-action' :'FLUTTER_NOTIFICATION_CLICK',
             'status': 'done',
             'body': body,
             'title': title,
           },

           'notification': <String, dynamic>{
             'title': title,
             'body': body,
             // 'android_channel_id': 'girlfriend_translator'
           },
           'to': hisToken
         }
        )
      );
      // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   // Access the broadcast message here
      //   print('Broadcast received: ${message.data}');
      //   NotificationService().sendNotification(1, message.data['title'], message.data['body']);
      // });
    }
    catch(e){
      // print('eish');
    }
  }

}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // print('Title: ${message.notification?.title}');
  // print('Body: ${message.notification?.body}');
  // print('Payload: ${message.data}');
  NotificationService().sendNotification(1, message.data['title'], message.data['body']);


}