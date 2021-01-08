import 'package:flutter/material.dart';
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
