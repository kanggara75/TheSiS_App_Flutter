import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/splash/index.dart';

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
