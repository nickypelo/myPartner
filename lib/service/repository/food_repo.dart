import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girlfriend_translator/model/food_model.dart';

class FoodRepo{

  final String? uid;
  FoodRepo({required this.uid});

  // reference collection
  final CollectionReference foodCollection = FirebaseFirestore.instance.collection('food');

  // create
  Future createFoodData(String ladyFoodPlace, String ladyFoodItem1, String ladyFoodItem2) async{
    return await foodCollection.add({
      'foodId': uid,
      'ladyFoodPlace': ladyFoodPlace,
      'ladyFoodItem1': ladyFoodItem1,
      'ladyFoodItem2': ladyFoodItem2
    });
  }

  // update
  Future updateFoodData(String ladyFoodPlace, String ladyFoodItem1, String ladyFoodItem2 ) async{
    return await foodCollection.doc(uid).set({
      'foodId': uid,
      'ladyFoodPlace': ladyFoodPlace,
      'ladyFoodItem1': ladyFoodItem1,
      'ladyFoodItem2': ladyFoodItem2
    });
  }

  // create food list from snapshot
  List<FoodModel> _foodList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<FoodModel>((doc) => FoodModel(
      foodID: doc.get('foodId') ?? '',
      ladyFoodPlace: doc.get('ladyFoodPlace') ?? '',
      ladyFoodItem1: doc.get('ladyFoodItem1') ?? '',
      ladyFoodItem2: doc.get('ladyFoodItem2') ?? '',
    )).toList();
  }

  // get Food stream
  Stream<List<FoodModel>>? get food{
    return foodCollection.snapshots().map(_foodList);
  }

}