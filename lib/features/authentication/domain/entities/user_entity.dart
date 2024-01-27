class UserDetailsEntity{
  final String? userID;
  final String? firstname;
  final String? lastname;
  final String? partnerEmail;
  final String? role;

  UserDetailsEntity(
      {
        this.userID,
        this.firstname,
        this.lastname,
        this.partnerEmail,
        this.role
      }
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