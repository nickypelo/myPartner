import 'package:flutter/material.dart';

//3rd party imports
import 'package:carousel_slider/carousel_slider.dart';

class Mood extends StatelessWidget {
  const Mood({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width * 0.18,
        enableInfiniteScroll: false,
        viewportFraction: 0.27,
      ),
      items: feelings.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Block(label: i.label, picture: i.picture,);
          },
        );
      }).toList(),
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