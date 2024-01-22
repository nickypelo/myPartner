import 'package:flutter/material.dart';
import 'package:girlfriend_translator/model/interest_model.dart';
import 'package:provider/provider.dart';

class Interests extends StatefulWidget {
  const Interests({super.key});

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  @override
  Widget build(BuildContext context) {

    // access food data
    final interest = Provider.of<List<InterestModel>>(context);
    List<InterestModel> interestDisplay;

    interest.length > 4 ? interestDisplay=interest.where((item) => interest.indexOf(item)<4).toList() : interestDisplay= interest.toList();

    return Column(
      children: <Widget>[
        ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(interestDisplay[index].ladyInterest.toString(), style: TextStyle(fontSize: 14),),
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
                child: Text('show more'))
          ],
        )]
    );
  }
}

///
