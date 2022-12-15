import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/models/artikel_model.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArtikelView extends StatefulWidget {
  final ArtikelData article;
  const ArtikelView({Key? key, required this.article}) : super(key: key);
  @override
  State<ArtikelView> createState() => _ArtikelViewState();
}

class _ArtikelViewState extends State<ArtikelView> {
  // ControllerCallback _controller;
  final ScrollController _scrollController = ScrollController();
  // late Matrix4 showHide = Matrix4.identity()..translate(0, 0);
  Matrix4 showHide = Matrix4.identity()..translate(0.0, 0.0);
  void liked() {
    widget.article.liked = !widget.article.liked;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // showHide = Matrix4.identity()..translate(0.0, 0.0);
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

  bool _visible = false;
  void openImage() {
    setState(() {
      _visible = !_visible;
    });
  }

  Widget _openImage(BuildContext context) {
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
              image: widget.article.urlType == UrlType.asset
                  ? AssetImage(widget.article.image)
                  : CachedNetworkImageProvider(widget.article.image)
                      as ImageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white.withOpacity(0.2),
        //   // foregroundColor: Colors.transparent,
        // ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [purpleShade800, purpleShade800, blueShade400],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                image: !darkTheme
                    ? DecorationImage(
                        image: AssetImage(bgArtikel),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [topBarDarkColor, bottomBarDarkColor],
                //     tileMode: TileMode.clamp,
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                // ),
                // ),
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            openImage();
                          },
                          child: Container(
                              width: double.infinity,
                              height: 220,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: bottomBarDarkColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image(
                                image: widget.article.urlType == UrlType.asset
                                    ? AssetImage(widget.article.image)
                                    : CachedNetworkImageProvider(
                                        widget.article.image) as ImageProvider,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.article.title,
                        style: GoogleFonts.poppins(
                          color: darkTheme ? textColor : purpleShade800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          widget.article.datetime,
                          style: GoogleFonts.poppins(
                            color: darkTheme ? textColor : purpleShade800,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        widget.article.article,
                        style: GoogleFonts.poppins(
                          color: darkTheme ? textColor : purpleShade800,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      // SizedBox(
                      //   height: 30,
                      // )
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
                transform: showHide,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                      Text(
                        newArticleText,
                        style: GoogleFonts.poppins(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              liked();
                            });
                          },
                          child: Icon(
                            widget.article.liked
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            size: 20,
                            color: widget.article.liked ? likeColor : textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _visible ? _openImage(context) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
