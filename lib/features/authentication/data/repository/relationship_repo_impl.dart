
import 'package:MyPartner/features/authentication/data/models/relationship_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repository/relationship_repo.dart';

class RelationshipRepositoryImpl extends RelationshipRepository{

  // reference user collection
  final CollectionReference relationshipCollection = FirebaseFirestore.instance.collection('relationship');

  @override
  Future<void> addRelationship(RelationshipModel relationship) async {
    await relationshipCollection.add(relationship.toJson());
  }

  @override
  Stream<QuerySnapshot<Object?>> getRelationshipStream() {
    return relationshipCollection.snapshots();
  }

}