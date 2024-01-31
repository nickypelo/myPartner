import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/food_entity.dart';
import '../../domain/repository/food_repo.dart';
import '../models/food_model.dart';


class FoodRepo extends FoodRepository{

  final String? uid;
  FoodRepo({required this.uid});

  // reference collection
  final CollectionReference foodCollection = FirebaseFirestore.instance.collection('food');

  // create
  @override
  Future createFoodData(FoodEntity delicacy) async{
    return await foodCollection.add(delicacy.sendFood());
  }

  // update
  Future updateFoodData(FoodEntity delicacy) async{
    return await foodCollection.doc(delicacy.foodID).set(delicacy.sendFood());
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

  @override
  Future<List<FoodEntity>> getFoodList() {
    // TODO: implement getFoodList
    throw UnimplementedError();
  }

}