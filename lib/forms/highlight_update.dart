import 'package:flutter/material.dart';
import 'package:girlfriend_translator/service/repository/highlight_repo.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class HighlightUpdate extends StatefulWidget {
  const HighlightUpdate({super.key});

  @override
  State<HighlightUpdate> createState() => _HighlightUpdateState();
}

class _HighlightUpdateState extends State<HighlightUpdate> {
  final _formKey = GlobalKey<FormState>();

  // text field state
  String ladyHighlight = '';
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
            Text("What else do you like about your lady?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
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
              decoration: InputDecoration(
                hintText: 'Warm heart',
              ),
              validator: (value){
                return value!.isEmpty ? 'Text cannot be empty!' : null;
              },
              onChanged: (value){
                setState(() {
                  ladyHighlight = value;
                });
              },
            ),


          ],
        ),
      ),
    );
  }
}
