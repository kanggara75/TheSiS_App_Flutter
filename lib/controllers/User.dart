import 'package:flutter/material.dart';
import 'package:thesis_app/views/user/guest.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/user/index.dart';

class UserHomeScreen extends StatelessWidget {
  static String routeName = "/userhomescreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: UserBody(),
    );
  }
}

class GuestScreen extends StatelessWidget {
  static String routeName = "/guestpage";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GuestBody(),
    );
  }
}
