import 'package:MyPartner/features/information/domain/entities/food_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel extends FoodEntity{
  @override
  String? foodID;
  @override
  String? ladyFoodPlace;
  @override
  String? ladyFoodItem1;
  @override
  String? ladyFoodItem2;
  String? documentID;

  FoodModel({this.documentID, this.foodID, this.ladyFoodItem1, this.ladyFoodItem2, this.ladyFoodPlace});

  FoodModel copyWith({
    String? foodID,
    String? ladyFoodPlace,
    String? ladyFoodItem1,
    String? ladyFoodItem2,
  }) {
    return FoodModel(
      foodID: foodID ?? this.foodID,
      ladyFoodPlace: ladyFoodPlace ?? this.ladyFoodPlace,
      ladyFoodItem1: ladyFoodItem1 ?? this.ladyFoodItem1,
      ladyFoodItem2: ladyFoodItem2 ?? this.ladyFoodItem2
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodId': foodID,
      'ladyFoodPlace': ladyFoodPlace,
      'ladyFoodItem1': ladyFoodItem1,
      'ladyFoodItem2': ladyFoodItem2
    };
  }

  factory FoodModel.fromDocument(DocumentSnapshot doc) {
    return FoodModel(
      documentID: doc.id,
      foodID: doc.get('foodId'),
      ladyFoodPlace: doc.get('ladyFoodPlace'),
      ladyFoodItem1: doc.get('ladyFoodItem1'),
      ladyFoodItem2: doc.get('ladyFoodItem2'),
    );
  }

}
