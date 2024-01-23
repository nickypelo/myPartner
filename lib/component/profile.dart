import 'dart:ui';

import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    //sizes
    double breadth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              width: breadth * .92,
              margin: const EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
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
                          child: const ListTile(
                            title: Text('Rhulani baby girl', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                            subtitle: Text('Surname', style: TextStyle(color: Colors.white),),
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
                        child: const Card(
                          color: Colors.transparent,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RichTxt(label: 'Birthday', user: ': 1 April'),
                                RichTxt(label: 'Partner', user: ': Nicholas Peloeahae'),
                                RichTxt(label: 'Anniversary', user: ': 30 December')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            child: Text(user, style: const TextStyle(color: Colors.white)))
      ]
    );
  }
}
