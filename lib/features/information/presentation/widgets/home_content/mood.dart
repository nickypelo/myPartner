import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

//3rd party imports
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../../../authentication/data/models/user_details.dart';
import '../../../data/data_sources/api/local_notifications.dart';
import '../../../data/data_sources/apo_firebase.dart';
import '../../provider/notification_provider.dart';

class Mood extends StatelessWidget {
  const Mood({super.key, required this.myLady, required this.myDude});

  final UserDetailsModel myLady;
  final UserDetailsModel myDude;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0,),
      color: Colors.deepPurple.withOpacity(0.4),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: RichText(
              text:  const TextSpan(
                text: '', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                children: [
                  TextSpan(text: '\nMOOD:', style: TextStyle(letterSpacing: 2,fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20.0)),
                  TextSpan(text: '\n',style: TextStyle(letterSpacing: 1.5,fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20.0))
                ]
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: CarouselSlider(
              options: CarouselOptions(
                initialPage: 1,
                height: MediaQuery.of(context).size.width * 0.18,
                enableInfiniteScroll: false,
                viewportFraction: 0.28,
              ),
              items: feelings.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Block(label: i.label, picture: i.picture, text: i.text, myDude: myDude, myLady: myLady,);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


class Block extends StatelessWidget {
  const Block({super.key, required this.label, required this.picture, required this.text, required this.myLady, required this.myDude});

  final String label;
  final String picture;
  final String text;
  final UserDetailsModel myLady;
  final UserDetailsModel myDude;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.18;

    // message Provider
    final messageProvider = Provider.of<MessageProvider>(context);


    return Container(
      width: size,
      color: Colors.green.withOpacity(0.8),
      child: GestureDetector(
        onTap: () async{
          messageProvider.message = text;
          await FirebaseApi().sendPushMessage(myDude.fcmToken.toString(), '${myDude.firstname}, $text', "${myLady.firstname.toString()}'s mood");
          FirebaseMessaging.onMessage.listen((RemoteMessage message) {
            // Access the broadcast message here
            NotificationService().sendNotification(1, message.data['title'], message.data['body']);
            messageProvider.message = message.data['body'];
          });
        },
        child: Center(
          child: Column(
            children: [
              Image.asset(picture),
              Text(label, style: const TextStyle(fontSize: 12.0, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}


class Feeling {
  String label;
  String picture;
  String text;

  Feeling({required this.label, required this.picture, required this.text});
}

final List<Feeling> feelings = [
  Feeling(label: 'Sad', picture: 'assets/sad.png', text: 'I feel sad.'),
  Feeling(label: 'Happy', picture: 'assets/smile.png', text: 'I feel nice.'),
  Feeling(label: 'Alone', picture: 'assets/alone.png', text: 'I want your attention.'),
  Feeling(label: 'Spicy', picture: 'assets/spicy.png', text: 'I wanna rock your world.'),
  Feeling(label: 'Sick', picture: 'assets/sick.png', text: 'I feel sick'),
  Feeling(label: 'Vent', picture: 'assets/vent.png', text: 'I want to Vent!'),
];