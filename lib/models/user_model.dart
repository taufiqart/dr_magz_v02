import 'package:dr_magz/utils.dart';

class UserModel {
  late String userName;
  late String userEmail;
  late String userPic;
  late String userPass;
  late UrlType urlType;
  UserModel(
      {required this.userName,
      required this.userEmail,
      required this.userPic,
      required this.urlType,
      required this.userPass});
}

UserModel user = UserModel(
  userName: defaultUserName,
  userEmail: defaultUserEmail,
  userPass: defaultUserPass,
  userPic: defaultUserPic,
  urlType: UrlType.asset,
);
// UserModel user = UserModel(
//   userName: "Mukhammad Taufiqurrochman",
//   userEmail: "taufiqqurrohman333@gmail.com",
//   userPass: "taufiqqurrohman333@gmail.com",
//   userPic: defaultUserPic,
//   urlType: UrlType.asset,
// );
