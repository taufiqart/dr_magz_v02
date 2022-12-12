import 'package:dr_magz/pages/config.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BG1 extends StatefulWidget {
  const BG1({required this.child, this.darkTheme = false, super.key});
  final Widget child;
  final bool darkTheme;
  @override
  State<BG1> createState() => _BG1State();
}

class _BG1State extends State<BG1> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
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
                  Positioned(
                    right: -50,
                    top: -50,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff9C9EE1),
                            offset: Offset(0, 0),
                            blurRadius: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3,
                    left: 10,
                    child: Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(500),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffC4AEE2),
                            offset: Offset(0, 0),
                            blurRadius: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -70,
                    left: -70,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(500),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffC692D0),
                            offset: Offset(0, 0),
                            blurRadius: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedPositioned(
                height: widget.darkTheme
                    ? MediaQuery.of(context).size.height * 2
                    : 0,
                width: widget.darkTheme
                    ? MediaQuery.of(context).size.height * 2
                    : 0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  alignment: Alignment.center,
                  transformAlignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: dark800,
                    borderRadius: BorderRadius.circular(9000),
                  ),
                ),
              ),
              widget.child,
            ],
          ),
        ),
      ],
    );
  }
}
