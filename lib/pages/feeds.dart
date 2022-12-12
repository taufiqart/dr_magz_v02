import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/models/feed_model.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:dr_magz/utils/artikel.dart';
import 'package:dr_magz/utils/feeds_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final ScrollController _scrollController = ScrollController();
  Matrix4 showHide = Matrix4.identity()..translate(0.0, 0.0);

  _scrollListener() {
    setState(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showHide = Matrix4.identity()..translate(0.0, 0.0);
      } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          _scrollController.offset >= 60) {
        showHide = Matrix4.identity()..translate(0.0, -60.0);
      }
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: topBarDarkColor,
        ),
        child: Container(
          child: Stack(
            children: [
              BG2(
                darkTheme: darkTheme,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    padding: EdgeInsets.only(top: 80),
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 80,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bgBottom),
                          alignment: Alignment.bottomCenter,
                          opacity: 0.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...feedModel.map(
                            (e) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ButtonFeed(
                                  feedModel: e,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  transform: showHide,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    color: darkTheme
                        ? Colors.white.withOpacity(0.3)
                        : purpleShade100.withOpacity(0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textShortVideo,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
