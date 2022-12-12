import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/models/artikel_model.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:dr_magz/utils/artikel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});
  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  _FavouriteState();
  int last = 0;
  List<ArtikelData> likedArtikel = [];
  final ScrollController _scrollController = ScrollController();
  Matrix4 showHide = Matrix4.identity()..translate(0.0, 0.0);

  void getLiked() {
    for (int i = 0; i < articles.length; i++) {
      if (articles[i].liked) {
        likedArtikel.add(articles[i]);
      }
    }
  }

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
    getLiked();
    _scrollController.addListener(_scrollListener);

    super.initState();
    setState(() {});
    // for (int i = 0; i < (articles.length / 2).ceil(); i++) {
    //   listArtikel.add(Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       Text(i.toString()),
    //       ArtikelButton(articles[i + last], context),
    //       ArtikelButton(articles[i + last + 1], context),
    //     ],
    //   ));
    //   last = i + 1;
    // }
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
                  child: Container(
                    padding: EdgeInsets.only(top: 80),
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                (likedArtikel.length / 2).ceil(),
                                (index) {
                                  last = index + 1;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          index + last < likedArtikel.length
                                              ? MainAxisAlignment.spaceEvenly
                                              : MainAxisAlignment.start,
                                      children: [
                                        ArtikelButton(
                                          article:
                                              likedArtikel[index + (last - 1)],
                                          width: 155,
                                        ),
                                        index + last < likedArtikel.length
                                            ? ArtikelButton(
                                                article:
                                                    likedArtikel[index + last],
                                                width: 155,
                                              )
                                            : SizedBox.shrink()
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        : purpleShade100.withOpacity(0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          favouriteArticleText,
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
