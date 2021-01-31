import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/views/login/login.dart';
import 'package:thesis_app/views/login/index.dart'; //LoginBody
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Navbar.dart';
import 'package:thesis_app/controllers/Forgot.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

abstract class LoginController extends State<Login> {
  String msg = '', pmsg, emsg;
  bool _secureText = true, remember = true;
  final List<String> errors = [];

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

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
    final response = await http.post(BaseUrl.login, body: {
      "email": user.text,
      "password": pass.text,
    });

    final data = json.decode(response.body);

    int intro = 1;
    int status = data['value'];
    int gps = data['GPS'];
    int notif = data['Notif'];
    int alarm = data['Alarm'];
    int mesin = data['Mesin'];
    int listrik = data['Listrik'];
    int count = data['MapCount'];
    String name = data['name'];
    String email = data['email'];
    String image = data['image'];
    String pesan = data['messege'];
    String password = data['password'];
    String joindate = data['date_created'];
    print(data);
    remember
        ? savePref(
            intro,
            status,
            joindate,
            name,
            email,
            image,
            pesan,
            password,
            gps,
            notif,
            alarm,
            mesin,
            listrik,
            count,
          )
        : savePref(
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            gps,
            notif,
            alarm,
            mesin,
            listrik,
            count,
          );
    if (data.length == 0) {
      setState(() {
        msg = "Error";
      });
    } else {
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

  savePref(
    intro,
    status,
    joindate,
    name,
    email,
    image,
    pesan,
    password,
    gps,
    notif,
    alarm,
    mesin,
    listrik,
    count,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("gps", gps);
      preferences.setInt("intro", intro);
      preferences.setInt("alarm", alarm);
      preferences.setInt("mesin", mesin);
      preferences.setInt("notif", notif);
      preferences.setInt("status", status);
      preferences.setInt("mapcount", count);
      preferences.setInt("listrik", listrik);
      preferences.setString("name", name);
      preferences.setString("pesan", pesan);
      preferences.setString("email", email);
      preferences.setString("image", image);
      preferences.setString("password", password);
      preferences.setString("joindate", joindate);
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
