import 'package:MyPartner/features/authentication/data/models/relationship_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


abstract class RelationshipRepository{
  // CREATE: add new relationship
  Future<void> addRelationship(RelationshipModel relationship);

  // READ: get relationship from database
  Stream<QuerySnapshot> getRelationshipStream();

}