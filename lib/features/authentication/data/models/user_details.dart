import 'package:girlfriend_translator/features/authentication/domain/entities/user_entity.dart';

class UserDetailsModel extends UserDetailsEntity{
  String? userID;
  String? firstname;
  String? lastname;
  String? partnerEmail;
  String? role;
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

  Map<String, dynamic> userDetailsMap(){
    return {
      'userID': userID,
      'firstname': firstname,
      'lastname': lastname,
      'partnerEmail': partnerEmail,
      'role': role,
      'fcmToken' : fcmToken
    };
  }
}