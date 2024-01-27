import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/authentication/data/models/relationship_model.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user_details.dart';
import 'package:provider/provider.dart';

// local imports
import '../../../authentication/data/models/user.dart';
import 'greeting.dart';
import 'guy_home.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // data
    final user = Provider.of<AppUser?>(context);
    final userDetails = Provider.of<List<UserDetailsModel>>(context);
    final couple = Provider.of<List<RelationshipModel>>(context);

    bool isUser = userDetails.indexWhere((element) => element.userID == user?.uid) != -1;
    bool isBoyfriend = false;
    // my partner details

    if(isUser){
      // current user index
      int index = userDetails.indexWhere((element) => element.userID == user?.uid);

      // boyfriend/girlfriend login
      isBoyfriend = (couple.indexWhere((element) => element.girlfriend == userDetails[index].partnerEmail)) != -1;
    }

    if(user == null) {
      return const Greeting();
    }else{
      if(isBoyfriend){
        return const GuyHome();
      }
      else if(!isBoyfriend){
        return const HomePage();
      }
      return const Greeting();
    }
  }
}
