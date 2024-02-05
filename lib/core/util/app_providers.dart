
import 'package:MyPartner/features/authentication/presentation/provider/relationship_provider.dart';
import 'package:MyPartner/features/information/presentation/provider/highlight_provider.dart';
import 'package:MyPartner/features/information/presentation/provider/interest_provider.dart';
import 'package:MyPartner/features/information/presentation/provider/lady_provider.dart';
import 'package:MyPartner/features/information/presentation/provider/personality_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../features/authentication/data/models/relationship_model.dart';
import '../../features/authentication/data/models/user.dart';
import '../../features/authentication/data/models/user_details.dart';
import '../../features/authentication/data/repository/auth_service.dart';
import '../../features/authentication/presentation/provider/user_provider.dart';
import '../../features/information/data/models/food_model.dart';
import '../../features/information/data/models/highlight_model.dart';
import '../../features/information/data/models/interest_model.dart';
import '../../features/information/data/models/lady_model.dart';
import '../../features/information/data/models/music_model.dart';
import '../../features/information/data/models/personality_model.dart';

import '../../features/information/presentation/provider/food_provider.dart';
import '../../features/information/presentation/provider/music_provider.dart';
import '../../features/information/presentation/provider/notification_provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<AppUser?>.value(value: AuthService().user,initialData: null,catchError: (_,__){return null;},),
        StreamProvider(create: (context) => foodCollectionProvider(context), initialData: [FoodModel(foodID: '', ladyFoodType: '', ladyFoodItem1: '', ladyFoodItem2: '')]),
        StreamProvider(create: (context) => highlightCollectionProvider(context), initialData: [HighlightModel(highlightID: '', ladyHighlight: '')]),
        StreamProvider(create: (context) => interestCollectionProvider(context), initialData: [InterestModel(interestID: '', ladyInterest: '')]),
        StreamProvider(create: (context) => ladyCollectionProvider(context), initialData: [LadyModel(userID: '', ladyBirthDate: '', anniversaryDate: '')]),
        StreamProvider(create: (context) => musicCollectionProvider(context), initialData: [MusicModel(musicArtist: '', musicID: '', musicSongName: '', musicWho: '')]),
        StreamProvider(create: (context) => personalityCollectionProvider(context), initialData: [PersonalityModel(personalityID: '', ladyPersonalityDescription: '')]),
        StreamProvider(create: (context) => relationshipCollectionProvider(context), initialData: [RelationshipModel(boyfriend: '', girlfriend: '')]),
        StreamProvider(create: (context) => userCollectionProvider(context), initialData: [UserDetailsModel(fcmToken: '', firstname: '', lastname: '', userID: '', role: '', partnerEmail: '')]),
        ChangeNotifierProvider(create:  (context) => MessageProvider())
      ],
      child: child,
    );
  }
}
