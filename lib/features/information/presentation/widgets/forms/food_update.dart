import 'package:MyPartner/features/information/data/repository/food_repo_impl.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../authentication/data/models/user.dart';
import '../../../data/models/food_model.dart';


class FoodUpdate extends StatefulWidget {
  const FoodUpdate({super.key, required this.foodList});

  final List<FoodModel> foodList;
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

    return SingleChildScrollView(
      child: Container(
        color: Colors.purple[50],
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height *.6,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0,),
              const Text('Found a new place you like?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
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
                          FoodModel item = FoodModel(foodID: user.uid, ladyFoodPlace: _ladyFoodPlace, ladyFoodItem1: _ladyFoodItem1, ladyFoodItem2: _ladyFoodItem2);
                          await FoodRepositoryImpl().addFood(item);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add', style: TextStyle(color: Colors.white,))),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
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
              const SizedBox(height: 20.0,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Food Option 1:',
                ),
                validator: (value){
                  return value!.isEmpty ? 'Food cannot be empty!': null;
                },
                onChanged: (value){
                  _ladyFoodItem1 = value;
                },
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                decoration: const InputDecoration(
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
      ),
    );
  }
}
