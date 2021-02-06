import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thesis_app/views/user/button.dart';
import 'package:thesis_app/views/user/guest.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/user/index.dart';

class UserHomeScreen extends StatelessWidget {
  static String routeName = "/userhomescreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: UserBody(),
    );
  }
}

class GuestScreen extends StatelessWidget {
  static String routeName = "/guestpage";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GuestBody(),
    );
  }
}

abstract class UserButtonController extends State<UserButton> {
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Color.fromARGB(200, 255, 50, 50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.dangerous),
          SizedBox(
            width: 12.0,
          ),
          Text("You are Not Admin"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(milliseconds: 800),
    );
  }
}
