import 'package:dr_magz/models/user_model.dart';
import 'package:dr_magz/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class MusicPreference {
  static const MUSIC_STATUS = "MUSICSTATUS";

  setMusic(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(MUSIC_STATUS, value);
  }

  Future<bool> getMusic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(MUSIC_STATUS) ?? false;
  }
}

class FirstPreference {
  static const FIRST_STATUS = "FIRST";

  setFirst(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(FIRST_STATUS, value);
  }

  Future<bool> getFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(FIRST_STATUS) ?? false;
  }
}

class UserPreference {
  static const NAME = "NAME";
  static const EMAIL = "EMAIL";
  static const PASS = "PASS";
  static const USER_PIC = "USER_PIC";
  static const URL_TYPE = "URL_TYPE";
  late String urlTypes;
  setUser({name, email, pass, userPic, urlType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (urlType == UrlType.asset) {
      urlType = "UrlType.asset";
    } else if (urlType == UrlType.network) {
      urlType = "UrlType.network";
    } else if (urlType == UrlType.file) {
      urlType = "UrlType.file";
    } else {
      urlType = "UrlType.asset";
    }
    prefs.setString(NAME, name ?? user.userName);
    prefs.setString(EMAIL, email ?? user.userEmail);
    prefs.setString(PASS, pass ?? user.userPass);
    prefs.setString(USER_PIC, userPic ?? user.userPic);
    prefs.setString(URL_TYPE, urlTypes);
  }

  Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late UrlType urlType;
    if (prefs.getString(USER_PIC) == "UrlType.asset") {
      urlType = UrlType.asset;
    } else if (prefs.getString(USER_PIC) == "UrlType.network") {
      urlType = UrlType.network;
    } else if (prefs.getString(USER_PIC) == "UrlType.file") {
      urlType = UrlType.file;
    } else {
      urlType = UrlType.asset;
    }
    user = UserModel(
      userName: prefs.getString(NAME) ?? defaultUserName,
      userEmail: prefs.getString(EMAIL) ?? defaultUserEmail,
      userPic: prefs.getString(URL_TYPE) ?? defaultUserPic,
      urlType: urlType,
      userPass: prefs.getString(PASS) ?? defaultUserPass,
    );

    return user;
  }
}

class LikedPreference {
  static const NAME = "NAME";
  static const EMAIL = "EMAIL";
  static const PASS = "PASS";
  static const USER_PIC = "USER_PIC";
  static const URL_TYPE = "URL_TYPE";
  late String urlTypes;
  setUser({name, email, pass, userPic, urlType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (urlType == UrlType.asset) {
      urlType = "UrlType.asset";
    } else if (urlType == UrlType.network) {
      urlType = "UrlType.network";
    } else if (urlType == UrlType.file) {
      urlType = "UrlType.file";
    } else {
      urlType = "UrlType.asset";
    }
    prefs.setString(NAME, name ?? user.userName);
    prefs.setString(EMAIL, email ?? user.userEmail);
    prefs.setString(PASS, pass ?? user.userPass);
    prefs.setString(USER_PIC, userPic ?? user.userPic);
    prefs.setString(URL_TYPE, urlTypes);
  }

  Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late UrlType urlType;
    if (prefs.getString(USER_PIC) == "UrlType.asset") {
      urlType = UrlType.asset;
    } else if (prefs.getString(USER_PIC) == "UrlType.network") {
      urlType = UrlType.network;
    } else if (prefs.getString(USER_PIC) == "UrlType.file") {
      urlType = UrlType.file;
    } else {
      urlType = UrlType.asset;
    }
    user = UserModel(
      userName: prefs.getString(NAME) ?? defaultUserName,
      userEmail: prefs.getString(EMAIL) ?? defaultUserEmail,
      userPic: prefs.getString(URL_TYPE) ?? defaultUserPic,
      urlType: urlType,
      userPass: prefs.getString(PASS) ?? defaultUserPass,
    );

    return user;
  }
}
