// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dr_magz/src/curved_navigation_bar.dart';
import 'package:dr_magz/theme_data.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils/item.dart';
import 'package:dr_magz/sidebar.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Pages extends StatefulWidget {
  const Pages({this.index = 0, Key? key}) : super(key: key);
  final int index;
  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  // _PagesState(this.i);

  late int _selectedIndex = widget.index;
  late PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    // you can use this.widget.foo here
    // _selectedIndex
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // drawer: Sidebar(),
      backgroundColor: Styles.themeData(darkTheme, context).backgroundColor,
      // appBar: AppBar(
      //   title: const Text('LOGO✨'),
      //   scrolledUnderElevation: 0,
      //   shadowColor: null,
      //   backgroundColor: topBarDarkColor,
      //   elevation: 0,
      // ),

      // bottomNavigationBar: CurvedNavigationBar(
      //   // key: _bottomNavigationKey,
      //   index: _selectedIndex,
      //   height: 60.0,
      //   items: <Widget>[
      //     Icon(Icons.local_library_outlined),
      //     Icon(Icons.home),
      //     Icon(Icons.favorite_border_outlined),
      //   ],
      //   color: Colors.red,
      //   buttonBackgroundColor: Colors.black.withOpacity(0.1),
      //   backgroundColor: Colors.black.withOpacity(0.1),
      //   animationCurve: Curves.easeInOut,
      //   animationDuration: Duration(milliseconds: 600),
      //   onTap: _onItemTapped,
      //   letIndexChange: (index) => true,

      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: bottomBarDarkColor,
      //   unselectedItemColor: Colors.white.withOpacity(0.5),
      //   elevation: 0,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       activeIcon: Icon(Icons.home_outlined),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.local_library_outlined),
      //       activeIcon: Icon(Icons.local_library_sharp),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border_outlined),
      //       activeIcon: Icon(Icons.favorite),
      //       label: '',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   // currentIndex: 0,
      //   selectedItemColor: Colors.white,
      //   onTap: _onItemTapped,
      // ),
      // itemList.elementAt(_selectedIndex),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: itemList.length,
            scrollDirection: Axis.horizontal,
            scrollBehavior: ScrollBehavior(),
            onPageChanged: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return itemList[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              begin: darkTheme ? purpleShade100 : purpleShade100,
              end: darkTheme ? purpleShade250 : blueShade100,
              index: _selectedIndex,
              height: 60.0,
              buttonBackgroundColor: purpleShade100.withOpacity(0.5),
              items: <Widget>[
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 0 ? homeSvg : homeOutlineSvg,
                    alignment: Alignment.center,
                    height: 20,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 1 ? feedSvg : feedOutlineSvg,
                    alignment: Alignment.center,
                    height: 20,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 2 ? favouriteSvg : favouriteOutlineSvg,
                    alignment: Alignment.center,
                    height: 20,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 3 ? personSvg : personOutlineSvg,
                    alignment: Alignment.center,
                    height: 20,
                  ),
                ),
              ],
              buttonBoxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  offset: Offset(0, 0),
                  blurStyle: BlurStyle.outer,
                )
              ],
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: _onItemTapped,
              letIndexChange: (index) => true,
            ),
          ),
        ],
      ),
    );
  }
}
