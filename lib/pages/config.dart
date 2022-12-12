import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dr_magz/backgrounds/bg_1.dart';
import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/music.dart';
import 'package:dr_magz/pages.dart';
import 'package:dr_magz/preferences.dart';
import 'package:dr_magz/theme_data.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:dr_magz/utils/button_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  late bool _selected;
  @override
  void initState() {
    // TODO: implement initState
    // _selected = await MusicPreference().getMusic();
    _selected = false;
    super.initState();
    _getSelect;
  }

  _getSelect() async {
    _selected = await MusicPreference().getMusic();
  }

  double r1 = 1;
  double r2 = 1;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return Scaffold(
      body: BG2(
        darkTheme: darkTheme,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  child: Text(
                    textWhatInterest,
                    style: GoogleFonts.poppins(
                      color: darkTheme ? Colors.white : purple,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonConfig(
                      onTap: () {
                        setState(() {
                          r1 = 0;
                          // _selected = !_selected;
                          Future.delayed(Duration(milliseconds: 500), (() {
                            r1 = 1;
                            setState(() {});
                          }));
                          themeChange.darkTheme = !themeChange.darkTheme;
                        });
                      },
                      icon: AnimatedRotation(
                        duration: Duration(seconds: 2),
                        turns: r1,
                        child: SvgPicture.asset(
                          darkTheme ? svgLightMode : svgNightMode,
                          width: 30,
                          height: 30,
                          color: darkTheme ? textColor : purpleShade200,
                        ),
                      ),
                      selected: darkTheme,
                      darkTheme: darkTheme,
                    ),
                    ButtonConfig(
                      onTap: () {
                        setState(() {
                          _selected = !_selected;
                          MusicPreference().setMusic(_selected);
                          playMusic();
                          r2 = 0;
                          // _selected = !_selected;
                          Future.delayed(Duration(milliseconds: 500), (() {
                            r2 = 1;
                            setState(() {});
                          }));
                        });
                      },
                      icon: AnimatedRotation(
                        duration: Duration(seconds: 2),
                        turns: r2,
                        child: SvgPicture.asset(
                          svgMusic,
                          width: 25,
                          height: 25,
                          color: darkTheme ? textColor : purpleShade200,
                        ),
                      ),
                      selected: _selected,
                      darkTheme: darkTheme,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      FirstPreference().setFirst(true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pages(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 45,
                      margin: EdgeInsets.only(bottom: 60),
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            darkTheme
                                ? purpleShade150
                                : Color.fromARGB(255, 186, 167, 248),
                            darkTheme
                                ? purpleShade250
                                : Color.fromARGB(255, 86, 114, 1185),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        textContinue,
                        style: GoogleFonts.poppins(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
