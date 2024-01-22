import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), // Adjust radius as needed
          bottomRight: Radius.circular(20),),
        boxShadow:[ BoxShadow(color: Colors.black, blurRadius: 4.0,)],
        color: Colors.green[600],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: MediaQuery.of(context).size.width * .17,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            width: MediaQuery.of(context).size.width * .55,
            child:  const Card(
              color: Colors.deepPurple,
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text('Name:'),
                    // Text('Rhulani Peloeahae', style: TextStyle(fontWeight: FontWeight.bold)),
                    RichTxt(label: 'Name', user: 'Rhulani'),
                    RichTxt(label: 'Birthday', user: '1 April'),
                    RichTxt(label: 'From', user: 'Nicholas'),
                    RichTxt(label: 'Anniversary', user: '30 December')
                  ],
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
    return RichText(
      text: TextSpan(
        text: '${label}:',
        style: TextStyle(color: Colors.white, letterSpacing: 1),
        children:  <TextSpan>[
          TextSpan(text: '\n', style: TextStyle(color: Colors.transparent)),
          TextSpan(text: '$user', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
