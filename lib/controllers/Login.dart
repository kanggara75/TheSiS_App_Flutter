import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/config/size_config.dart';

import 'package:thesis_app/views/login/index.dart'; //LoginBody
import 'package:thesis_app/views/login/login.dart';

import 'package:thesis_app/views/login/login_success.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/controllers/Forgot.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/loginSuccess";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LoginSuccess(),
    );
  }
}

abstract class LoginController extends State<Login> {
  var status;
  String msg = '', pmsg, emsg;
  bool _secureText = true, remember = true;
  final List<String> errors = [];

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getPref();
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
      msg = '';
    });
  }

  forgot() {
    Navigator.pushNamed(context, ForgotScreen.routeName);
  }

  guest() {
    Navigator.pushReplacementNamed(context, GuestScreen.routeName);
  }

  cek() {
    if (emsg.isNotEmpty) {
      setState(() {
        msg = emsg + '\n';
      });
    } else if (pmsg.isNotEmpty) {
      setState(() {
        msg = pmsg + '\n';
      });
    } else {
      login();
    }
  }

  // ignore: missing_return
  Future<List> login() async {
    final response = await http.post(apiLogin, body: {
      "email": user.text,
      "password": pass.text,
    });

    final data = json.decode(response.body);
    int status = data['value'];
    String pesan = data['messege'];
    print(data);
    if (data.length == 0) {
      setState(() {
        msg = "Error";
      });
    } else {
      savePref(status);
      if (status == 2) {
        Navigator.pushReplacementNamed(context, UserScreen.routeName);
      } else if (status == 1) {
        Navigator.pushReplacementNamed(context, AdminScreen.routeName);
      } else {
        setState(() {
          msg = pesan + '\n';
        });
      }
    }
  }

  savePref(status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("status", status);
      // preferences.commit();
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      status = preferences.getInt("status");
      if (status == 2) {
        Navigator.pushReplacementNamed(context, UserScreen.routeName);
      } else if (status == 1) {
        Navigator.pushReplacementNamed(context, AdminScreen.routeName);
      }
    });
  }

  //Config for Username section
  TextFormField usernameField() {
    return TextFormField(
      controller: user,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          emsg = '';
        } else if (emailValidatorRegExp.hasMatch(value)) {
          emsg = '';
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          emsg = kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          emsg = kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: () {},
          icon: Icon(
            Icons.mail,
          ),
        ),
      ),
    );
  }

  //Config for passwordd section
  TextFormField passwordField() {
    return TextFormField(
      controller: pass,
      obscureText: _secureText,
      onChanged: (value) {
        if (value.isNotEmpty) {
          pmsg = '';
        } else if (value.length >= 6) {
          pmsg = '';
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          pmsg = kPassNullError;
        } else if (value.length < 6) {
          pmsg = kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: showHide,
          icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
