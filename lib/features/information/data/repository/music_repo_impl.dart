import 'package:MyPartner/features/information/data/models/music_model.dart';
import 'package:MyPartner/features/information/domain/repository/music_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MusicRepositoryImpl extends MusicRepository{

  // reference collection
  final CollectionReference musicCollection = FirebaseFirestore.instance.collection('music');

  @override
  Future<void> addMusic(MusicModel music) async {
    musicCollection.add(music.toJson());
  }

  @override
  Future<void> deleteMusic(String docID) {
    // TODO: implement deleteMusic
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<Object?>> getMusicStream() {
    return musicCollection.snapshots();
  }

  @override
  Future<void> updateMusic(String uid, MusicModel music) {
    // TODO: implement updateMusic
    throw UnimplementedError();
  }

}