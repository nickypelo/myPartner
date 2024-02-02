import 'package:MyPartner/features/information/data/models/interest_model.dart';
import 'package:MyPartner/features/information/data/repository/interest_repo_impl.dart';
import 'package:flutter/cupertino.dart';


Stream<List<InterestModel>> interestCollectionProvider(BuildContext context) {
  return InterestRepositoryImpl()
      .getInterestStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => InterestModel.fromDocument(doc)).toList());
}
