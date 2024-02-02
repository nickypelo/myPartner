import 'package:MyPartner/features/information/data/models/music_model.dart';
import 'package:MyPartner/features/information/data/repository/music_repo_impl.dart';
import 'package:flutter/cupertino.dart';

Stream<List<MusicModel>> musicCollectionProvider(BuildContext context) {
  return MusicRepositoryImpl()
      .getMusicStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => MusicModel.fromDocument(doc)).toList());
}
