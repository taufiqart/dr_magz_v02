import 'package:dr_magz/pages/profile.dart';
import 'package:dr_magz/pages/favourite.dart';
import 'package:dr_magz/pages/feeds.dart';
import 'package:dr_magz/pages/homescreen.dart';
import 'package:dr_magz/pages/library.dart';
import 'package:flutter/cupertino.dart';

List<Widget> itemList = <Widget>[
  // Center(child: Text("Home")),
  Homescreen(),
  Feeds(),
  Favourite(),
  Profile(),
];
