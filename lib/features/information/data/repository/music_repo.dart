import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girlfriend_translator/features/information/data/models/music_model.dart';

class MusicRepo{

  final String? uid;
  MusicRepo({required this.uid});

  // reference collection
  final CollectionReference musicCollection = FirebaseFirestore.instance.collection('music');

  // create
  Future createInterestData(String musicWho, String musicArtist, String musicSongName) async{
    return await musicCollection.add({
      'musicID': uid,
      'musicWho': musicWho,
      'musicArtist': musicArtist,
      'musicSongName': musicSongName
    });
  }

  // update
  Future updateMusicData(String musicID, String musicWho, String musicArtist, String musicSongName ) async{
    return await musicCollection.doc(uid).set({
      'musicID': musicID,
      'musicWho': musicWho,
      'musicArtist': musicArtist,
      'musicSongName': musicSongName
    });
  }

  // create music list from snapshot
  List<MusicModel> _musicList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<MusicModel>((doc) => MusicModel(
        musicID: doc.get('musicID') ?? '',
        musicWho: doc.get('musicWho') ?? '',
        musicArtist: doc.get('musicArtist') ?? '',
        musicSongName: doc.get('musicSongName') ?? '',
    )).toList();
  }

  // get music stream
  Stream<List<MusicModel>> get music{
    return musicCollection.snapshots().map(_musicList);
  }

}