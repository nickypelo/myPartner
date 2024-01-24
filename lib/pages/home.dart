import 'package:flutter/material.dart';

//3rd party packages
import 'package:accordion/accordion.dart';
import 'package:girlfriend_translator/component/mood.dart';

// local imports
import 'package:girlfriend_translator/component/profile.dart';
import 'package:girlfriend_translator/component/content/mood.dart';
import 'package:girlfriend_translator/component/content/music.dart';
import 'package:girlfriend_translator/component/content/quote.dart';
import 'package:girlfriend_translator/component/content/about.dart';
import 'package:girlfriend_translator/component/content/food.dart';
import 'package:girlfriend_translator/component/content/hightlight.dart';
import 'package:girlfriend_translator/component/content/interests.dart';
import 'package:girlfriend_translator/service/repository/food_repo.dart';
import 'package:provider/provider.dart';
import '../service/auth/authService.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static final AuthService _auth = AuthService();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

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
                  const Profile(),
                  const SizedBox(height: 25.0,),
                   Row(
                     children: [
                       Expanded(
                         flex: 1,
                           child: Padding(
                             padding: const EdgeInsets.only(left: 20.0),
                             child: RichText(
                               text: const TextSpan(
                                 text: 'HOW DO', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                 children: [
                                   TextSpan(text: '\nYOU', style: TextStyle(letterSpacing: 2,fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0)),
                                   TextSpan(text: '\nFEEL',style: TextStyle(letterSpacing: 1.5,fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0))
                                 ]
                               ),
                             ),
                           ),
                       ),
                       const Expanded(
                         flex: 4,
                           child: Mood())
                     ],
                   ),
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

