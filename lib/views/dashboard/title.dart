import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(double.infinity),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "   The",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "SiS   ",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: Color.fromARGB(255, 68, 213, 173),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }
}
