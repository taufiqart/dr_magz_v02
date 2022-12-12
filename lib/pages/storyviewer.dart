import 'dart:async';

import 'package:dr_magz/models/story_model.dart';
import 'package:dr_magz/pages/storyview.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StoryViewer extends StatefulWidget {
  const StoryViewer({super.key, this.initialPage = 0});
  final int initialPage;
  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late Timer _timer;
  late Duration duration = Duration(milliseconds: 3);
  double percent = 0;
  late int _currentIndex;
  late PageController _pageController;

  void startTimer() {
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        percent += 0.001;
        if (percent > 1) {
          _timer.cancel();
          // Navigator.pop(context);
          if (_currentIndex >= stories.length - 1) {
            Navigator.pop(context);
          } else {
            _pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
            percent = 0;
            startTimer();
          }
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    _pageController = PageController(initialPage: widget.initialPage);
    _currentIndex = widget.initialPage;
    super.initState();
  }

  void next() {
    setState(() {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  void prev() {
    setState(() {
      _pageController.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  double? _scale = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: bottomBarDarkColor,
      ),
      child: GestureDetector(
        onTapDown: (details) {
          var _position = (context.findRenderObject() as RenderBox)
              .globalToLocal(details.globalPosition);
          var left = _position.dx;
          if (_scale!.floor() == 0) {
            if (_position.dx <= 108) {
              prev();
            } else if (_position.dx >=
                MediaQuery.of(context).size.width - 108) {
              next();
            }
          }
        },
        child: PageView.builder(
          controller: _pageController,
          itemCount: stories.length,
          physics: _scale!.floor() != 0
              ? NeverScrollableScrollPhysics()
              : ScrollPhysics(),
          onPageChanged: (value) {
            _currentIndex = value;
            _timer.cancel();
            startTimer();
          },
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StoryView(
                duration: Duration(milliseconds: 3),
                story: stories[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
