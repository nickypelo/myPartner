import 'package:MyPartner/features/information/data/models/personality_model.dart';
import 'package:MyPartner/features/information/data/repository/personality_repo_impl.dart';
import 'package:flutter/cupertino.dart';

Stream<List<PersonalityModel>> personalityCollectionProvider(BuildContext context) {
  return PersonalityRepositoryImpl()
      .getPersonalityStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => PersonalityModel.fromDocument(doc)).toList());
}
