import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Navbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends AdminPanelController {
  int tap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        items: [
          Icon(
            Icons.admin_panel_settings,
            size: 30,
            color: tap == 0 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.app_registration,
            size: 30,
            color: tap == 1 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
          Icon(
            Icons.settings_applications,
            size: 30,
            color: tap == 2 ? Color(0xFF06b3fa) : Color.fromARGB(255, 0, 0, 0),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
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
