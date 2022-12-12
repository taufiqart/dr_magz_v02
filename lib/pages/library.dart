import 'package:dr_magz/models/artikel_model.dart';
import 'package:dr_magz/models/majalah_model.dart';
import 'package:dr_magz/utils.dart';
import 'package:dr_magz/utils/artikel.dart';
import 'package:dr_magz/utils/majalah.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  int last = 0;
  List<ArtikelData> likedArtikel = [];

  void getLiked() {
    for (int i = 0; i < articles.length; i++) {
      if (articles[i].liked) {
        likedArtikel.add(articles[i]);
      }
    }
  }

  @override
  void initState() {
    getLiked();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: topBarDarkColor,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 80),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [topBarDarkColor, bottomBarDarkColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  libraryText,
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 16,
                    wordSpacing: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...majalahs.map((e) => Majalah(e, context)).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
