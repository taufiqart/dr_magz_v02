import 'dart:async';

import 'package:dr_magz/pages.dart';
import 'package:dr_magz/utils/draggable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rive/rive.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  GlobalKey _parentKey = GlobalKey();
  GlobalKey _popupKey = GlobalKey();

  late AnimationController _animation;
  late RiveAnimationController _controller;
  Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
  late bool isDarkMode;
  late Timer _timer;
  @override
  void initState() {
    isDarkMode = brightness == Brightness.dark;
    super.initState();
    _controller = SimpleAnimation('start');
    _animation =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat();
    _controller.isActive;
    _controller;
    Future.delayed(Duration(milliseconds: 1000), () {
      _controller.dispose();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Pages(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height,
          child: RiveAnimation.asset(
            'assets/animations/splash.riv',
            controllers: [_controller],
            // Update the play state when the widget's initialized
            onInit: (_) => setState(() {}),
          ),
        ),
      ),
    );
  }
}


// PopupMenuButton(
//                     // add icon, by default "3 dot" icon
//                     // color: Colors.transparent,
//                     elevation: 0,
//                     // offset: Offset(, 0),
//                     key: _popupKey,
//                     position: PopupMenuPosition.under,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     // icon: Icon(Icons.book),
//                     itemBuilder: (context) {
//                       return [
//                         PopupMenuItem<int>(
//                           value: 0,
//                           child: Text("My Account"),
//                         ),
//                         PopupMenuItem<int>(
//                           value: 1,
//                           child: Text("Settings"),
//                         ),
//                         PopupMenuItem<int>(
//                           value: 2,
//                           child: Text("Logout"),
//                         ),
//                       ];
//                     },
//                     enabled: true,
//                     onSelected: (value) {
//                       if (value == 0) {
//                         print("My account menu is selected.");
//                       } else if (value == 1) {
//                         print("Settings menu is selected.");
//                       } else if (value == 2) {
//                         print("Logout menu is selected.");
//                       }
//                     },
//                     child: AnimatedBuilder(
//                       animation: _animation,
//                       builder: ((context, child) {}),
//                       child: Text("halo"),
//                     ),
//                   ),