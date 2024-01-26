import 'package:flutter/material.dart';

//3rd party imports
import 'package:carousel_slider/carousel_slider.dart';

class Mood extends StatelessWidget {
  const Mood({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0,),
      color: Colors.deepPurple.withOpacity(0.4),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: RichText(
              text:  const TextSpan(
                text: 'HOW DO', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                children: [
                  TextSpan(text: '\nYOU >>', style: TextStyle(letterSpacing: 2,fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20.0)),
                  TextSpan(text: '\nFEEL?',style: TextStyle(letterSpacing: 1.5,fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20.0))
                ]
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: CarouselSlider(
              options: CarouselOptions(
                initialPage: 1,
                height: MediaQuery.of(context).size.width * 0.18,
                enableInfiniteScroll: false,
                viewportFraction: 0.28,
              ),
              items: feelings.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Block(label: i.label, picture: i.picture,);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
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
      color: Colors.green.withOpacity(0.8),
      child: GestureDetector(
        onTap: (){
          print(label);
        },
        child: Center(
          child: Column(
            children: [
              Image.asset(picture),
              Text(label, style: const TextStyle(fontSize: 12.0, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}


class Feeling {
  String label;
  String picture;

  Feeling({required this.label, required this.picture});
}

final List<Feeling> feelings = [
  Feeling(label: 'Sad', picture: 'assets/sad.png'),
  Feeling(label: 'Happy', picture: 'assets/smile.png'),
  Feeling(label: 'Alone', picture: 'assets/alone.png'),
  Feeling(label: 'Spicy', picture: 'assets/spicy.png'),
  Feeling(label: 'Sick', picture: 'assets/sick.png'),
  Feeling(label: 'Vent', picture: 'assets/vent.png'),
];