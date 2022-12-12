import 'dart:math';

import 'package:dr_magz/pages/config.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BG2 extends StatefulWidget {
  BG2(
      {this.child = const SizedBox.shrink(),
      this.darkTheme = false,
      super.key});
  final Widget child;
  final bool darkTheme;
  @override
  State<BG2> createState() => _BG2State();
}

class _BG2State extends State<BG2> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  widget.darkTheme
                      ? Positioned(
                          top: -100,
                          left: -90,
                          child: Container(
                            width: 200,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(500),
                              backgroundBlendMode: BlendMode.overlay,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 180, 103, 195)
                                      .withOpacity(0.8),
                                  offset: Offset(0, 0),
                                  blurRadius: 100,
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(color: Colors.transparent),
                  widget.darkTheme
                      ? Positioned(
                          top: MediaQuery.of(context).size.height * 0.2,
                          left: -70,
                          child: Container(
                            width: 600,
                            height: 800,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(500),
                              boxShadow: [
                                BoxShadow(
                                  color: blueShade400,
                                  offset: Offset(0, 0),
                                  blurRadius: 9000,
                                )
                              ],
                            ),
                          ),
                        )
                      : Positioned(
                          bottom: -70,
                          left: -70,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(500),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color(0xffC692D0),
                                  offset: Offset(0, 0),
                                  blurRadius: 100,
                                )
                              ],
                            ),
                          ),
                        ),
                  widget.darkTheme
                      ? Positioned(
                          bottom: 140,
                          right: -90,
                          child: Container(
                            width: 200,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(500),
                              backgroundBlendMode: BlendMode.overlay,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 180, 103, 195)
                                      .withOpacity(0.8),
                                  offset: Offset(0, 0),
                                  blurRadius: 100,
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(color: Colors.transparent),
                  widget.darkTheme
                      ? Positioned(
                          right: -50,
                          top: -50,
                          child: Container(
                            width: 250,
                            height: 450,
                            transform: Transform.rotate(angle: pi).transform,
                            transformAlignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: purpleShade800,
                                  offset: Offset(0, 0),
                                  blurRadius: 50,
                                )
                              ],
                            ),
                          ),
                        )
                      : Positioned(
                          right: -50,
                          top: -50,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color(0xff9C9EE1),
                                  offset: Offset(0, 0),
                                  blurRadius: 50,
                                )
                              ],
                            ),
                          ),
                        ),
                  widget.darkTheme
                      ? Positioned(
                          top: -60,
                          left: -80,
                          child: Container(
                            width: 300,
                            height: 500,
                            transform:
                                Transform.rotate(angle: pi / 0.5).transform,
                            transformAlignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(500),
                              boxShadow: [
                                BoxShadow(
                                  color: purpleShade800,
                                  offset: Offset(0, 0),
                                  blurRadius: 9000,
                                )
                              ],
                            ),
                          ),
                        )
                      : Positioned(
                          top: MediaQuery.of(context).size.height * 0.3,
                          left: 10,
                          child: Container(
                            width: 300,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(500),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color(0xffC4AEE2),
                                  offset: Offset(0, 0),
                                  blurRadius: 9000,
                                )
                              ],
                            ),
                          ),
                        ),
                ],
              ),
              // AnimatedPositioned(
              //   height: widget.darkTheme
              //       ? MediaQuery.of(context).size.height * 2
              //       : 0,
              //   width: widget.darkTheme
              //       ? MediaQuery.of(context).size.height * 2
              //       : 0,
              //   duration: const Duration(milliseconds: 500),
              //   child: Container(
              //     alignment: Alignment.center,
              //     transformAlignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: dark800,
              //       borderRadius: BorderRadius.circular(9000),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        widget.child,
      ],
    );
  }
}
