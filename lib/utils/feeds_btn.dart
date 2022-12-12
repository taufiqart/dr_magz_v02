import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/models/feed_model.dart';
import 'package:dr_magz/pages/feed_view.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonFeed extends StatefulWidget {
  ButtonFeed({required this.feedModel, super.key});
  FeedModel feedModel;
  @override
  State<ButtonFeed> createState() => _ButtonFeedState();
}

class _ButtonFeedState extends State<ButtonFeed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: topBarDarkColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedView(
                              feedModel: widget.feedModel,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: bottomBarDarkColor.withOpacity(0.6),
                          image: DecorationImage(
                            image:
                                widget.feedModel.urlTypeThumb == UrlType.asset
                                    ? AssetImage(
                                        widget.feedModel.thumbnail,
                                      )
                                    : CachedNetworkImageProvider(
                                            widget.feedModel.thumbnail)
                                        as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 220 - 160,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Text(
                              widget.feedModel.title,
                              style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 20,
                  bottom: 30,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedView(
                            feedModel: widget.feedModel,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: textColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: textColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
