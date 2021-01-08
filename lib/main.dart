import 'package:flutter/material.dart';
import 'package:thesis_app/config/routes.dart';
import 'package:thesis_app/config/theme.dart';
import 'package:thesis_app/controllers/Intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Disable Debud banner on right top app
      title: 'TheSiS App',
      theme: theme(), //Theme for this App
      initialRoute: IntroScreen.routeName, //Redirect to Intro Screen
      routes: routes, //Setup Routes from routers.dart
    );
  }
}
