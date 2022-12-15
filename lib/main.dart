import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/get_mode.dart';
import 'package:dr_magz/models/artikel_model.dart';
import 'package:dr_magz/models/user_model.dart';
import 'package:dr_magz/music.dart';
import 'package:dr_magz/pages.dart';
import 'package:dr_magz/pages/artikel_view.dart';
import 'package:dr_magz/pages/config.dart';
import 'package:dr_magz/pages/homescreen.dart';
import 'package:dr_magz/pages/intro.dart';
import 'package:dr_magz/pages/splash.dart';
import 'package:dr_magz/pages/tester.dart';
import 'package:dr_magz/preferences.dart';
import 'package:dr_magz/theme_data.dart';
import 'package:dr_magz/provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // String storageLocation = 'E:/fast';
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
  UserPreference userPref = new UserPreference();
  UserModel users = user;
  late bool isDarkMode;
  @override
  void initState() {
    super.initState();

    isDarkMode = brightness == Brightness.dark;
    WidgetsBinding.instance.addObserver(this);
    getCurrentAppTheme();
    getUser();
    print(users.userName);
    print(users.userPic);
  }

  void getUser() async {
    users = await userPref.getUser();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  bool latestMusic = false;
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    latestMusic = await MusicPreference().getMusic();

    switch (state) {
      case AppLifecycleState.resumed:
        if (latestMusic) {
          MusicPreference().setMusic(true);
          playMusic();
        }
        userPref.setUser(
          email: user.userName,
          name: user.userName,
          pass: user.userPass,
          userPic: user.userPic,
          urlType: user.urlType,
        );
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        if (latestMusic) {
          MusicPreference().setMusic(false);
          playMusic();
        }
        userPref.setUser(
          email: user.userName,
          name: user.userName,
          pass: user.userPass,
          userPic: user.userPic,
          urlType: user.urlType,
        );
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        if (latestMusic) {
          MusicPreference().setMusic(false);
          playMusic();
        }
        userPref.setUser(
          email: user.userName,
          name: user.userName,
          pass: user.userPass,
          userPic: user.userPic,
          urlType: user.urlType,
        );
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        userPref.setUser(
          email: user.userName,
          name: user.userName,
          pass: user.userPass,
          userPic: user.userPic,
          urlType: user.urlType,
        );
        print("app in detached");
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    userPref.setUser(
      email: user.userName,
      name: user.userName,
      pass: user.userPass,
      userPic: user.userPic,
      urlType: user.urlType,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          WidgetsBinding.instance.addPostFrameCallback((t) {
            Provider.of<DarkThemeProvider>(context, listen: false).darkTheme;
          });
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'DR. MAGZ',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            // home: SplashScreen(),
            // home: Homescreen(),
            // home: const Intro(),
            // home: Pages(),
            // home: Config()
            // home: const Test(),
            home: Splash(),
            // home: const Config(),
            // home: ArtikelView(
            // article: articles[0],
            // ),
          );
        },
      ),
    );
  }
}
