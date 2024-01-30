class LadyModel{
  String? userID;
  String? ladyBirthDate;
  String? anniversaryDate;

  LadyModel({this.anniversaryDate, this.userID, this.ladyBirthDate});

  Map<String, dynamic> sendInfo() {
    return {
      'userID': userID,
      'ladyBirthDate': ladyBirthDate,
      'anniversaryDate': anniversaryDate,
    };
  }
}