import 'package:girlfriend_translator/features/authentication/domain/entities/user_entity.dart';

class UserDetailsModel extends UserDetailsEntity{
  String? userID;
  String? firstname;
  String? lastname;
  String? partnerEmail;
  String? role;

  UserDetailsModel(
    {
      this.userID,
      this.firstname,
      this.lastname,
      this.partnerEmail,
      this.role
    }
  ) : super(
      userID: userID,
      firstname: firstname,
      lastname: lastname,
      partnerEmail: partnerEmail,
      role: role
    );

  Map<String, dynamic> userDetailsMap(){
    return {
      'userID': userID,
      'firstname': firstname,
      'lastname': lastname,
      'partnerEmail': partnerEmail,
      'role': role
    };
  }
}