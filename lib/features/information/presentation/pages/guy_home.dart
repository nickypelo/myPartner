import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../authentication/data/models/user.dart';
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
    // sizes
    double breadth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String user = '8P55rpYTbvWjKPOiVaoCypiZXor1';

    // call my data
    final food = Provider.of<List<FoodModel>>(context);
    final she = Provider.of<AppUser>(context);
    final music = Provider.of<List<MusicModel>>(context);
    final highlight = Provider.of<List<HighlightModel>>(context);
    final interest = Provider.of<List<InterestModel>>(context);
    final personality = Provider.of<List<PersonalityModel>>(context);


    // list my data for presentation
    List<FoodModel> foodDisplay = food.where((item) => item.foodID == user || item.foodID == she.uid).toList();
    List<PersonalityModel> personalityDisplay = personality.where((item) => item.personalityID == user || item.personalityID == she.uid).toList();
    List<MusicModel> musicDisplay = music.where((item) => item.musicID == user || item.musicID == she.uid).toList();
    List<HighlightModel> highlightDisplay = highlight.where((item) => item.highlightID == user || item.highlightID == she.uid).toList();
    List<InterestModel> interestDisplay = interest.where((item) => item.interestID == user || item.interestID == she.uid).toList();


    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: const Text('logout', style: TextStyle(color: Colors.white),),
          onPressed: () async{
            await GuyHome._auth.logoff();
          }
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.4 ,
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
                  const Text('Welcome Broski', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),),
                  const Text('What do you have in store for your lady?')
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
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                          height: screenHeight * 0.3,
                          color: Colors.deepOrange,
                          child: const Center(child: Text('MOOD SUGGESTIONS', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))))
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
