
import 'package:MyPartner/features/information/data/repository/food_repo_impl.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/food_model.dart';

Stream<List<FoodModel>> foodCollectionProvider(BuildContext context) {
  return FoodRepositoryImpl()
      .getFoodStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => FoodModel.fromDocument(doc)).toList());
}
