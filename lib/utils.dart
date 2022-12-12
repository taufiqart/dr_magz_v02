import 'package:dr_magz/models/user_model.dart';
import 'package:dr_magz/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum UrlType { asset, network, file }

DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

@override
void initState() {
  getCurrentAppTheme();
}

void getCurrentAppTheme() async {
  themeChangeProvider.darkTheme =
      await themeChangeProvider.darkThemePreference.getTheme();
}

Color bgIntroColor = new Color.fromARGB(255, 3, 17, 137);
Color bgIntroDarkColor = new Color.fromARGB(255, 9, 13, 52);
Color buttonIntroColor = new Color.fromARGB(255, 67, 125, 167);
Color buttonIntroDarkColor = new Color.fromARGB(255, 0, 60, 104);
Color bottomBarDarkColor = new Color.fromARGB(255, 24, 34, 51);
Color topBarDarkColor = new Color.fromARGB(255, 32, 6, 99);
Color textColor = Colors.white;

String newArticleText = "New Articles";
String newMagazineText = "Today's magazine";
String favouriteArticleText = "Favourite";
String libraryText = "Library";
String textGetStarted = "Get Started";

String textWelcome = "Welcome to DR. MAGZ ";
String textWhatCall = "What do your friends call you?";
String textName = "Name";
String textEmail = "Email";
String textPassword = "Password";
String textWhatInterest = "What interests you most about DR. MAGZ?";
String textContinue = "Continue";
String textSkip = "Skip";

String helloUser() {
  return "Hello, ${user.userName}!";
}

// String helloUser = "Hello, ${user.userName}!";
String whatDidRead = "What did you read today?";
String textProfile = "Profile";
String textAccountSetting = "Account Settings";
String textShortVideo = "Short Video";

String textChoseYour = "Choose your favorite mainstay feature!";
String textLightMode = "Light Mode";
String textDarkMode = "Dark Mode";
String textInstrumental = "Instrumental";
String textSettings = "Settings";
String textProfileSettings = "Profile Settings";
String textFromGallery = "From Gallery";
String textTakePicture = "Take Picture";
String textSubmit = "Submit";
String textRemovePicture = "Remove Picture";
String textScrollUp = "Scroll Up to Full video";
String textProcessingData = "Processing Data";

Color purple = Color(0xff593575);
Color purpleShade800 = Color(0xff1D214E);
Color purpleShade450 = Color(0xff6F499C);
Color purpleShade400 = Color(0xff6D478B);
Color purpleShade200 = Color(0xff9872B6);
Color purpleShade100 = Color(0xffBAA7F8);
Color purpleShade250 = Color(0xffBB93DE);
Color purpleShade150 = Color(0xffBAA1F0);

Color blueShade100 = Color(0xff5672B9);
Color blueShade150 = Color(0xff6479C2);
Color blueShade400 = Color(0xff1E5885);

Color yellowShade100 = Color(0xffD8D9B9);
Color dark800 = Color(0xff101837);
Color dark600 = Color(0xff2E354F);
Color primaryColor = new Color.fromARGB(255, 80, 56, 142);
Color secondColor = new Color.fromARGB(255, 170, 24, 183);
Color thirdColor = new Color.fromARGB(255, 12, 179, 188);
Color fourColor = new Color.fromARGB(255, 7, 18, 36);
Color fiveColor = new Color.fromARGB(255, 9, 25, 51);
Color sixColor = new Color.fromARGB(255, 41, 26, 81);

// validator
String english = " must be required";
String nameValid = "Name$english";
String emailValid = "Email$english";
String passwordValid = "Password$english";

Color buttonConfig = themeChangeProvider.darkTheme ? dark800 : purple;

// icon path
String svgNightMode = "assets/icons/night_mode.svg";
String svgLightMode = "assets/icons/light_mode.svg";
String svgMusic = "assets/icons/music.svg";
String defaultUserPic = "assets/images/user_blank.png";

String homeSvg = "assets/icons/home.svg";
String homeOutlineSvg = "assets/icons/home_outline.svg";
String feedSvg = "assets/icons/feed.svg";
String feedOutlineSvg = "assets/icons/feed_outline.svg";
String favouriteSvg = "assets/icons/favourite.svg";
String favouriteOutlineSvg = "assets/icons/favourite_outline.svg";
String personSvg = "assets/icons/person.svg";
String personOutlineSvg = "assets/icons/person_outline.svg";

String bgBottom = "assets/images/bg_home_bottom.png";
String bgArtikel = "assets/images/bg_artikel.png";
String tNawasena = "assets/images/thumbnail_nawasena.png";

String defaultUserName = "user2022";
String defaultUserEmail = "user2022";
String defaultUserPass = "user2022";
