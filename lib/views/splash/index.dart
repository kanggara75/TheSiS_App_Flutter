import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thesis_app/controllers/Intro.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacementNamed(context, IntroScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 95, 103),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/location.json'),
          ],
        ),
      ),
    );
  }
}
