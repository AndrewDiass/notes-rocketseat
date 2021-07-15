import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    splashRedirect();
    super.initState();
  }

  Future splashRedirect() async {
    await Future.delayed(Duration(seconds: 4));
    await Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8257E5),
      body: Center(
        child: Icon(
          Icons.speaker_notes,
          size: 94,
        ),
      ),
    );
  }
}
