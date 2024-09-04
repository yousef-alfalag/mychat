class UserModel {
  late String userId;
  late String userName;
  late String userImage;
  UserModel(
      {required this.userId, required this.userName, required this.userImage});

  UserModel.fromjson(Map<String, dynamic> json) {
    userId = json["userId"];
    userName = json["userName"];
    userImage = json["userImage"];
  }

  Map<String, dynamic> toMap() {
    return {"userId": userId, "userName": userName, "userImage": userImage};
  }
}
