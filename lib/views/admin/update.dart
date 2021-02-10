import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Admin.dart';

class UpdateUser extends StatefulWidget {
  final int id;
  final int role;
  final int status;
  final String name;
  final String email;

  UpdateUser({
    this.id,
    this.name,
    this.email,
    this.status,
    this.role,
  });
  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends UpdateUserController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: snackbarKey,
      appBar: AppBar(
        title: Text('Edit Employee'),
        actions: <Widget>[
          FlatButton(
            child: isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
            onPressed: () => update(),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            nameField(),
            emailField(),
            roleField(),
            statusField(),
          ],
        ),
      ),
    );
  }
}
