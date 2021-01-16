import 'package:flutter/material.dart';
import 'package:thesis_app/views/map/index.dart';
import 'package:thesis_app/config/size_config.dart';

class MapScreen extends StatelessWidget {
  static String routeName = "/dashboard";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MapPage(),
    );
  }
}
