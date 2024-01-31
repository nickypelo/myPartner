import '../entities/food_entity.dart';

abstract class FoodRepository{

  Future<void> createFoodData(FoodEntity delicacy);
  Future<List<FoodEntity>> getFoodList();

}