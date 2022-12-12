import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/models/user_model.dart';
import 'package:dr_magz/pages/profile_settings.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

enum MediaType { image, video }

class Profile extends StatefulWidget {
  Profile({super.key});
  bool isMount = true;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  int currentIndex = 0;
  late Timer _timer;
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();
  // late Matrix4 showHide = Matrix4.identity()..translate(0, 0);
  Matrix4 showHide = Matrix4.identity()..translate(0.0, 0.0);

  MediaType _mediaType = MediaType.image;
  String? imagePath;
  @override
  void initState() {
    setState(() {
      user.userPic;
    });
    CustomClipPath();
    super.initState();
    if (widget.isMount) {
      setState(() {
        // code omitted..
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // code omitted..
    super.dispose();
  }

  bool _visible = false;
  void openImage() {
    setState(() {
      _visible = !_visible;
    });
  }

  Widget _openImage(BuildContext context) {
    setState(() {});
    return GestureDetector(
      onTap: () {
        openImage();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
        ),
        child: InteractiveViewer(
          child: Center(
              child: Image(
            image: user.urlType == UrlType.asset
                ? AssetImage(user.userPic)
                : user.urlType == UrlType.network
                    ? NetworkImage(
                        user.userPic,
                      )
                    : FileImage(
                        File(user.userPic),
                      ) as ImageProvider,
          )),
        ),
      ),
    );
  }

  // Widget _showPic(BuildContext context) {
  //   return Center(
  //     child: Container(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: user.urlType == UrlType.asset
  //               ? AssetImage(user.userPic)
  //               : NetworkImage(user.userPic) as ImageProvider,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return SafeArea(
      child: BG2(
        darkTheme: darkTheme,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 300,
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage("assets/images/kota.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        textProfile,
                        style: GoogleFonts.poppins(
                          color: darkTheme ? textColor : purple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 150),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ClipPath(
                            clipper: CustomClipPath(),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              // height: double.infinity,
                              // constraints: BoxConstraints(
                              //     maxHeight:
                              //         MediaQuery.of(context).size.height * 0.7),
                              decoration: BoxDecoration(
                                color: Colors.green,
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: BG2(
                                      darkTheme: darkTheme,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 50),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 100,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      user.userName,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1,
                                                        color: darkTheme
                                                            ? textColor
                                                            : purpleShade400,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      user.userEmail,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        height: 1,
                                                        color: darkTheme
                                                            ? textColor
                                                            : purpleShade400,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProfileSettings(),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    textAccountSetting,
                                                    style: GoogleFonts.poppins(
                                                      color: darkTheme
                                                          ? textColor
                                                          : purpleShade800,
                                                      fontSize: 11,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -150,
                                    child: Container(
                                      width: 300,
                                      height: 300,
                                      alignment: Alignment.bottomCenter,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            200,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                blurRadius: 10,
                                                blurStyle: BlurStyle.outer)
                                          ]),
                                      child: ClipPath(
                                        clipBehavior: Clip.antiAlias,
                                        clipper: SegitigaClipPath(),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            top: 85,
                                          ),
                                          height: 130,
                                          width: 90,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                              )
                                            ],
                                          ),
                                          // child: Icon(
                                          //   Icons.note_alt_outlined,
                                          //   color: darkTheme
                                          //       ? Colors.white
                                          //       : purple,
                                          //   size: 25,
                                          // ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: InkWell(
                              onTap: () {
                                openImage();
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: darkTheme ? purple : Colors.white,
                                  borderRadius: BorderRadius.circular(200),
                                  image: DecorationImage(
                                    image: user.urlType == UrlType.asset
                                        ? AssetImage(user.userPic)
                                        : user.urlType == UrlType.network
                                            ? CachedNetworkImageProvider(
                                                user.userPic,
                                              )
                                            : FileImage(
                                                File(user.userPic),
                                              ) as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              _visible ? _openImage(context) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final Path path = Path();

    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 120);
    path.quadraticBezierTo(w * 0.5, 0, 0, 120);

    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SegitigaClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final Path path = Path();

    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w / 2, 0);
    path.lineTo(0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
