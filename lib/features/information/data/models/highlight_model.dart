import 'package:cloud_firestore/cloud_firestore.dart';

class HighlightModel{
  String? highlightID;
  String? documentID;
  String? ladyHighlight;

  HighlightModel({this.documentID, this.highlightID, this.ladyHighlight});


  factory HighlightModel.fromDocument(DocumentSnapshot doc) {
    return HighlightModel(
      documentID: doc.id,
      highlightID: doc.get('highlightID'),
      ladyHighlight: doc.get('ladyHighlight'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'highlightID': highlightID,
      'ladyHighlight': ladyHighlight,
    };
  }
}