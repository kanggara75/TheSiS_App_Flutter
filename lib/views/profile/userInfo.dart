import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Profile.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends UserInfoController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(75),
      width: getProportionateScreenWidth(double.infinity),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 160, 196, 255),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              Text(
                "E-Mail ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              Text(
                "Join On",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ":",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              Text(
                ":",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              Text(
                ":",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              Text(
                "$email",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              Text(
                "$joindate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(65),
            width: getProportionateScreenWidth(65),
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  foregroundColor: Colors.black,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ],
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
        ],
      ),
    );
  }
}
