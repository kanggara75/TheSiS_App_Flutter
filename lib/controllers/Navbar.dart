import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Map.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Profile.dart';
import 'package:thesis_app/controllers/Dashboard.dart';
import 'package:thesis_app/views/admin/adminPanel.dart';
import 'package:thesis_app/views/navBar/user_Navbar.dart';
import 'package:thesis_app/views/navBar/admin_Navbar.dart';
import 'package:thesis_app/views/navBar/adminPanel_Navbar.dart';

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

class AdminPanelScreen extends StatelessWidget {
  static String routeName = '/adminpanel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminPanel(),
    );
  }
}

abstract class AdminNavBarController extends State<AdminNavBar> {
  int pageIndex = 0;

  Widget showPage = new AdminHomeScreen();

  final AdminHomeScreen _adminHomeScreen = new AdminHomeScreen();
  final MapScreen _mapScreen = new MapScreen();
  final UserProfile _userProfile = new UserProfile();
  final DashboardScreen _dashboardScreen = new DashboardScreen();

  pageChooser(int page) {
    switch (page) {
      case 0:
        return _adminHomeScreen;
        break;
      case 1:
        return _dashboardScreen;
        break;
      case 2:
        return _mapScreen;
        break;
      case 3:
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

abstract class AdminPanelController extends State<AdminPanel> {
  int pageIndex = 0;

  Widget showPage = new UserRegister();

  final UserRegister _userRegister = new UserRegister();
  final UserManager _userManager = new UserManager();
  final Setting _setting = new Setting();

  pageChooser(int page) {
    switch (page) {
      case 0:
        return _userRegister;
        break;
      case 1:
        return _userManager;
        break;
      case 2:
        return _setting;
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
