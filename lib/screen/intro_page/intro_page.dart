import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:thesis_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/intro_page";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
