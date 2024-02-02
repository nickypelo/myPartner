import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalityModel{
  String? personalityID;
  String? ladyPersonalityDescription;

  PersonalityModel({this.personalityID, this.ladyPersonalityDescription});

  factory PersonalityModel.fromDocument(DocumentSnapshot doc) {
    return PersonalityModel(
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