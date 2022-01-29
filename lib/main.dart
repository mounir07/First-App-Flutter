import 'package:club_house/constantes.dart';
import 'package:club_house/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'clubhouse',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: kappbarcolor),
          scaffoldBackgroundColor: kscaff_color,
          primaryColor: Colors.white,
          accentColor: Color(0xff27AE61),
          iconTheme: IconThemeData(color: Colors.black),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        home: homescreen());
  }
}
