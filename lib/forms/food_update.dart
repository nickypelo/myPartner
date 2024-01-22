import 'package:flutter/material.dart';
import 'package:girlfriend_translator/service/repository/food_repo.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class FoodUpdate extends StatefulWidget {
  const FoodUpdate({super.key});

  @override
  State<FoodUpdate> createState() => _FoodUpdateState();
}

class _FoodUpdateState extends State<FoodUpdate> {
  final _formKey = GlobalKey<FormState>();

  // text field state
  String _ladyFoodPlace = '';
  String _ladyFoodItem1 = '';
  String _ladyFoodItem2 = '';
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
            Text('Found a new place you like?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
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
                        await FoodRepo(uid: user.uid).createFoodData(_ladyFoodPlace, _ladyFoodItem1, _ladyFoodItem2);
                        print('Food added');
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Place:',
              ),
              validator: (value){
                return value!.isEmpty ? 'Place cannot be empty!' : null;
              },
              onChanged: (value){
                setState(() {
                  _ladyFoodPlace = value;
                });
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Food Option 1:',
              ),
              validator: (value){
                return value!.isEmpty ? 'Food cannot be empty!': null;
              },
              onChanged: (value){
                _ladyFoodItem1 = value;
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Food Option 2:',
              ),
              validator: (value){
                return value!.isEmpty ? 'Food cannot be empty!' : null;
              },
              onChanged: (value){
                _ladyFoodItem2 = value;
              },
            ),

          ],
        ),
      ),
    );
  }
}
