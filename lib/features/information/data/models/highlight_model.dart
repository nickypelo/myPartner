import 'package:cloud_firestore/cloud_firestore.dart';

class HighlightModel{
  String? highlightID;
  String? ladyHighlight;

  HighlightModel({this.highlightID, this.ladyHighlight});


  factory HighlightModel.fromDocument(DocumentSnapshot doc) {
    return HighlightModel(
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