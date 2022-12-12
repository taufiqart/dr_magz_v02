import 'dart:async';

import 'package:dr_magz/pages.dart';
import 'package:dr_magz/pages/intro.dart';
import 'package:dr_magz/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rive/rive.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late RiveAnimationController _controller;
  Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
  late bool isDarkMode;
  late bool isFirst = false;

  @override
  void initState() {
    isDarkMode = brightness == Brightness.dark;
    super.initState();
    _controller = SimpleAnimation('start');
    _controller.isActive;
    _controller;
    Future.delayed(Duration(milliseconds: 1000), () async {
      isFirst = await FirstPreference().getFirst();
      _controller.dispose();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // builder: (_) => Pages(),
          builder: (_) => isFirst ? Pages() : Intro(),
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
            onInit: (_) => setState(() {}),
          ),
        ),
      ),
    );
  }
}
