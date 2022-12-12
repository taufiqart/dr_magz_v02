import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/models/majalah_model.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

class MajalahView extends StatefulWidget {
  final MajalahData majalah;
  MajalahView({Key? key, required this.majalah}) : super(key: key);
  @override
  State<MajalahView> createState() => _MajalahViewState();
}

class _MajalahViewState extends State<MajalahView> {
  @override
  bool visible = true;
  late Timer _timer;
  hidden() async {
    var duration = const Duration(seconds: 2);
    if (visible) {
      return _timer = Timer(duration, () {
        setState(() {
          visible = false;
          _timer.cancel();
        });
      });
    }
    return;
  }

  void initState() {
    super.initState();
    hidden();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void next() {
    setState(() {
      _controller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  void prev() {
    setState(() {
      _controller.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  void showHide() {
    setState(() {
      if (!visible) {
        visible = true;
        hidden();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  PageController _controller = new PageController();

  int _index = 0;
  double? _scale = 0;
  bool _zoom = false;
  Widget build(BuildContext context) {
    List item = widget.majalah.majalah;
    return Scaffold(
      backgroundColor: bottomBarDarkColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            GestureDetector(
              onTapDown: (details) {
                var _position = (context.findRenderObject() as RenderBox)
                    .globalToLocal(details.globalPosition);
                var left = _position.dx;
                if (_scale!.floor() == 0) {
                  if (_position.dy <= 70) {
                    showHide();
                  } else if (_position.dy >=
                      MediaQuery.of(context).size.height - 70) {
                    showHide();
                  } else if (_position.dx <= 90) {
                    prev();
                  } else if (_position.dx >=
                      MediaQuery.of(context).size.width - 90) {
                    next();
                  } else {
                    showHide();
                  }
                }
              },
              // onTap: () {
              //   setState(() {
              //     visible = true;
              //     hidden();
              //   });
              // },
              child: PageView.builder(
                controller: _controller,
                itemCount: item.length,
                physics: _scale!.floor() != 0
                    ? NeverScrollableScrollPhysics()
                    : ScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _index = value;
                  });
                },
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: PhotoView(
                      onScaleEnd: (context, details, controllerValue) {
                        _scale = controllerValue.scale;
                      },
                      imageProvider: item[index].urlType == UrlType.asset
                          ? AssetImage(item[index].image)
                          : CachedNetworkImageProvider(item[index].image)
                              as ImageProvider,
                    ),
                  );
                }),
              ),
            ),
            visible
                ? GestureDetector(
                    onTapDown: (details) {
                      var _position = (context.findRenderObject() as RenderBox)
                          .globalToLocal(details.globalPosition);
                      var left = _position.dx;
                      // setState(() {
                      //   visible = true;

                      //   hidden();
                      // });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                // alignment: Alignment.bottomLeft,
                                onPressed: (() {
                                  Navigator.pop(context);
                                }),
                                icon: Icon(
                                  Icons.close,
                                ),
                                color: Colors.white.withOpacity(1),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _timer.cancel();
                                  hidden();
                                  _index != 0 ? prev() : null;
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                ),
                                color: _index != 0
                                    ? textColor.withOpacity(1)
                                    : textColor.withOpacity(0.5),
                              ),
                              Text(
                                "${_index + 1}/${item.length}",
                                style: GoogleFonts.poppins(color: textColor),
                              ),
                              IconButton(
                                onPressed: () {
                                  _timer.cancel();
                                  hidden();

                                  _index + 1 != item.length ? next() : null;
                                },
                                icon: Icon(Icons.arrow_forward_ios),
                                color: _index + 1 != item.length
                                    ? textColor.withOpacity(1)
                                    : textColor.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
