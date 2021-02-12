import 'package:flutter/material.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/controllers/Login.dart';
import 'package:thesis_app/views/intro/index.dart';
import 'package:thesis_app/config/size_config.dart';

class IntroScreen extends StatelessWidget {
  static String routeName = "/intro";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: IntroBody(),
    );
  }
}

abstract class IntroController extends State<IntroBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to TheSiS, Let’s make your vehicle safer!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people to secure your vehicle \naround Riau Province",
      "image": "assets/images/splash_2.png"
    },
    {
      "text":
          "We show the easy way to tracking your vehicle. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  next() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
