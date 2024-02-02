import 'package:MyPartner/features/information/data/models/highlight_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HighlightRepository{
  // CREATE: add new highlight
  Future<void> addHighlight(HighlightModel highlight);

  // READ: get food items from database
  Stream<QuerySnapshot> getHighlightStream();

  // UPDATE: update food item
  Future<void> updateHighlight(String uid, HighlightModel highlight);

  // DELETE: remove a food item
  Future<void> deleteHighlight(String docID);

}