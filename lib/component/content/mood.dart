import 'package:flutter/material.dart';

class HerMood extends StatelessWidget {
  HerMood({super.key});

  final List<String> moods   = ['Sad', 'Happy', 'Alone', 'Sick', 'Vent' ,'Spicy' ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Block(label: moods[0], picture: 'assets/sad.png',),
            Block(label: moods[1], picture: 'assets/smile.png'),
            Block(label: moods[2], picture: 'assets/alone.png'),
          ],
        ),
        SizedBox(height: 24.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Block(label: moods[3], picture: 'assets/sick.png'),
            Block(label: moods[4], picture: 'assets/vent.png'),
            Block(label: moods[5], picture: 'assets/spicy.png'),
          ],
        ),
      ],
    );
  }
}

class Block extends StatelessWidget {
  const Block({super.key, required this.label, required this.picture});

  final String label;
  final String picture;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.18;

    return Container(
      width: size,
      height: size,
      color: Colors.purple,
      child: GestureDetector(
        onTap: (){
          print('$label');
        },
        child: Center(
          child: Column(
            children: [
              Image.asset('$picture'),
              Text('$label', style: TextStyle(fontSize: 12.0, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
