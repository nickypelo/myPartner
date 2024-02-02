import 'package:MyPartner/features/information/data/models/highlight_model.dart';
import 'package:MyPartner/features/information/data/repository/highlight_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../authentication/data/models/user.dart';


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
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height *.6,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0,),
            const Text("What else do you like about your lady?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
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
                        HighlightModel item =  HighlightModel(highlightID: user.uid, ladyHighlight: ladyHighlight);
                        await HighlightRepositoryImpl().addHighlight(item);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
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
