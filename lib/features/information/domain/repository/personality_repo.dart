import 'package:MyPartner/features/information/data/models/personality_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PersonalityRepository{
  // CREATE: add new personality
  Future<void> addMusic(PersonalityModel personality);

  // READ: get personality from database
  Stream<QuerySnapshot> getPersonalityStream();

  // UPDATE: update personality
  Future<void> updatePersonality(String uid, PersonalityModel personality);

  // DELETE: remove personality
  Future<void> deletePersonality(String docID);
}