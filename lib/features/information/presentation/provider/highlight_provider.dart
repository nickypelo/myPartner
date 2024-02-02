import 'package:MyPartner/features/information/data/models/highlight_model.dart';
import 'package:MyPartner/features/information/data/repository/highlight_repo_impl.dart';
import 'package:flutter/cupertino.dart';

Stream<List<HighlightModel>> highlightCollectionProvider(BuildContext context) {
  return HighlightRepositoryImpl()
      .getHighlightStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => HighlightModel.fromDocument(doc)).toList());
}
