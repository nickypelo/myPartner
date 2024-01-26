import 'package:girlfriend_translator/features/authentication/domain/entities/user_entity.dart';

class UserDetailsModel extends UserDetailsEntity{
  String? firstname;
  String? lastname;
  String? partnerEmail;

  UserDetailsModel(
    {
      this.firstname,
      this.lastname,
      this.partnerEmail
    }
  ) : super(
      firstname: firstname,
      lastname: lastname,
      partnerEmail: partnerEmail,
    );

  Map<String, dynamic> userDetailsMap(){
    return {
      'firstname': firstname,
      'lastname': lastname,
      'partnerEmail': partnerEmail
    };
  }
}