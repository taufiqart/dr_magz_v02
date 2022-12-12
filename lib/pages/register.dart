import 'package:dr_magz/backgrounds/bg_1.dart';
import 'package:dr_magz/backgrounds/bg_2.dart';
import 'package:dr_magz/models/user_model.dart';
import 'package:dr_magz/pages/config.dart';
import 'package:dr_magz/preferences.dart';
import 'package:dr_magz/theme_data.dart';
import 'package:dr_magz/provider.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  var txtEmail = TextEditingController();
  var txtName = TextEditingController();
  var txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);

    final darkTheme = themeChange.darkTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.themeData(darkTheme, context).backgroundColor,
      body: BG2(
        darkTheme: darkTheme,
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            child: Text(
                              textWelcome,
                              style: GoogleFonts.poppins(
                                color: darkTheme
                                    ? textColor.withOpacity(0.9)
                                    : purple,
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Text(
                            textWhatCall,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: darkTheme
                                  ? textColor.withOpacity(0.9)
                                  : purpleShade400,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: _formKey,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.33,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    obscureText: true,
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
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          print(_formKey.currentState!.validate());
                          if (_formKey.currentState!.validate()) {
                            user.userName = txtName.text;
                            user.userEmail = txtEmail.text;
                            user.userPass = txtPass.text;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(milliseconds: 1500),
                                  content: Text(textProcessingData)),
                            );
                            Future.delayed(
                              Duration(seconds: 2),
                              () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Config(),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 45,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                darkTheme
                                    ? purpleShade150
                                    : Color.fromARGB(255, 186, 167, 248),
                                darkTheme
                                    ? purpleShade250
                                    : Color.fromARGB(255, 86, 114, 1185),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            textContinue,
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.9),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Config(),
                          ),
                        ),
                        child: Text(
                          textSkip,
                          style: GoogleFonts.poppins(
                            color:
                                darkTheme ? textColor.withOpacity(0.9) : purple,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
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
