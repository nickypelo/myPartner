import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user_details.dart';
import 'package:girlfriend_translator/features/information/data/models/lady_model.dart';
import 'package:provider/provider.dart';


class Profile extends StatelessWidget {
  const Profile({super.key, required this.myLady, required this.myDude});

  final UserDetailsModel myLady;
  final UserDetailsModel myDude;

  @override
  Widget build(BuildContext context) {
    // access data
    final ladyDetails = Provider.of<List<LadyModel>>(context);
    LadyModel ladyDisplay;

    int specific = ladyDetails.indexWhere((element) => element.userID == myDude.userID);
    ladyDisplay = ladyDetails[specific];

    //sizes
    double breadth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return
        Container(
          width: breadth * .92,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black.withOpacity(0.25),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 12, 0, 0),
                      width: MediaQuery.of(context).size.width * .5,
                      height: 80,
                      child:  ListTile(
                        title: Text(myLady.firstname.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                        subtitle: Text(myLady.lastname.toString(), style:  const TextStyle(color: Colors.white),),
                        ),
                      ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      // backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/profile.png'),
                      radius: 42,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0,),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: SizedBox(
                    width: breadth,
                    height: screenHeight * .15,
                    child:  Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding:  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichTxt(label: 'Birthday', user: ladyDisplay.ladyBirthDate.toString()),
                            RichTxt(label: 'Partner', user: ('${myDude.firstname} ${myDude.lastname}')),
                            RichTxt(label: 'Anniversary', user: ladyDisplay.anniversaryDate.toString())
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

class RichTxt extends StatelessWidget {
  final String label;
  final String user;
  const RichTxt({super.key, required this.label, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
            child: Text(label, style: const TextStyle(color: Colors.white),)),
        Expanded(
          flex: 2,
            child: Text(': $user', style: const TextStyle(color: Colors.white)))
      ]
    );
  }
}
