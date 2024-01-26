class FoodEntity{
  String? foodID;
  String? ladyFoodPlace;
  String? ladyFoodItem1;
  String? ladyFoodItem2;

  FoodEntity({this.foodID, this.ladyFoodItem1, this.ladyFoodItem2, this.ladyFoodPlace});

  Map<String, dynamic> sendFood() {
    return {
      'foodId': foodID,
      'ladyFoodPlace': ladyFoodPlace,
      'ladyFoodItem1': ladyFoodItem1,
      'ladyFoodItem2': ladyFoodItem2
    };
  }
}