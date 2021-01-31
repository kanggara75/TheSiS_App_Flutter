import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Map.dart';
import 'package:thesis_app/views/map/index.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Profile.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/controllers/Dashboard.dart';
import 'package:thesis_app/views/navBar/user_Navbar.dart';
import 'package:thesis_app/views/navBar/admin_Navbar.dart';

class UserScreen extends StatelessWidget {
  static String routeName = "/user";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: UserNavBar(),
    );
  }
}

class AdminScreen extends StatelessWidget {
  static String routeName = '/admin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminNavBar(),
    );
  }
}

abstract class AdminNavBarController extends State<AdminNavBar> {
  int pageIndex = 0;

  Widget showPage = new AdminHomeScreen();

  final AdminHomeScreen _adminPage = new AdminHomeScreen();
  final MapScreen _mapScreen = new MapScreen();
  final UserProfile _userProfile = new UserProfile();
  final UserLocationNow _locationNow = new UserLocationNow();
  final DashboardScreen _dashboardScreen = new DashboardScreen();

  pageChooser(int page) {
    switch (page) {
      case 0:
        return _adminPage;
        break;
      case 1:
        return _dashboardScreen;
        break;
      case 2:
        return _mapScreen;
        break;
      case 3:
        return _locationNow;
        break;
      case 4:
        return _userProfile;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("Page Not Availabel yet...!"),
          ),
        );
    }
  }
}

abstract class UserNavBarController extends State<UserNavBar> {
  int pageIndex = 0;

  Widget showPage = new UserHomeScreen();

  final MapScreen _mapScreen = new MapScreen();
  final UserProfile _userProfile = new UserProfile();
  final UserLocationNow _locationNow = new UserLocationNow();
  final UserHomeScreen _userHomeScreen = new UserHomeScreen();
  final DashboardScreen _dashboardScreen = new DashboardScreen();

  pageChooser(int page) {
    switch (page) {
      case 0:
        return _userHomeScreen;
        break;
      case 1:
        return _dashboardScreen;
        break;
      case 2:
        return _mapScreen;
        break;
      case 3:
        return _locationNow;
        break;
      case 4:
        return _userProfile;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("Page Not Availabel yet...!"),
          ),
        );
    }
  }
}
