import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "The",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "SiS",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: Color.fromARGB(255, 68, 213, 173),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
