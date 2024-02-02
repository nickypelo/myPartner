import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/food_model.dart';

abstract class FoodRepository{

  // CREATE: add new food item
  Future<void> addFood(FoodModel delicacy);

  // READ: get food items from database
  Stream<QuerySnapshot> getFoodStream();

  // UPDATE: update food item
  Future<void> updateFood(String uid, FoodModel foodItem);

  // DELETE: remove a food item
  Future<void> deleteFood(String docID);

}