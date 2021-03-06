import 'package:flutter/material.dart';
import 'package:notes/create_note_page.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.orange),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF04D361)))),
          scaffoldBackgroundColor: Color(0xFF453973),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF8257E5)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xFF04D361))),
      title: "Notes",
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage(),
        "/splash": (context) => SplashPage(),
      },
    );
  }
}
