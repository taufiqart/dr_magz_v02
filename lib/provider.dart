import 'package:dr_magz/get_mode.dart';
import 'package:dr_magz/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
  late bool _darkTheme = GetMode().get();

  // bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
