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
              : value.contains('sad')
              ? const Sad()
              : value.contains('attention')
              ? const Alone()
              : value.contains('world')
              ? const Spicy()
              : value.contains('sick')
              ? const Sick()
              : value.contains('Vent!')
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

    final List<String> suggestion = ['Prepare yourself.', 'Get some wine.', 'Do not talk about work.'];

    return Column(
      children: [
        Text('Spicy', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        ListView.builder(
          shrinkWrap: true,
          itemCount: suggestion.length,
          itemBuilder: (context, index){
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              leading: const Text('-'),
              title: Text(suggestion[index]),
            );
          })
      ],
    );
  }
}

// sad suggestion
class Sad extends StatelessWidget {
  const Sad({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> suggestion = ['Get her food.', 'Endless Hugs.', 'Get her something.'];

    return Column(
      children: [
        Text('Sad', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        ListView.builder(
            shrinkWrap: true,
            itemCount: suggestion.length,
            itemBuilder: (context, index){
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Text('-'),
                title: Text(suggestion[index]),
              );
            })
      ],
    );
  }
}

// alone suggestion
class Alone extends StatelessWidget {
  const Alone({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> suggestion = ['Schedule a date.', 'Take a walk with her.', 'Endless Hugs.', 'Talk to her about stuff you like and stuff she likes.', 'Watch a movie together.'];

    return Column(
      children: [
        Text('Alone', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        ListView.builder(
            shrinkWrap: true,
            itemCount: suggestion.length,
            itemBuilder: (context, index){
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Text('-'),
                title: Text(suggestion[index]),
              );
            })
      ],
    );
  }
}

// sick suggestion
class Sick extends StatelessWidget {
  const Sick({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> suggestion = ['Check up on her.', 'Make her a home remedy.', 'Check if you can go to a doctor with her.'];

    return Column(
      children: [
        Text('Sick', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        ListView.builder(
            shrinkWrap: true,
            itemCount: suggestion.length,
            itemBuilder: (context, index){
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Text('-'),
                title: Text(suggestion[index]),
              );
            })
      ],
    );
  }
}

// vent suggestion
class Vent extends StatelessWidget {
  const Vent({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> suggestion = ['Listen.', 'Do not offer your thoughts.', 'Do not give advice.', 'Conclude the session with snacks and fun time.'];

    return Column(
      children: [
        Text('Vent', style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold, fontSize: 16.0),),
        const SizedBox(height: 22.0,),
        ListView.builder(
            shrinkWrap: true,
            itemCount: suggestion.length,
            itemBuilder: (context, index){
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                leading: const Text('-'),
                title: Text(suggestion[index]),
              );
            })
      ],
    );
  }
}


