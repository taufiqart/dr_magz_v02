import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/pages/storyview.dart';
import 'package:dr_magz/pages/storyviewer.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dr_magz/models/story_model.dart';
import 'package:google_fonts/google_fonts.dart';

Widget StoryButton(
    StoryData story, BuildContext context, bool darkTheme, int initialPage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              // builder: (context) => StoryView(story: story),
              builder: (context) => StoryViewer(
                initialPage: initialPage,
              ),
            ),
          );
        },
        child: Container(
          width: 80.0,
          child: Column(
            children: [
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: blueShade100, width: 3),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: (story.urlType == UrlType.asset)
                          ? AssetImage(story.url)
                          : CachedNetworkImageProvider(story.url)
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // clipBehavior: Clip.antiAlias,
                  // child: (story.urlType == UrlType.asset)
                  //     ? Image.asset(
                  //         story.url,
                  //         fit: BoxFit.cover,
                  //       )
                  //     : CachedNetworkImage(
                  //         imageUrl: story.url,
                  //         fit: BoxFit.cover,
                  //       ),
                ),
              ),
              Text(
                story.title,
                style: GoogleFonts.poppins(
                  color: darkTheme ? textColor : purple,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  textStyle: TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
