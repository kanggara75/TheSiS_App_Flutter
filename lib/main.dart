import 'package:flutter/material.dart';
import 'package:thesis_app/routes.dart';
import 'package:thesis_app/theme.dart';
import 'package:thesis_app/screen/intro_page/intro_page.dart';
// import 'package:thesis_app/screens/profile/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TheSiS App',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
