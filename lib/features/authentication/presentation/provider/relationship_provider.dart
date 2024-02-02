import 'package:MyPartner/features/authentication/data/models/relationship_model.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repository/relationship_repo_impl.dart';

Stream<List<RelationshipModel>> relationshipCollectionProvider(BuildContext context) {
  return RelationshipRepositoryImpl()
      .getRelationshipStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => RelationshipModel.fromDocument(doc)).toList());
}
