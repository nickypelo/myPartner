import 'package:MyPartner/features/information/data/models/food_model.dart';
import 'package:MyPartner/features/information/domain/repository/food_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodRepositoryImpl extends FoodRepository{

  // reference collection
  final CollectionReference foodCollection = FirebaseFirestore.instance.collection('food');

  @override
  Future<void> addFood(FoodModel delicacy) async {
    foodCollection.add(delicacy.toJson());
  }

  @override
  Future<void> deleteFood(String docID) {
    // TODO: implement deleteFood
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<Object?>> getFoodStream() {
    return foodCollection.snapshots();
  }

  @override
  Future<void> updateFood(String uid, FoodModel foodItem) async {
    foodCollection.doc(uid).update(foodItem.toJson());
  }
}