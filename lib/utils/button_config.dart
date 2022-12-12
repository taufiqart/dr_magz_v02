import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ButtonConfig extends StatefulWidget {
  ButtonConfig(
      {required this.onTap,
      required this.icon,
      this.selected = false,
      this.darkTheme = false,
      this.text = const Text(""),
      super.key});
  final VoidCallback onTap;
  final Widget icon;
  final bool selected;
  final bool darkTheme;
  final Widget text;

  @override
  State<ButtonConfig> createState() => _ButtonConfigState();
}

class _ButtonConfigState extends State<ButtonConfig> {
  late double scale;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.onTap();
            });
          },
          child: Container(
            // alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: widget.darkTheme ? textColor : purpleShade200,
                width: 1.5,
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                widget.selected
                    ? Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            width: 50,
                            height: 15,
                            transformAlignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color:
                                  widget.darkTheme ? textColor : purpleShade200,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(5),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -3,
                            child: FaIcon(
                              FontAwesomeIcons.check,
                              color: widget.darkTheme ? purple : Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        200,
                      ),
                    ),
                    child: widget.icon,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: widget.text,
        )
      ],
    );
  }
}
