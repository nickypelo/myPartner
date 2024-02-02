import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalityModel{
  String? personalityID;
  String? documentID;
  String? ladyPersonalityDescription;

  PersonalityModel({this.documentID,this.personalityID, this.ladyPersonalityDescription});

  factory PersonalityModel.fromDocument(DocumentSnapshot doc) {
    return PersonalityModel(
      documentID: doc.id,
      personalityID: doc.get('personalityID'),
      ladyPersonalityDescription: doc.get('ladyPersonalityDescription'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personalityID': personalityID,
      'ladyPersonalityDescription': ladyPersonalityDescription,
    };
  }
}