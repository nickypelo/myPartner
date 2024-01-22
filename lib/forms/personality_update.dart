import 'package:flutter/material.dart';

class PersonalityUpdate extends StatefulWidget {
  const PersonalityUpdate({super.key});

  @override
  State<PersonalityUpdate> createState() => _PersonalityUpdateState();
}

class _PersonalityUpdateState extends State<PersonalityUpdate> {
  final _formKey = GlobalKey<FormState>();

  // text field state
  String ladyPersonalityDescription = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[50],
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height *.6,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text("What do you want to add about your lady's personality?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){}
                    },
                    child: Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              maxLines: 6,
              maxLength: 200,
              decoration: InputDecoration(
                hintText: 'You are ...',
              ),
              validator: (value){
                return value!.isEmpty ? 'Text cannot be empty!' : null;
              },
              onChanged: (value){
                setState(() {
                  ladyPersonalityDescription = value;
                });
              },
            ),


          ],
        ),
      ),
    );
  }
}
