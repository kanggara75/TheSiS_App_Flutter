import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/admin/register.dart';

class UserRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Image.asset(
                  "assets/icons/logo.png",
                  height: SizeConfig.screenHeight * 0.1,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "User Registration",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Register(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("User Management"),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Setting"),
    );
  }
}
