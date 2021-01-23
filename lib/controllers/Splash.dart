import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/controllers/Intro.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/splash/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SplashBody(),
    );
  }
}

abstract class SplashController extends State<SplashBody> {
  var intro, status;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1500), () {
      getPref();
    });
    super.initState();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      intro = preferences.getInt("intro");
      status = preferences.getInt("status");
      if (intro == 1) {
        if (status == 2) {
          Navigator.pushReplacementNamed(context, UserScreen.routeName);
        } else if (status == 1) {
          Navigator.pushReplacementNamed(context, AdminScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, IntroScreen.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, IntroScreen.routeName);
      }
    });
  }
}
