import 'dart:async';

import 'package:cached_video_player/cached_video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/models/feed_model.dart';
import 'package:dr_magz/music.dart';
import 'package:dr_magz/preferences.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class FeedView extends StatefulWidget {
  FeedView({required this.feedModel, super.key});
  FeedModel feedModel;
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  // bool startedPlaying = false;
  // late CachedVideoPlayerController controller;
  // _FeedViewState();

  late Future<Duration?> posisi;
  _close() {
    Navigator.pop(context);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   controller = CachedVideoPlayerController.asset(widget.feedModel.video);
  //   controller
  //     ..initialize().then((value) {
  //       controller.play();
  //       controller.videoPlayerOptions;
  //       controller.addListener(
  //         () {
  //           posisi = controller.position;
  //           if (controller.value.position == controller.value.duration) {
  //             _close();
  //             dispose();
  //           }
  //         },
  //       );
  //       setState(() {});
  //     });

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  double _aspectRatio = 16 / 9;

  late bool latestMusic = false;
  @override
  void initState() {
    super.initState();
    print(widget.feedModel.video);
    _videoPlayerController = widget.feedModel.urlTypeVideo == UrlType.asset
        ? VideoPlayerController.asset(widget.feedModel.video)
        : VideoPlayerController.network(widget.feedModel.video)
            as VideoPlayerController;
    _videoPlayerController.addListener(() async {
      if (_videoPlayerController.value.isPlaying) {
        if (await MusicPreference().getMusic()) {
          latestMusic = await MusicPreference().getMusic();
          MusicPreference().setMusic(false);
          playMusic();
        }
      } else {
        if (latestMusic) {
          Future.delayed(
            Duration(milliseconds: 1000),
            () {
              MusicPreference().setMusic(true);
              playMusic();
            },
          );
        }
      }
    });
    _chewieController = ChewieController(
        allowedScreenSleep: false,
        allowFullScreen: true,
        controlsSafeAreaMinimum: EdgeInsets.zero,
        zoomAndPan: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
        videoPlayerController: _videoPlayerController,
        aspectRatio: _aspectRatio,
        autoInitialize: true,
        autoPlay: true,
        showControls: true,
        maxScale: 2,
        materialProgressColors: ChewieProgressColors(
            backgroundColor: textColor,
            playedColor: purple.withOpacity(0.5),
            handleColor: purpleShade100.withOpacity(0.5),
            bufferedColor: purpleShade200.withOpacity(0.5)
            // bufferedColor:
            )
        // fullScreenByDefault: true,
        );

    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  void dispose() {
    // _videoPlayerController.release();
    // controller.dispose();
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    playMusic();
  }

  Future<void> launchUrlStart({required String url}) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  late bool href = false;
  late double y = 40;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: BG2(
            darkTheme: darkTheme,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.width * 0.6,
                          child: Chewie(
                            controller: _chewieController,
                          ),
                        ),
                      ),
                      widget.feedModel.link != null
                          ? AnimatedPositioned(
                              duration: Duration(milliseconds: 500),
                              bottom: y,
                              child: GestureDetector(
                                onVerticalDragUpdate: (details) {
                                  setState(() {
                                    if (details.localPosition.direction >
                                        -0.8) {
                                      y <= 80 ? y += 2 : y = y;
                                      href = true;
                                    }
                                    if (details.localPosition.direction > 0.4) {
                                      y = 40;
                                      href = false;
                                    }
                                  });
                                },
                                onVerticalDragEnd: (details) async {
                                  if (href) {
                                    if (await MusicPreference().getMusic()) {
                                      MusicPreference().setMusic(false);
                                      playMusic();
                                    }
                                    await launchUrlStart(
                                        url: widget.feedModel.link as String);
                                    setState(() {
                                      y = 40;
                                    });
                                  }
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 5,
                                          )
                                        ],
                                        color: darkTheme
                                            ? textColor.withOpacity(0.5)
                                            : purple,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_up_sharp,
                                        color: darkTheme
                                            ? purple
                                            : textColor.withOpacity(0.7),
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      textScrollUp,
                                      style: GoogleFonts.poppins(
                                        color: darkTheme ? textColor : purple,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      // transform: showHide,
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
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
                                    textShortVideo,
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
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Material(
  //     child: Scaffold(
  //       body: Center(
  //         child: controller.value.isInitialized
  //             ? AspectRatio(
  //                 aspectRatio: controller.value.aspectRatio,
  //                 child: CachedVideoPlayer(controller),
  //               )
  //             : const CircularProgressIndicator(),
  //       ),
  //     ),
  //   );
  // }
  // Widget build(BuildContext context) {
  //   return Material(
  //     child: Center(
  //       child: FijkView(player: _videoPlayerController),
  //     ),
  //   );
  // }
}
