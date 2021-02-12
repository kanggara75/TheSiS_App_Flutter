import 'package:flutter/material.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/help/index.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = "/helpscreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help Center",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: HelpBody(),
    );
  }
}

abstract class HelpController extends State<HelpBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Home Page",
      "image": "assets/images/help0.png",
    },
    {
      "text": "Dashboard",
      "image": "assets/images/help1.png",
    },
    {
      "text": "Map Page",
      "image": "assets/images/help2.png",
    },
    {
      "text": "Page Navigation",
      "image": "assets/images/help3.png",
    },
    {
      "text": "Profile Page",
      "image": "assets/images/help4.png",
    },
    {
      "text": "Control Panel",
      "image": "assets/images/help5.png",
    },
    {
      "text": "Sensor Panel",
      "image": "assets/images/help6.png",
    },
    {
      "text": "Status Indicator",
      "image": "assets/images/help7.png",
    },
    {
      "text": "Distance Indicator",
      "image": "assets/images/help8.png",
    },
    {
      "text": "Location List",
      "image": "assets/images/help9.png",
    },
  ];

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
