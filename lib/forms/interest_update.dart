import 'package:flutter/material.dart';
import 'package:girlfriend_translator/model/user.dart';
import 'package:girlfriend_translator/service/repository/interest_repo.dart';
import 'package:provider/provider.dart';

class InterestUpdate extends StatefulWidget {
  const InterestUpdate({super.key});

  @override
  State<InterestUpdate> createState() => _InterestUpdateState();
}

class _InterestUpdateState extends State<InterestUpdate> {
  final _formKey = GlobalKey<FormState>();

  // text field state
  String _ladyInterest = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // access user
    final user = Provider.of<AppUser>(context);

    return Container(
      color: Colors.purple[50],
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height *.6,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text("Something new?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        await InterestRepo(uid: user.uid).createInterestData( _ladyInterest);
                        print('Interest Updated');
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'New Interest?',
              ),
              validator: (value){
                return value!.isEmpty ? 'Text cannot be empty!' : null;
              },
              onChanged: (value){
                setState(() {
                  _ladyInterest = value;
                });
              },
            ),


          ],
        ),
      ),
    );
  }
}
