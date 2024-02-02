import 'package:cloud_firestore/cloud_firestore.dart';

class InterestModel{
  String? interestID;
  String? ladyInterest;

  InterestModel({this.interestID, this.ladyInterest});

  factory InterestModel.fromDocument(DocumentSnapshot doc) {
    return InterestModel(
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