import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class GetMode {
  bool get() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }
}
