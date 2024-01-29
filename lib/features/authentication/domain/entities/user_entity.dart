class UserDetailsEntity{
  final String? userID;
  final String? firstname;
  final String? lastname;
  final String? partnerEmail;
  final String? role;
  final String? fcmToken;


  UserDetailsEntity(
      {
        this.userID,
        this.firstname,
        this.lastname,
        this.partnerEmail,
        this.role,
        this.fcmToken
      }
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