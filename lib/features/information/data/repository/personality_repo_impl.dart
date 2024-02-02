import 'package:MyPartner/features/information/data/models/personality_model.dart';
import 'package:MyPartner/features/information/domain/repository/personality_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalityRepositoryImpl extends PersonalityRepository{

  // reference collection
  final CollectionReference personalityCollection = FirebaseFirestore.instance.collection('personality');

  @override
  Future<void> addMusic(PersonalityModel personality) async {
    personalityCollection.add(personality.toJson());
  }

  @override
  Future<void> deletePersonality(String docID) {
    // TODO: implement deletePersonality
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<Object?>> getPersonalityStream() {
    return personalityCollection.snapshots();
  }

  @override
  Future<void> updatePersonality(String uid, PersonalityModel personality) {
    // TODO: implement updatePersonality
    throw UnimplementedError();
  }

}