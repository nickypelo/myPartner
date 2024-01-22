import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:girlfriend_translator/component/content/music.dart';
import 'package:girlfriend_translator/pages/authenticate/sign_in.dart';
import 'package:girlfriend_translator/pages/greeting.dart';
import 'package:girlfriend_translator/pages/home.dart';

//firebase and provider
import 'package:firebase_core/firebase_core.dart';
import 'package:girlfriend_translator/pages/moreInfo.dart';
import 'package:girlfriend_translator/pages/wrapper.dart';
import 'package:girlfriend_translator/service/auth/authService.dart';
import 'package:girlfriend_translator/service/repository/food_repo.dart';
import 'package:girlfriend_translator/service/repository/highlight_repo.dart';
import 'package:girlfriend_translator/service/repository/interest_repo.dart';
import 'package:girlfriend_translator/service/repository/lady_repo.dart';
import 'package:girlfriend_translator/service/repository/music_repo.dart';
import 'package:girlfriend_translator/service/repository/personality_repo.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

// local imports
import 'model/food_model.dart';
import 'model/highlight_model.dart';
import 'model/interest_model.dart';
import 'model/lady_model.dart';
import 'model/music_model.dart';
import 'model/personality_model.dart';
import 'model/user.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<AppUser?>.value(value: AuthService().user,initialData: null,catchError: (_,__){},),
        StreamProvider<List<FoodModel>>.value(value: FoodRepo(uid: '').food, initialData: []),
        StreamProvider<List<HighlightModel>>.value(value: HighlightRepo(uid: '').highlight, initialData: []),
        StreamProvider<List<InterestModel>>.value(value: InterestRepo(uid: '').interest, initialData: []),
        StreamProvider<List<LadyModel>>.value(value: LadyRepo(uid: '').lady, initialData: []),
        StreamProvider<List<MusicModel>>.value(value: MusicRepo(uid: '').music, initialData: []),
        StreamProvider<List<PersonalityModel>>.value(value: PersonalityRepo(uid: '').personality, initialData: []),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Greeting(),
          '/moreInfo': (context) => MoreInfo(),
          'signIn': (context) => SignIn(toggleView: (){})
        },
      ),
    );
  }
}
