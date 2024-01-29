import 'package:flutter/material.dart';

class MoodInfo extends StatefulWidget {
  const MoodInfo({super.key});

  @override
  State<MoodInfo> createState() => _MoodInfoState();
}

class _MoodInfoState extends State<MoodInfo> {
  // get arguments
  static Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    // size
    double breadth = MediaQuery.of(context).size.width * .95;

    String value = data['moodAttribute'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Her Mood'),
        centerTitle: true,
        titleTextStyle: const TextStyle(letterSpacing: 1.5, fontSize: 20.0, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the desired color here
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey
            )
        ),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(12.0),
        width: breadth,
        height: MediaQuery.of(context).size.height,
        child: value == ''
              ? const Text('')
              : value == 'I feel sad.'
              ? const Sad()
              : value == 'I want your attention.'
              ? const Alone()
              : value == 'I wanna rock your world.'
              ? const Spicy()
              : value == 'I feel sick'
              ? const Sick()
              : value == 'I want to Vent!'
              ? const Vent()
              : const Text('She feels happy.')
        ,
      )

    );
  }
}

// spicy suggestion
class Spicy extends StatelessWidget {
  const Spicy({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Spicy', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        const Text('- Prepare yourself.'),
        const Text('- Get some wine.'),
        const Text('- Do not talk about work.'),
      ],
    );
  }
}

// sad suggestion
class Sad extends StatelessWidget {
  const Sad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sad', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        const Text('- Get her food.'),
        const Text('- Endless Hugs.'),
        const Text('- Get her something.'),
      ],
    );
  }
}

// alone suggestion
class Alone extends StatelessWidget {
  const Alone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Alone', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        const Text('- Schedule a date.'),
        const Text('- Take a walk with her.'),
        const Text('- Endless Hugs.'),
        const Text('- Talk to her about stuff you like and stuff she likes.'),
        const Text('- Watch a movie together.'),
      ],
    );
  }
}

// sick suggestion
class Sick extends StatelessWidget {
  const Sick({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sick', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        const Text('- Check up on her.'),
        const Text('- Make her a home remedy.'),
        const Text('- Check if you can go to a doctor with her.'),
      ],
    );
  }
}

// vent suggestion
class Vent extends StatelessWidget {
  const Vent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Vent', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        const Text('- Listen.'),
        const Text('- Do not offer your thoughts.'),
        const Text('- Do not give advice.'),
        const Text('- Conclude the session with snacks and fun time.'),
      ],
    );
  }
}


