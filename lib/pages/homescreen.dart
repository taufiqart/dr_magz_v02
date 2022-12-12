import 'dart:async';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/models/artikel_model.dart';
import 'package:dr_magz/models/carousel_model.dart';
import 'package:dr_magz/models/majalah_model.dart';
import 'package:dr_magz/models/story_model.dart';
import 'package:dr_magz/models/user_model.dart';
import 'package:dr_magz/pages.dart';
import 'package:dr_magz/pages/settings.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:dr_magz/utils/artikel.dart';
import 'package:dr_magz/utils/majalah.dart';
import 'package:dr_magz/utils/storybtn.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);
  bool isMount = true;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  int currentIndex = 0;
  late Timer _timer;
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();
  // late Matrix4 showHide = Matrix4.identity()..translate(0, 0);
  Matrix4 showHide = Matrix4.identity()..translate(0.0, 0.0);
  // String storageLocation = (await getApplicationDocumentsDirectory()).path;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    if (widget.isMount) {
      setState(() {
        // code omitted..
      });
    }
    _timer = Timer.periodic(
      Duration(milliseconds: 2500),
      (timer) {
        if (currentIndex < homeCarousel.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }

        _pageController.animateToPage(currentIndex,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      },
    );
  }

  _scrollListener() {
    setState(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showHide = Matrix4.identity()..translate(0.0, 0.0);
      } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          _scrollController.offset >= 60) {
        showHide = Matrix4.identity()..translate(0.0, -60.0);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.isMount = false;
    // code omitted..
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: topBarDarkColor,
        ),
        child: Stack(
          children: [
            BG2(
              darkTheme: darkTheme,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  padding: EdgeInsets.only(bottom: 80),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage(bgBottom),
                        opacity: 0.4,
                        fit: BoxFit.fitWidth),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                          color:
                              Color.fromARGB(255, 73, 84, 113).withOpacity(0.6),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              // alignment: Alignment.center,
                              color: Colors.transparent,
                              child: PageView.builder(
                                itemCount: homeCarousel.length,
                                scrollDirection: Axis.horizontal,
                                controller: _pageController,
                                pageSnapping: true,
                                onPageChanged: (int index) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                itemBuilder: (_, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 300,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            image: DecorationImage(
                                              image: (homeCarousel[index]
                                                          .urlType ==
                                                      UrlType.asset)
                                                  ? AssetImage(
                                                      homeCarousel[index].url)
                                                  : CachedNetworkImageProvider(
                                                          homeCarousel[index]
                                                              .url)
                                                      as ImageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                      // clipBehavior: Clip.antiAlias,
                                      //   child: (homeCarousel[index].urlType ==
                                      //           UrlType.asset)
                                      //       ? Image.asset(
                                      //           homeCarousel[index].url,
                                      //           fit: BoxFit.cover,
                                      //         )
                                      //       : CachedNetworkImageProvider(
                                      //           url: homeCarousel[index].url,
                                      //           fit: BoxFit.cover,
                                      //         ),
                                      // ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              alignment: Alignment.center,
                              height: 10,
                              child: ListView.builder(
                                  itemCount: homeCarousel.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 3.0,
                                          ),
                                          width: 8.0,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: currentIndex == index
                                                ? Colors.white
                                                : Colors.white.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          // vertical: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              helloUser(),
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: darkTheme ? textColor : purple,
                                  height: 1),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              whatDidRead,
                              style: GoogleFonts.poppins(
                                color: darkTheme ? textColor : purpleShade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        padding: EdgeInsets.zero,
                        child: ListView.builder(
                          itemCount: stories.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 10 : 0,
                                right: index == stories.length - 1 ? 10 : 0,
                              ),
                              child: StoryButton(
                                  stories[index], context, darkTheme, index),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          newArticleText,
                          style: GoogleFonts.poppins(
                            color: darkTheme ? textColor : purple,
                            fontSize: 16,
                            wordSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            // color: Colors.red,
                            ),
                        child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 10 : 0,
                                right: index == articles.length - 1 ? 10 : 0,
                              ),
                              child: ArtikelButton(article: articles[index]),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          newMagazineText,
                          style: GoogleFonts.poppins(
                            color: darkTheme ? textColor : purple,
                            fontSize: 16,
                            wordSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...majalahs
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Majalah(e, context),
                              ))
                          .toList(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                transform: showHide,
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  color: darkTheme
                      ? textColor.withOpacity(0.3)
                      : purpleShade100.withOpacity(0.9),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (() {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Pages(
                                      index: 3,
                                    ),
                                  ),
                                );
                                setState(() {});
                              });
                            }),
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width * 0.6,
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            decoration: BoxDecoration(),
                            clipBehavior: Clip.antiAlias,
                            child: Text(
                              user.userName,
                              style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Settings(),
                            ),
                          );
                        }),
                        child: Icon(
                          Icons.settings,
                          size: 25,
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// child: Column(
//   children: [
//     Padding(
//       padding: EdgeInsets.all(5),
//     ),
//     CarouselSlider(
//       items: imgList
//           .map(
//             (item) => Container(
//               child: Center(
//                 child: Image.network(
//                   item,
//                   fit: BoxFit.cover,
//                   width: 300,
//                 ),
//               ),
//             ),
//           )
//           .toList(),
//       options: CarouselOptions(
//         autoPlay: false,
//         aspectRatio: 3.0,
//         enlargeCenterPage: true,
//       ),
//     ),
//     SizedBox(
//       height: 5,
//     ),
//     // CarouselWithDotsPage(imgList: imgList),
//   ],
// ),
