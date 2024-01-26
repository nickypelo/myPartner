
import 'package:girlfriend_translator/features/information/domain/entities/food_entity.dart';

abstract class FoodRepository{

  Future<void> createFoodData(FoodEntity delicacy);
  Future<List<FoodEntity>> getFoodList();

}