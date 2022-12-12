import 'dart:io';

import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/models/user_model.dart';
import 'package:dr_magz/pages.dart';
import 'package:dr_magz/theme_data.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

enum MediaType { image, video }

class _ProfileSettingsState extends State<ProfileSettings> {
  final _formKey = GlobalKey<FormState>();
  var txtEmail = TextEditingController();
  var txtName = TextEditingController();
  var txtPass = TextEditingController();
  var hidePass = true;
  @override
  void initState() {
    txtName.text = user.userName;
    txtEmail.text = user.userEmail;
    txtPass.text = user.userPass;
  }

  final MediaType _mediaType = MediaType.image;
  String? imagePath;
  void pickMedia(ImageSource source) async {
    XFile? file;
    if (_mediaType == MediaType.image) {
      file = await ImagePicker().pickImage(source: source);
    } else {
      file = await ImagePicker().pickVideo(source: source);
    }
    if (file != null) {
      imagePath = file.path;
      if (_mediaType == MediaType.video) {
        imagePath = await VideoThumbnail.thumbnailFile(
            video: file.path,
            imageFormat: ImageFormat.PNG,
            quality: 100,
            maxWidth: 300,
            maxHeight: 300);
      }
      setState(() {});
    }
    setState(() {
      user.userPic = imagePath as String;
    });
  }

  Widget openImage(BuildContext context, bool darkTheme) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            blueShade100,
            blueShade400,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
        ),
        color: darkTheme ? purple : Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            ListTile(
              onTap: (() {
                print("from gallery");
                pickMedia(ImageSource.gallery);
                user.urlType = UrlType.file;
                Navigator.pop(context);
              }),
              title: Text(
                textFromGallery,
                style: GoogleFonts.poppins(
                  color: darkTheme ? textColor : purple,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              minLeadingWidth: 5,
              leading: Icon(
                Icons.image_outlined,
                color: darkTheme ? textColor : purple,
              ),
            ),
            Divider(
              height: 5,
              color: darkTheme ? textColor : purple,
            ),
            ListTile(
              onTap: () {
                print("Take picture");
                pickMedia(ImageSource.camera);
                user.userPic = defaultUserPic;
                Navigator.pop(context);
                user.urlType = UrlType.file;
              },
              title: Text(
                textTakePicture,
                style: GoogleFonts.poppins(
                  color: darkTheme ? textColor : purple,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              minLeadingWidth: 5,
              leading: Icon(
                Icons.camera_alt,
                color: darkTheme ? textColor : purple,
              ),
            ),
            Divider(
              height: 5,
              color: darkTheme ? textColor : purple,
            ),
            ListTile(
              onTap: () {
                print("Remove Picture");
                imagePath = null;
                Navigator.pop(context);
                user.userPic = defaultUserPic;
                user.urlType = UrlType.asset;
              },
              title: Text(
                textRemovePicture,
                style: GoogleFonts.poppins(
                  color: darkTheme ? textColor : purple,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              minLeadingWidth: 5,
              leading: Icon(
                Icons.delete,
                color: darkTheme ? textColor : purple,
              ),
            ),
            Divider(
              height: 5,
              color: darkTheme ? textColor : purple,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
    final darkTheme = themeChange.darkTheme;

    return Scaffold(
      backgroundColor: Styles.themeData(darkTheme, context).backgroundColor,
      body: SafeArea(
        child: BG2(
          darkTheme: darkTheme,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.7,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: InkWell(
                          radius: 200,
                          borderRadius: BorderRadius.circular(200),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return openImage(context, darkTheme);
                              },
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: darkTheme ? purple : Colors.white,
                              borderRadius: BorderRadius.circular(200),
                              image: DecorationImage(
                                image: user.urlType == UrlType.asset
                                    ? AssetImage(user.userPic)
                                    : user.urlType == UrlType.network
                                        ? NetworkImage(
                                            user.userPic,
                                          )
                                        : FileImage(
                                            File(user.userPic),
                                          ) as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: textColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.33,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFormField(
                                  controller: txtName,
                                  cursorColor: purpleShade100,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    labelText: textName,
                                    labelStyle: GoogleFonts.poppins(
                                      color: darkTheme
                                          ? textColor.withOpacity(0.9)
                                          : purpleShade400,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return nameValid;
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: txtEmail,
                                  cursorColor: purpleShade100,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    labelText: textEmail,
                                    labelStyle: GoogleFonts.poppins(
                                      color: darkTheme
                                          ? textColor.withOpacity(0.9)
                                          : purpleShade400,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return emailValid;
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: txtPass,
                                  cursorColor: purpleShade100,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          hidePass = !hidePass;
                                        });
                                      },
                                      child: Icon(
                                        hidePass
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 20,
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: darkTheme
                                            ? textColor.withOpacity(0.9)
                                            : purpleShade200,
                                        width: 2,
                                      ),
                                    ),
                                    labelText: textPassword,
                                    labelStyle: GoogleFonts.poppins(
                                      color: darkTheme
                                          ? textColor.withOpacity(0.9)
                                          : purpleShade400,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return passwordValid;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            user.userName = txtName.text;
                            user.userEmail = txtEmail.text;
                            user.userPass = txtPass.text;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(milliseconds: 1500),
                                  content: Text('Processing Data')),
                            );
                            Future.delayed(
                              Duration(seconds: 2),
                              () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Pages(index: 3);
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            gradient: LinearGradient(
                              colors: [
                                darkTheme ? blueShade100 : purpleShade150,
                                darkTheme ? blueShade400 : purpleShade250
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            textSubmit,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  // transform: showHide,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    // color: Colors.white.withOpacity(0.5),
                    color: darkTheme
                        ? Colors.white.withOpacity(0.3)
                        : blueShade100.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                textProfileSettings,
                                style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
