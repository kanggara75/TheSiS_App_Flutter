import 'package:TheSiS_App/constant.dart';
import 'package:TheSiS_App/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Text(
                    "TheSiS",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(64),
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Track Your Vehicle...!.."),
                  Image.asset(
                    "assets/images/splash_1.png",
                    height: getProportionateScreenHeight(265),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
