import 'package:flutter/material.dart';

import '../../../data/models/highlight_model.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key, required this.highlight});

  final List<HighlightModel> highlight;
  @override
  Widget build(BuildContext context) {
    List<HighlightModel> highlightDisplay;
    highlight.length > 4 ? highlightDisplay=highlight.where((item) => highlight.indexOf(item)<4).toList() : highlightDisplay= highlight.toList();

    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: highlightDisplay.length,
            itemBuilder: (context, index){
            return ListTile(
                title: Text(highlightDisplay[index].ladyHighlight.toString(), style: const TextStyle(fontSize: 14),));
            }
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: (){
                  print('Indeed');
                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                    'title': 'What I Like About You.',
                    'description': highlight,
                    'name': 'highlight'
                  });
                },
                child: const Text('show more'))
          ],
        )]
    );
  }
}
