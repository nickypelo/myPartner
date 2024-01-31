
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

  @override
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