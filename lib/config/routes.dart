// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/widgets.dart';
import 'package:thesis_app/controllers/Intro.dart'; //Intro
import 'package:thesis_app/controllers/Login.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/controllers/Forgot.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  IntroScreen.routeName: (context) => IntroScreen(), //Intro_Screen
  LoginScreen.routeName: (context) => LoginScreen(), //Login_Screen
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  UserScreen.routeName: (context) => UserScreen(),
  AdminScreen.routeName: (context) => AdminScreen(),
  ForgotScreen.routeName: (context) => ForgotScreen(),
};
