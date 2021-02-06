import 'package:flutter/material.dart';
import 'package:thesis_app/helper/keyboard.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/helper/default_button.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends RegisterController {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          usernameField(),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          emailField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          password1Field(),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          show
              ? password2Field()
              : SizedBox(height: getProportionateScreenHeight(0)),
          Row(
            children: [
              Text(
                "Diaktifkan?",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
              Spacer(),
              Checkbox(
                value: active,
                activeColor: kPrimaryColor,
                onChanged: (i) {
                  setState(() {
                    active = i;
                  });
                },
              ),
            ],
          ),
          Text(
            msg,
            style: TextStyle(fontSize: 20.0, color: Colors.red),
          ),
          GuestButton(
            text: "Register",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                cek();
              }
            },
          ),
        ],
      ),
    );
  }
}
