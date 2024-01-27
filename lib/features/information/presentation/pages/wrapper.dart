import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/authentication/data/models/relationship_model.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user_details.dart';
import 'package:girlfriend_translator/features/authentication/presentation/pages/sign_in.dart';
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

    // current user index
    int index = isUser ? userDetails.indexWhere((element) => element.userID == user?.uid) : -1;

    if(isUser){
      // boyfriend/girlfriend login
      isBoyfriend = (couple.indexWhere((element) => element.girlfriend == userDetails[index].partnerEmail)) != -1;

      // partner info
      int indexCouple = isBoyfriend ?
      couple.indexWhere((element) => element.girlfriend == userDetails[index].partnerEmail) :
      couple.indexWhere((element) => element.boyfriend == userDetails[index].partnerEmail);

      // my details
      print(userDetails[index].firstname);
      print(userDetails[index].userID);
      print(indexCouple);

      // my partner details
      int partnerIndex;

      if(isBoyfriend){
        partnerIndex = userDetails.indexWhere((element) => element.partnerEmail == couple[indexCouple].boyfriend);
        print('haibo');
        print(userDetails[partnerIndex].firstname);
      }
      else{
        partnerIndex = userDetails.indexWhere((element) => element.partnerEmail == couple[indexCouple].girlfriend);
        print(userDetails[partnerIndex].firstname);
      }


    }

    // print(user?.uid);
    // print(index);

    if(user == null) {
      return const Greeting();
    }else{
      if(isBoyfriend){
        return const GuyHome();
      }
      else if(!isBoyfriend){
        return const HomePage();
      }
      return const HomePage();
    }
  }
}
