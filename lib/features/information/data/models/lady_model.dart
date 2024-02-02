import 'package:cloud_firestore/cloud_firestore.dart';

class LadyModel{
  String? userID;
  String? ladyBirthDate;
  String? anniversaryDate;

  LadyModel({this.anniversaryDate, this.userID, this.ladyBirthDate});

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'ladyBirthDate': ladyBirthDate,
      'anniversaryDate': anniversaryDate,
    };
  }

  factory LadyModel.fromDocument(DocumentSnapshot doc) {
    return LadyModel(
      userID: doc.get('userID'),
      ladyBirthDate: doc.get('ladyBirthDate'),
      anniversaryDate: doc.get('anniversaryDate'),
    );
  }

}