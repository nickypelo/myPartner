import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //
  Future<void> initializeNotifications() async {
    await _firebaseMessaging.requestPermission();
    // final fcmToken = await _firebaseMessaging.getToken();
    // print('Token: $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  // Send notification using FCM
//   Future<void> sendNotificationTo(String userToken, String message, String title) async {
//     try {
//       await _firebaseMessaging.sendMessage(
//         const Message(
//           data: {
//             'title': title,
//             'body': message,
//           },
//           token: userToken,
//         ),
//         onBackgroundMessage: null,
//       );
//     } catch (e) {
//       print('Error sending notification: $e');
//     }
//   }
// }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    // print('Title: ${message.notification?.title}');
    // print('Body: ${message.notification?.body}');
    // print('Payload: ${message.data}');
  }
}