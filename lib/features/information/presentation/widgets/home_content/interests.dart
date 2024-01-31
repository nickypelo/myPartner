import 'package:flutter/material.dart';

import '../../../data/models/interest_model.dart';

class Interests extends StatelessWidget {
  const Interests({super.key, required this.interest});

  final List<InterestModel> interest;

  @override
  Widget build(BuildContext context) {
    List<InterestModel> interestDisplay;
    interest.length > 4 ? interestDisplay=interest.where((item) => interest.indexOf(item)<4).toList() : interestDisplay= interest.toList();

    return Column(
      children: <Widget>[
        ListView.builder(
          itemCount: interestDisplay.length,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(interestDisplay[index].ladyInterest.toString(), style: const TextStyle(fontSize: 14),),
            ) ;
          }
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                    'title': 'Interests',
                    'description': interest,
                    'name': 'interests'
                  });
                },
                child: const Text('show more'))
          ],
        )]
    );
  }
}

///
