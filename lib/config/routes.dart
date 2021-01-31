// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/widgets.dart';
import 'package:thesis_app/controllers/Map.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/controllers/Intro.dart'; //Intro
import 'package:thesis_app/controllers/Login.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/controllers/Splash.dart';
import 'package:thesis_app/controllers/Navbar.dart';
import 'package:thesis_app/controllers/Forgot.dart';
import 'package:thesis_app/controllers/Control.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  MapCount.routeName: (context) => MapCount(),
  MapScreen.routeName: (context) => MapScreen(),
  UserScreen.routeName: (context) => UserScreen(),
  IntroScreen.routeName: (context) => IntroScreen(), //Intro_Screen
  LoginScreen.routeName: (context) => LoginScreen(), //Login_Screen
  AdminScreen.routeName: (context) => AdminScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  ForgotScreen.routeName: (context) => ForgotScreen(),
  ControlScreen.routeName: (context) => ControlScreen(),
  UserHomeScreen.routeName: (context) => UserHomeScreen(),
  AdminHomeScreen.routeName: (context) => AdminHomeScreen(),
};
