import 'package:flutter/material.dart';

import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/config/constants.dart';

import 'package:thesis_app/controllers/Login.dart';
import 'package:thesis_app/controllers/Forgot.dart';
import 'package:thesis_app/helper/keyboard.dart';

import 'package:thesis_app/helper/default_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends LoginController {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          usernameField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          passwordField(),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (i) {
                  setState(() {
                    remember = i;
                    print(i);
                  });
                },
              ),
              Text(
                "Remember me",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12.5),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => forgot(),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: getProportionateScreenWidth(12.5),
                  ),
                ),
              )
            ],
          ),
          Text(
            msg,
            style: TextStyle(fontSize: 20.0, color: Colors.red),
          ),
          LoginButton(
            text: "Login",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
              }
              cek();
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          GuestButton(
            text: "Login As Guest",
            press: () => guest(),
          ),
        ],
      ),
    );
  }
}
