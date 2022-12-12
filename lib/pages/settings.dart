import 'package:audioplayers/audioplayers.dart';
import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/music.dart';
import 'package:dr_magz/preferences.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:dr_magz/utils/button_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AudioPlayer player = AudioPlayer();
  MusicPreference musicPreference = MusicPreference();

  // Future<void> playMusic() async {
  //   // player.play(AssetSource("audios/backsound.mpeg"));
  //   if (!await musicPreference.getMusic()) {
  //     await player.setSourceAsset("audios/backsound.mp3");
  //     await player.resume();
  //     player.setReleaseMode(ReleaseMode.loop);
  //     musicPreference.setMusic(true);
  //   } else {
  //     player.release();
  //   }
  //   // await player.setSourceAsset("assets/audios/backsound.mpeg");
  // }
  double r1 = 1;
  double r2 = 1;
  bool _selected = false;
  @override
  void initState() {
    super.initState();
    _getSelect();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _getSelect;
  }

  _getSelect() async {
    _selected = await MusicPreference().getMusic();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return Scaffold(
      body: BG2(
        darkTheme: darkTheme,
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6,
                      ),
                      child: Text(
                        textChoseYour,
                        style: GoogleFonts.poppins(
                          color: darkTheme ? Colors.white : purple,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
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
                          text: Text(
                            darkTheme ? textDarkMode : textLightMode,
                            style: GoogleFonts.poppins(
                              color: darkTheme ? textColor : purple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              // playMusic();

                              r2 = 0;
                              // _selected = !_selected;
                              Future.delayed(Duration(milliseconds: 500), (() {
                                r2 = 1;
                                setState(() {});
                              }));
                            });
                          },
                          text: Text(
                            textInstrumental,
                            style: GoogleFonts.poppins(
                              color: darkTheme ? textColor : purple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                  ],
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  // transform: showHide,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    // color: Colors.white.withOpacity(0.5),
                    color: darkTheme
                        ? Colors.white.withOpacity(0.3)
                        : blueShade100.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                textSettings,
                                style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
