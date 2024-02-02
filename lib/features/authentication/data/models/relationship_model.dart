
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/relationship_entity.dart';

class RelationshipModel extends RelationshipEntity{
  RelationshipModel({
    required boyfriend,
    required girlfriend
  }) : super(
    boyfriend: boyfriend,
    girlfriend: girlfriend,
  );

  Map<String, dynamic> toJson(){
    return {
      'boyfriend': boyfriend,
      'girlfriend': girlfriend,
    };
  }

  factory RelationshipModel.fromDocument(DocumentSnapshot doc) {
    return RelationshipModel(
      boyfriend: doc.get('boyfriend'),
      girlfriend: doc.get('girlfriend'),
    );
  }
}