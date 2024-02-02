import 'package:MyPartner/features/information/data/models/music_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MusicRepository{

  // CREATE: add new music
  Future<void> addMusic(MusicModel music);

  // READ: get music from database
  Stream<QuerySnapshot> getMusicStream();

  // UPDATE: update music
  Future<void> updateMusic(String uid, MusicModel music);

  // DELETE: remove an music
  Future<void> deleteMusic(String docID);

}