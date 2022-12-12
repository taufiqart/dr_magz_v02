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
