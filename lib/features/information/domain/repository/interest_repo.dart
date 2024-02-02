import 'package:MyPartner/features/information/data/models/interest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class InterestRepository{
  // CREATE: add new interest
  Future<void> addInterest(InterestModel interest);

  // READ: get interest from database
  Stream<QuerySnapshot> getInterestStream();

  // UPDATE: update interest
  Future<void> updateInterest(String uid, InterestModel interest);

  // DELETE: remove an interest
  Future<void> deleteInterest(String docID);
}