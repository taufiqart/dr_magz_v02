import 'package:dr_magz/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatefulWidget {
  Sidebar({Key? key}) : super(key: key);
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [topBarDarkColor, bottomBarDarkColor])),
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 20),
              // Spacer(),
              ListTile(
                title: Text(
                  'Tema',
                  style: GoogleFonts.poppins(
                    color: textColor,
                  ),
                ),
                onTap: () {
                  print("tema");
                },
              ),
              ListTile(
                title: Text(
                  'Tentang Kami',
                  style: GoogleFonts.poppins(
                    color: textColor,
                  ),
                ),
                onTap: () {
                  print("tentang kami");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
