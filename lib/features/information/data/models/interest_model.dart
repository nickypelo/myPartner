import 'package:cloud_firestore/cloud_firestore.dart';

class InterestModel{
  String? interestID;
  String? documentID;
  String? ladyInterest;

  InterestModel({this.documentID, this.interestID, this.ladyInterest});

  factory InterestModel.fromDocument(DocumentSnapshot doc) {
    return InterestModel(
      documentID: doc.id,
      interestID: doc.get('interestID'),
      ladyInterest: doc.get('ladyInterest'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'interestID': interestID,
      'ladyInterest': ladyInterest,
    };
  }
}