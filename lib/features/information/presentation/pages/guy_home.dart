import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/information/presentation/provider/notification_provider.dart';
import 'package:provider/provider.dart';

import '../../../authentication/data/models/relationship_model.dart';
import '../../../authentication/data/models/user.dart';
import '../../../authentication/data/models/user_details.dart';
import '../../../authentication/data/repository/auth_service.dart';
import '../../data/models/food_model.dart';
import '../../data/models/highlight_model.dart';
import '../../data/models/interest_model.dart';
import '../../data/models/music_model.dart';
import '../../data/models/personality_model.dart';

class GuyHome extends StatefulWidget {
  const GuyHome({super.key});

  static final AuthService _auth = AuthService();


  @override
  State<GuyHome> createState() => _GuyHomeState();
}

class _GuyHomeState extends State<GuyHome> {


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    final userDetails = Provider.of<List<UserDetailsModel>>(context);
    final couple = Provider.of<List<RelationshipModel>>(context);

    // establish users
    UserDetailsModel current = UserDetailsModel(userID: '', firstname: '', lastname: '', partnerEmail: '', role: '', fcmToken: '');
    UserDetailsModel myLady = UserDetailsModel(userID: '', firstname: '', lastname: '', partnerEmail: '', role: '', fcmToken: '');

    bool isUser = userDetails.indexWhere((element) => element.userID == user?.uid) != -1;
    bool isBoyfriend = false;
    // current user index
    int index = 0;
    // my partner index
    int partnerIndex = 0;

    if(isUser){
      // current user index
      index = userDetails.indexWhere((element) => element.userID == user?.uid);
      // boyfriend/girlfriend login
      isBoyfriend = (couple.indexWhere((element) => element.girlfriend == userDetails[index].partnerEmail)) != -1;

      // partner info
      int indexCouple = isBoyfriend ?
      couple.indexWhere((element) => element.girlfriend == userDetails[index].partnerEmail) :
      couple.indexWhere((element) => element.boyfriend == userDetails[index].partnerEmail);


      if(isBoyfriend){
        partnerIndex = userDetails.indexWhere((element) => element.partnerEmail == couple[indexCouple].boyfriend);
      }
      else{
        partnerIndex = userDetails.indexWhere((element) => element.partnerEmail == couple[indexCouple].girlfriend);
      }

      current = userDetails[index];
      myLady =  userDetails[partnerIndex];
    }



    // sizes
    double breadth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // call my data
    final food = Provider.of<List<FoodModel>>(context);
    final music = Provider.of<List<MusicModel>>(context);
    final highlight = Provider.of<List<HighlightModel>>(context);
    final interest = Provider.of<List<InterestModel>>(context);
    final personality = Provider.of<List<PersonalityModel>>(context);
    // messages
    final messageProvider = Provider.of<MessageProvider>(context);


    // list my data for presentation
    List<FoodModel> foodDisplay = food.where((item) => item.foodID == current.userID || item.foodID == myLady.userID).toList();
    List<PersonalityModel> personalityDisplay = personality.where((item) => item.personalityID == current.userID || item.personalityID == myLady.userID).toList();
    List<MusicModel> musicDisplay = music.where((item) => item.musicID == current.userID || item.musicID == myLady.userID).toList();
    List<HighlightModel> highlightDisplay = highlight.where((item) => item.highlightID == current.userID || item.highlightID == myLady.userID).toList();
    List<InterestModel> interestDisplay = interest.where((item) => item.interestID == current.userID || item.interestID == myLady.userID).toList();


    // print(current.firstname);
    // print(myLady.firstname);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: const Text('logout', style: TextStyle(color: Colors.white),),
          onPressed: () async{
            await GuyHome._auth.logoff();
          }
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: screenHeight * 0.4 ,
              width: breadth * .95,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundImage: const AssetImage('assets/happy.png'),
                        radius: breadth * 0.15,
                      ),
                      CircleAvatar(
                        backgroundImage: const AssetImage('assets/profile.png') ,
                        radius: breadth * 0.15,
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Text('Welcome ${current.firstname.toString()}', style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),),
                  const Text('What do you have in store for your lady?'),
                  const SizedBox(height: 20.0,),
                ],
              ),
            ),
        
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              height: screenHeight * 0.25,
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/moreInfo', arguments: {
                          'title': 'Music',
                          'description': musicDisplay,
                          'name': 'music',
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            height: screenHeight * 0.3,
                            color: Colors.deepOrange,
                            child: const Center(child: Text('MUSIC', style: TextStyle(fontSize: 16.0,  fontWeight: FontWeight.bold)))),
                      )
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                                    'title': 'Food',
                                    'description': foodDisplay,
                                    'name': 'food',
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    width: breadth * 0.5,
                                    color: Colors.indigo,
                                    child: const Center(child: Text('FOOD', style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold)))),
                              )
                          ),
                          const SizedBox(height: 10.0,),
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                                    'title': 'What you like about her',
                                    'description': highlightDisplay,
                                    'name': 'highlight',
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    width: breadth * 0.5,
                                    color: Colors.amber,
                                    child: const Center(child: Text('WHAT YOU LIKE ABOUT HER', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,))),
                              )
                          ),
                        ],
                      ))
                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              height: screenHeight * 0.25,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                                  'title': 'Her Personality',
                                  'description': personalityDisplay,
                                  'name': 'personality',
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    width: breadth * 0.5,
                                    color: Colors.amber,
                                    child: const Center(child: Text('HER PERSONALITY', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)))),
                              )
                          ),
                          const SizedBox(height: 10.0,),
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                                    'title': 'What She Likes',
                                    'description': interestDisplay,
                                    'name': 'interests',
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    width: breadth * 0.5,
                                    color: Colors.indigo,
                                    child: const Center(child: Text('WHAT SHE LIKES?', style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold)))),
                              )
                          ),
                        ],
                      )
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          // NotificationService().sendNotification(1, "${myLady.firstname.toString()}'s mood", '${current.firstname}, ${messageProvider.message}');
                          Navigator.pushNamed(context, '/moodInfo', arguments: {
                            'moodAttribute': messageProvider.message
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                            height: screenHeight * 0.3,
                            color: Colors.deepOrange,
                            child:  Center(child: Text('MOOD SUGGESTIONS ${messageProvider.message}', style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)))),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
