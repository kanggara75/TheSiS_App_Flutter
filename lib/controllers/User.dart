import 'package:flutter/material.dart';
import 'package:thesis_app/views/user/guest.dart';
import 'package:thesis_app/config/size_config.dart';

class GuestScreen extends StatelessWidget {
  static String routeName = "/guest";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GuestBody(),
    );
  }
}
