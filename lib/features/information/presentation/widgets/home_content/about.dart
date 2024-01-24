import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/information/data/models/personality_model.dart';
import 'package:provider/provider.dart';

class Personality extends StatefulWidget {
  const Personality({super.key});

  @override
  State<Personality> createState() => _PersonalityState();
}

class _PersonalityState extends State<Personality> {
  final String title = "What I see.";

  @override
  Widget build(BuildContext context) {
    // access personality data
    // final personality = Provider.of<List<PersonalityModel>>(context)[0];
    // final description  = personality.ladyPersonalityDescription;

    // access personality data
    final personality = Provider.of<List<PersonalityModel>>(context);
    List<PersonalityModel> personalityDisplay;

    personality.length > 1 ? personalityDisplay=personality.where((item) => personality.indexOf(item)<4).toList() : personalityDisplay= personality.toList();

    return Container(
      child: Column(
        children: <Widget>[
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(personalityDisplay[0].ladyPersonalityDescription.toString(), overflow: TextOverflow.ellipsis, maxLines: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/moreInfo',arguments: {
                      'description': personality,
                      'title': title,
                      'name': 'about'
                    });
                  },
                  child: const Text('show more'))
            ],
          )
        ],
      ),
    );
  }
}
