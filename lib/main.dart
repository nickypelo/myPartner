import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/authentication/presentation/pages/register.dart';
import 'package:girlfriend_translator/features/authentication/presentation/pages/sign_in.dart';

//firebase and provider
import 'package:firebase_core/firebase_core.dart';
import 'package:girlfriend_translator/features/information/data/repository/food_repo.dart';
import 'package:girlfriend_translator/features/information/data/repository/highlight_repo.dart';
import 'package:girlfriend_translator/features/information/data/repository/interest_repo.dart';
import 'package:girlfriend_translator/features/information/data/repository/lady_repo.dart';
import 'package:girlfriend_translator/features/information/data/repository/music_repo.dart';
import 'package:girlfriend_translator/features/information/data/repository/personality_repo.dart';
import 'features/authentication/domain/repository/auth_service.dart';
import 'features/information/presentation/pages/home.dart';
import 'features/information/presentation/pages/moreInfo.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

// local imports
import 'features/information/data/models/food_model.dart';
import 'features/information/data/models/highlight_model.dart';
import 'features/information/data/models/interest_model.dart';
import 'features/information/data/models/lady_model.dart';
import 'features/information/data/models/music_model.dart';
import 'features/information/data/models/personality_model.dart';
import 'features/authentication/data/models/user.dart';


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
        StreamProvider<AppUser?>.value(value: AuthService().user,initialData: null,catchError: (_,__){
          return null;
        },),
        StreamProvider<List<FoodModel>>.value(value: FoodRepo(uid: '').food, initialData: const []),
        StreamProvider<List<HighlightModel>>.value(value: HighlightRepo(uid: '').highlight, initialData: const []),
        StreamProvider<List<InterestModel>>.value(value: InterestRepo(uid: '').interest, initialData: const []),
        StreamProvider<List<LadyModel>>.value(value: LadyRepo(uid: '').lady, initialData: const []),
        StreamProvider<List<MusicModel>>.value(value: MusicRepo(uid: '').music, initialData: const []),
        StreamProvider<List<PersonalityModel>>.value(value: PersonalityRepo(uid: '').personality, initialData: const []),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
          '/moreInfo': (context) => const MoreInfo(),
          '/register': (context) => const Register(),
          '/login': (context) => const SignIn()
        },
      ),
    );
  }
}
