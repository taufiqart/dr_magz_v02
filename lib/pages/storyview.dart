import 'dart:async';

import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:dr_magz/models/story_model.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryView extends StatefulWidget {
  final StoryData story;
  final Duration duration;

  StoryView({Key? key, required this.story, required this.duration})
      : super(key: key);
  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  double percent = 0.0;

  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        percent += 0.001;
        if (percent > 1) {
          _timer.cancel();
          // Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (widget.story.urlType == UrlType.asset)
                    ? AssetImage(widget.story.url)
                    : NetworkImage(widget.story.url) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: percent,
                  // value: 0.4,
                  color: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  widget.story.longTitle,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(0, 1),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
