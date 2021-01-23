import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Navbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AdminNavBar extends StatefulWidget {
  @override
  _AdminNavBarState createState() => _AdminNavBarState();
}

class _AdminNavBarState extends AdminNavBarController {
  int tap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: tap == 0 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.view_quilt_rounded,
            size: 30,
            color: tap == 1 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.two_wheeler,
            size: 30,
            color: tap == 2 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.settings_remote,
            size: 30,
            color: tap == 3 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.person,
            size: 30,
            color: tap == 4 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 53, 95, 103),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tapedIndex) {
          setState(
            () {
              showPage = pageChooser(tapedIndex);
              tap = tapedIndex.toInt();
              print(tap);
            },
          );
        },
      ),
      body: showPage,
    );
  }
}
