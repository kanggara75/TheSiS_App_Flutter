import 'package:flutter/widgets.dart';
import 'package:thesis_app/controllers/Intro.dart'; //Intro
import 'package:thesis_app/controllers/Login.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  IntroScreen.routeName: (context) => IntroScreen(), //Intro_Screen
  LoginScreen.routeName: (context) => LoginScreen(), //Login_Screen
};
