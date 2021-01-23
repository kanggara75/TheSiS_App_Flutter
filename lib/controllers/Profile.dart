import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Login.dart';
import 'package:thesis_app/views/profile/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thesis_app/config/constants.dart';

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
  @override
  void initState() {
    super.initState();
    getPref();
  }

  String imageUrl =
      "https://thesis.kanggara.net/assets/img/profile/default.jpg";
  var image;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      int status = preferences.getInt("status");
      String joindate = preferences.getString("joindate");
      String name = preferences.getString("name");
      String email = preferences.getString("email");
      String password = preferences.getString("password");
      image = preferences.getString("image");
      imageUrl = BaseUrl.profileImage + image;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("status", null);
      preferences.setInt("pesan", null);
      preferences.setInt("intro", 0);
      preferences.setInt("joindate", null);
      preferences.setString("name", null);
      preferences.setString("email", null);
      preferences.setString("image", null);
      preferences.setString("password", null);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }
}
