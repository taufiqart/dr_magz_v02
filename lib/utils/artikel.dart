import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/models/artikel_model.dart';
import 'package:dr_magz/pages/artikel_view.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArtikelButton extends StatefulWidget {
  const ArtikelButton({required this.article, this.width = 163, super.key});
  final ArtikelData article;
  final double? width;
  @override
  State<ArtikelButton> createState() => _ArtikelButtonState();
}

class _ArtikelButtonState extends State<ArtikelButton> {
  void liked() {
    widget.article.liked = !widget.article.liked;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50.0),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ArtikelView(article: widget.article),
                ),
              );
            },
            child: Container(
              width: widget.width,
              height: 180,
              // color: Colors.blue,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 140.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.white.withOpacity(0.2),
                            color: darkTheme
                                ? blueShade100.withOpacity(0.8)
                                : blueShade150.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                // offset: Offset(3, 2),
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.4),
                                blurStyle: BlurStyle.outer,
                              )
                            ]
                            // border: Border.all(color: Colors.white),
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: purpleShade200,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image:
                                      (widget.article.urlType == UrlType.asset)
                                          ? AssetImage(widget.article.image)
                                          : CachedNetworkImageProvider(
                                              widget.article.image,
                                            ) as ImageProvider,
                                  fit: BoxFit.cover),
                            ),
                            clipBehavior: Clip.antiAlias,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.article.title,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.article.datetime,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  InkWell(
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
                                      color: widget.article.liked
                                          ? likeColor
                                          : textColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
