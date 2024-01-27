class FoodModel{
  String? foodID;
  String? ladyFoodPlace;
  String? ladyFoodItem1;
  String? ladyFoodItem2;

  FoodModel({this.foodID, this.ladyFoodItem1, this.ladyFoodItem2, this.ladyFoodPlace});

  Map<String, dynamic> sendFood() {
    return {
      'foodId': foodID,
      'ladyFoodPlace': ladyFoodPlace,
      'ladyFoodItem1': ladyFoodItem1,
      'ladyFoodItem2': ladyFoodItem2
    };
  }
}
