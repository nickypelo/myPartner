import 'package:MyPartner/features/information/data/models/personality_model.dart';
import 'package:MyPartner/features/information/data/repository/personality_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../authentication/data/models/user.dart';

class PersonalityUpdate extends StatefulWidget {
  const PersonalityUpdate({super.key});

  @override
  State<PersonalityUpdate> createState() => _PersonalityUpdateState();
}

class _PersonalityUpdateState extends State<PersonalityUpdate> {
  final _formKey = GlobalKey<FormState>();

  // text field state
  String _ladyPersonalityDescription = '';
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
            const Text("What do you want to add about your lady's personality?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
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
                        PersonalityModel item = PersonalityModel(personalityID: user.uid, ladyPersonalityDescription: _ladyPersonalityDescription);
                        await PersonalityRepositoryImpl().addMusic(item);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              maxLines: 6,
              maxLength: 200,
              decoration: const InputDecoration(
                hintText: 'You are ...',
              ),
              validator: (value){
                return value!.isEmpty ? 'Text cannot be empty!' : null;
              },
              onChanged: (value){
                setState(() {
                  _ladyPersonalityDescription = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
