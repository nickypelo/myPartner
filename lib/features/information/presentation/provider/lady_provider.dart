import 'package:MyPartner/features/information/data/models/lady_model.dart';
import 'package:MyPartner/features/information/data/repository/lady_repo_impl.dart';
import 'package:flutter/cupertino.dart';

Stream<List<LadyModel>> ladyCollectionProvider(BuildContext context) {
  return LadyRepositoryImpl()
      .getLadyStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => LadyModel.fromDocument(doc)).toList());
}
