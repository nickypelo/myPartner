
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user_entity.dart';

class UserDetailsModel extends UserDetailsEntity{
  @override
  String? userID;
  @override
  String? firstname;
  @override
  String? lastname;
  @override
  String? partnerEmail;
  @override
  String? role;
  @override
  String? fcmToken;

  UserDetailsModel(
    {
      this.userID,
      this.firstname,
      this.lastname,
      this.partnerEmail,
      this.role,
      this.fcmToken

    }
  ) : super(
      userID: userID,
      firstname: firstname,
      lastname: lastname,
      partnerEmail: partnerEmail,
      role: role,
      fcmToken: fcmToken
    );

  Map<String, dynamic> toJson(){
    return {
      'userID': userID,
      'firstname': firstname,
      'lastname': lastname,
      'partnerEmail': partnerEmail,
      'role': role,
      'fcmToken' : fcmToken
    };
  }

  factory UserDetailsModel.fromDocument(DocumentSnapshot doc) {
    return UserDetailsModel(
      userID: doc.get('userID'),
      firstname: doc.get('firstname'),
      lastname: doc.get('lastname'),
      partnerEmail: doc.get('partnerEmail'),
      role: doc.get('role'),
      fcmToken: doc.get('fcmToken'),
    );
  }

}