import 'package:flutter/material.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/controllers/Help.dart';
import 'package:thesis_app/controllers/Login.dart';
import 'package:thesis_app/views/profile/index.dart';
import 'package:thesis_app/views/profile/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: ProfileBody(),
    );
  }
}

abstract class ProfileController extends State<ProfileBody> {
  bool isConnect = false;
  var image, status, joindate, name, email, password;
  var imageUrl;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  help() {
    Navigator.pushNamed(context, HelpScreen.routeName);
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      status = preferences.getInt("status");
      joindate = preferences.getString("joindate");
      name = preferences.getString("name");
      email = preferences.getString("email");
      password = preferences.getString("password");
      image = preferences.getString("image");
      imageUrl = BaseUrl.profileImage + image;
      isConnect = true;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("intro", 0);
      preferences.setInt("gps", null);
      preferences.setInt("pesan", null);
      preferences.setInt("alarm", null);
      preferences.setInt("mesin", null);
      preferences.setInt("notif", null);
      preferences.setInt("status", null);
      preferences.setInt("listrik", null);
      preferences.setInt("joindate", null);
      preferences.setString("name", null);
      preferences.setString("email", null);
      preferences.setString("image", null);
      preferences.setString("password", null);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }
}

abstract class UserInfoController extends State<UserInfo> {
  bool isConnect = false;
  var image, joindate, name, email;
  var imageUrl;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      joindate = preferences.getString("joindate");
      name = preferences.getString("name");
      email = preferences.getString("email");
      image = preferences.getString("image");
      imageUrl = BaseUrl.profileImage + image;
      isConnect = true;
    });
  }
}
