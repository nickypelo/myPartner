import 'package:MyPartner/features/information/domain/entities/food_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel extends FoodEntity{
  @override
  String? foodID;
  @override
  String? ladyFoodType;
  @override
  String? ladyFoodItem1;
  @override
  String? ladyFoodItem2;
  String? documentID;

  FoodModel({this.documentID, this.foodID, this.ladyFoodItem1, this.ladyFoodItem2, this.ladyFoodType});

  FoodModel copyWith({
    String? foodID,
    String? ladyFoodType,
    String? ladyFoodItem1,
    String? ladyFoodItem2,
  }) {
    return FoodModel(
      foodID: foodID ?? this.foodID,
      ladyFoodType: ladyFoodType ?? this.ladyFoodType,
      ladyFoodItem1: ladyFoodItem1 ?? this.ladyFoodItem1,
      ladyFoodItem2: ladyFoodItem2 ?? this.ladyFoodItem2
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodId': foodID,
      'ladyFoodType': ladyFoodType,
      'ladyFoodItem1': ladyFoodItem1,
      'ladyFoodItem2': ladyFoodItem2
    };
  }

  factory FoodModel.fromDocument(DocumentSnapshot doc) {
    return FoodModel(
      documentID: doc.id,
      foodID: doc.get('foodId'),
      ladyFoodType: doc.get('ladyFoodType'),
      ladyFoodItem1: doc.get('ladyFoodItem1'),
      ladyFoodItem2: doc.get('ladyFoodItem2'),
    );
  }

}
