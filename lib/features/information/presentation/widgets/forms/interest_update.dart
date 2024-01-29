import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user.dart';
import 'package:girlfriend_translator/features/information/data/repository/interest_repo.dart';
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
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height *.6,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0,),
            const Text("Something new?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            const SizedBox(height: 20.0,),
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
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
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
