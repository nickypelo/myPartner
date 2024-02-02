import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/lady_model.dart';

abstract class LadyRepository{
  // CREATE: add new interest
  Future<void> addLady(LadyModel lady);

  // READ: get interest from database
  Stream<QuerySnapshot> getLadyStream();

}