import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Navbar.dart';
import 'package:thesis_app/helper/default_button.dart';
import 'package:thesis_app/models/Locator.dart';

class AdminButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white24,
      ),
      child: ListView(
        reverse: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  FnButton(
                    text: "Map List",
                    color: Color.fromARGB(255, 70, 158, 157),
                    press: () {
                      Navigator.pushNamed(context, MapList.routeName);
                    },
                  ),
                  FnButton(
                    text: "Last Location",
                    color: Color.fromARGB(255, 70, 158, 157),
                    press: () {
                      Navigator.pushNamed(context, Near10.routeName);
                    },
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  FnButton(
                    text: "Admin Panel",
                    color: Color.fromARGB(255, 255, 151, 218),
                    press: () {
                      Navigator.pushNamed(context, AdminPanelScreen.routeName);
                    },
                  ),
                  FnButton(
                    text: "HW Manager",
                    color: Color.fromARGB(255, 255, 151, 218),
                    // press: showToast,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
