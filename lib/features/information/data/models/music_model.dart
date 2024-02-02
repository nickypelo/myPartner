import 'package:cloud_firestore/cloud_firestore.dart';

class MusicModel{
  String? musicID;
  String? documentID;
  String? musicWho;
  String? musicArtist;
  String? musicSongName;

  MusicModel({this.documentID, this.musicArtist, this.musicID, this.musicSongName, this.musicWho});

  factory MusicModel.fromDocument(DocumentSnapshot doc) {
    return MusicModel(
      documentID: doc.id,
      musicID: doc.get('musicID'),
      musicWho: doc.get('musicWho'),
      musicArtist: doc.get('musicArtist'),
      musicSongName: doc.get('musicSongName'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'musicID': musicID,
      'musicWho': musicWho,
      'musicArtist': musicArtist,
      'musicSongName': musicSongName,
    };
  }
}