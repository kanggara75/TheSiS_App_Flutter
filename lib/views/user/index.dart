import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Login.dart';

class UserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User Page"),
            RaisedButton(onPressed: () {
              Navigator.pop(context, LoginScreen.routeName);
            }),
          ],
        ),
      ],
    );
  }
}
