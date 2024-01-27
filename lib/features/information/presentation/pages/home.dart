import 'package:flutter/material.dart';

//3rd party packages
import 'package:accordion/accordion.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user_details.dart';
import 'package:girlfriend_translator/features/information/presentation/widgets/home_content/mood.dart';

// local imports
import 'package:girlfriend_translator/features/information/presentation/widgets/profile.dart';
import 'package:girlfriend_translator/features/information/presentation/widgets/home_content/music.dart';
import 'package:girlfriend_translator/features/information/presentation/widgets/quote.dart';
import 'package:girlfriend_translator/features/information/presentation/widgets/home_content/about.dart';
import 'package:girlfriend_translator/features/information/presentation/widgets/home_content/food.dart';
import 'package:girlfriend_translator/features/information/presentation/widgets/home_content/hightlight.dart';
import 'package:girlfriend_translator/features/information/presentation/widgets/home_content/interests.dart';
import 'package:provider/provider.dart';
import '../../../authentication/data/models/relationship_model.dart';
import '../../../authentication/data/models/user.dart';
import '../../../authentication/data/repository/auth_service.dart';


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

    bool isUser = userDetails.indexWhere((element) => element.userID == user?.uid) != -1;
    bool isBoyfriend = false;
    // my partner details
    int partnerIndex = 0;

    // current user index
    int index = isUser ? userDetails.indexWhere((element) => element.userID == user?.uid) : -1;

    if(isUser){
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

    }

    return Scaffold(
        backgroundColor: const Color(0xFF7169B4),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
          child: const Text('logout', style: TextStyle(color: Colors.white),),
          onPressed: () async{
            await HomePage._auth.logoff();
          }
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-gf.jpg'), fit: BoxFit.fitHeight
            )
          ),
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8.0,),
                  Profile(myLady: userDetails[index], myDude: userDetails[partnerIndex]),
                  const SizedBox(height: 25.0,),
                  const Mood(),
                  const SizedBox(height: 15.0,),
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
                          header: const Header(heading: 'Personality',),
                          content: const Personality()
                      ),
                      AccordionSection(
                          headerBackgroundColor: Colors.deepPurple,
                          headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                          headerPadding: const EdgeInsets.all(8.0),
                          headerBorderRadius: 0,
                          leftIcon: Image.asset('assets/interest.png'),
                          header: const Header(heading: 'Interests'),
                          content: const Interests()
                      ),
                      AccordionSection(
                          headerBackgroundColor: Colors.green[700],
                          headerBorderRadius: 0,
                          headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                          headerPadding: const EdgeInsets.all(8.0),
                          leftIcon: Image.asset('assets/foody.png'),
                          header: const Header(heading: 'Food',),
                          content: const Food()
                      ),
                      AccordionSection(
                          headerBackgroundColor: Colors.deepPurple,
                          headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                          headerPadding: const EdgeInsets.all(8.0),
                          headerBorderRadius: 0,
                          leftIcon: Image.asset('assets/music.png'),
                          header: const Header(heading: 'Music'),
                          content: const Music()
                      ),
                      AccordionSection(
                          headerBackgroundColor: Colors.green[700],
                          headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
                          headerPadding: const EdgeInsets.all(8.0),
                          headerBorderRadius: 0,
                          leftIcon: Image.asset('assets/freak.png'),
                          header: const Header(heading: 'What I like About You',),
                          content: const Highlights()
                      ),
                    ],
                  ),
                ],)
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
        height: 50.0,
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(80.0),
        )
      ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(heading,
            style: const TextStyle(letterSpacing: 1,fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.bold),),
        )
    );
  }
}

