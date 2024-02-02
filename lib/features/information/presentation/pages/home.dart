import 'package:flutter/material.dart';

//3rd party packages
import 'package:accordion/accordion.dart';

// local imports

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
import '../widgets/home_content/about.dart';
import '../widgets/home_content/food.dart';
import '../widgets/home_content/hightlight.dart';
import '../widgets/home_content/interests.dart';
import '../widgets/home_content/mood.dart';
import '../widgets/home_content/music.dart';
import '../widgets/profile.dart';
import '../widgets/quote.dart';


class HomePage extends StatefulWidget {
   const HomePage({super.key});

  static final AuthService _auth = AuthService();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // final String name = ;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    final userDetails = Provider.of<List<UserDetailsModel>>(context);
    final couple = Provider.of<List<RelationshipModel>>(context);

    // establish users
    UserDetailsModel current = UserDetailsModel(userID: '', firstname: '', lastname: '', partnerEmail: '', role: '', fcmToken: '');
    UserDetailsModel myLady = UserDetailsModel(userID: '', firstname: '', lastname: '', partnerEmail: '', role: '', fcmToken: '');

    // UserDetailsModel current2 = UserDetailsModel(userID: '', firstname: '', lastname: '', partnerEmail: '', role: '', fcmToken: '');
    // UserDetailsModel myLady2 = UserDetailsModel(userID: '', firstname: '', lastname: '', partnerEmail: '', role: '', fcmToken: '');


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

    // call my data
    // final food = Provider.of<List<FoodModel>>(context);
    // final music = Provider.of<List<MusicModel>>(context);
    // final highlight = Provider.of<List<HighlightModel>>(context);
    // final interest = Provider.of<List<InterestModel>>(context);
    // final personality = Provider.of<List<PersonalityModel>>(context);
    final food = context.watch<List<FoodModel>>();
    final music = context.watch<List<MusicModel>>();
    final highlight = context.watch<List<HighlightModel>>();
    final interest = context.watch<List<InterestModel>>();
    final personality = context.watch<List<PersonalityModel>>();


    // list my data for presentation
    List<FoodModel> foodDisplay = food.where((item) => item.foodID == current.userID || item.foodID == myLady.userID).toList();
    List<PersonalityModel> personalityDisplay = personality.where((item) => item.personalityID == current.userID || item.personalityID == myLady.userID).toList();
    List<MusicModel> musicDisplay = music.where((item) => item.musicID == current.userID || item.musicID == myLady.userID).toList();
    List<HighlightModel> highlightDisplay = highlight.where((item) => item.highlightID == current.userID || item.highlightID == myLady.userID).toList();
    List<InterestModel> interestDisplay = interest.where((item) => item.interestID == current.userID || item.interestID == myLady.userID).toList();

    return Scaffold(
        backgroundColor: const Color(0xFF7169B4),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
          child: const Text('logout', style: TextStyle(color: Colors.white),),
          onPressed: () async{
            await HomePage._auth.logoff();
        }
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg-gf.jpg'), fit: BoxFit.fitHeight
              )
            ),
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8.0,),
                Profile(myLady: userDetails[index], myDude: userDetails[partnerIndex]),
                const SizedBox(height: 8.0,),
                Mood(myLady: userDetails[index], myDude: userDetails[partnerIndex]),
                // const SizedBox(height: 15.0,),
                Accordion(
                  children: [
                    AccordionSection(
                      headerBackgroundColor: Colors.deepPurple,
                      headerBorderRadius: 0,
                      headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                      headerPadding: const EdgeInsets.all(8.0),
                      contentBackgroundColor: Colors.white.withOpacity(0.1),
                      leftIcon: Image.asset('assets/myBook.png'),
                      header: const Header(heading: 'Word of the day',),
                      content: const Quote(),
                    ),
                    AccordionSection(
                        headerBackgroundColor: Colors.green[700],
                        headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                        headerBorderRadius: 0,
                        headerPadding: const EdgeInsets.all(8.0),
                        leftIcon: Image.asset('assets/persona.png'),
                        header:  const Header(heading: 'Personality',),
                        content: Personality(personality: personalityDisplay.isEmpty ? [PersonalityModel(ladyPersonalityDescription: '', personalityID: '0')] : personalityDisplay,)
                    ),
                    AccordionSection(
                        headerBackgroundColor: Colors.deepPurple,
                        headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                        headerPadding: const EdgeInsets.all(8.0),
                        headerBorderRadius: 0,
                        leftIcon: Image.asset('assets/interest.png'),
                        header: const Header(heading: 'Interests'),
                        content: Interests(interest: interestDisplay.isEmpty ? [InterestModel(interestID: '', ladyInterest: '')] : interestDisplay,)
                    ),
                    AccordionSection(
                        headerBackgroundColor: Colors.green[700],
                        headerBorderRadius: 0,
                        headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                        headerPadding: const EdgeInsets.all(8.0),
                        leftIcon: Image.asset('assets/burger.png'),
                        header: const Header(heading: 'Food',),
                        content: Food(food: foodDisplay.isEmpty ? [FoodModel(foodID: '1', ladyFoodItem1: '', ladyFoodItem2: '', ladyFoodPlace: '')] : foodDisplay,)
                    ),
                    AccordionSection(
                        headerBackgroundColor: Colors.deepPurple,
                        headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                        headerPadding: const EdgeInsets.all(8.0),
                        headerBorderRadius: 0,
                        leftIcon: Image.asset('assets/music.png'),
                        header: const Header(heading: 'Music'),
                        content: Music(music: musicDisplay.isEmpty ? [MusicModel(musicArtist: '', musicID: '', musicSongName: '', musicWho: '')] : musicDisplay,)
                    ),
                    AccordionSection(
                        headerBackgroundColor: Colors.green[700],
                        headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                        headerPadding: const EdgeInsets.all(8.0),
                        headerBorderRadius: 0,
                        leftIcon: Image.asset('assets/freak.png'),
                        header: const Header(heading: 'What I like About You',),
                        content: Highlights(highlight: highlightDisplay.isEmpty ? [HighlightModel(highlightID: '', ladyHighlight: '')] : highlightDisplay,)
                    ),
                  ],
                ),
                const SizedBox(height: 50.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(80.0),
        )
      ),
        child: Text(heading,
          style: const TextStyle(letterSpacing: 1,fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.bold),)
    );
  }
}

