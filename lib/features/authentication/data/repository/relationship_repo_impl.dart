import 'package:cloud_firestore/cloud_firestore.dart';


import '../../domain/entities/relationship_entity.dart';
import '../../domain/repository/relationship_repo.dart';
import '../models/relationship_model.dart';

class RelationshipRepoImpl extends RelationshipRepository{

  // reference user collection
  final CollectionReference relationshipCollection = FirebaseFirestore.instance.collection('relationship');

  @override
  Future<void> addRelationship(RelationshipEntity couple) async {
    // TODO: implement addRelationship
    await relationshipCollection.add(couple.relationshipMap());
    throw UnimplementedError();
  }

  // create couples list from snapshot
  List<RelationshipModel> _relationshipList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<RelationshipModel>((doc) => RelationshipModel(
      boyfriend: doc.get('boyfriend') ?? '',
      girlfriend: doc.get('girlfriend') ?? '',
    )).toList();
  }

  // get interest stream
  Stream<List<RelationshipModel>> get couples{
    return relationshipCollection.snapshots().map(_relationshipList);
  }
}