import 'package:cloud_firestore/cloud_firestore.dart';

class MusicModel{
  String? musicID;
  String? musicWho;
  String? musicArtist;
  String? musicSongName;

  MusicModel({this.musicArtist, this.musicID, this.musicSongName, this.musicWho});

  factory MusicModel.fromDocument(DocumentSnapshot doc) {
    return MusicModel(
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