import 'package:flutter/material.dart';
import 'package:thesis_app/helper/keyboard.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/helper/default_button.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Edit User',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              nameField(),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              emailField(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                children: [
                  Text(
                    roleS ? "Admin" : "Member",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: roleS ? Colors.white : Colors.red,
                    ),
                  ),
                  Spacer(),
                  Checkbox(
                    value: roleS,
                    activeColor: kPrimaryColor,
                    onChanged: (i) {
                      setState(() {
                        roleS = i;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    statusS ? "User Aktif" : "User Nonaktif",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: statusS ? Colors.white : Colors.red,
                    ),
                  ),
                  Spacer(),
                  Checkbox(
                    value: statusS,
                    activeColor: kPrimaryColor,
                    onChanged: (i) {
                      setState(() {
                        statusS = i;
                      });
                    },
                  ),
                ],
              ),
              Text(
                msg,
                style: TextStyle(
                  fontSize: 20.0,
                  color: fail ? Colors.red : Colors.green,
                ),
              ),
              GuestButton(
                text: "Update",
                press: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    KeyboardUtil.hideKeyboard(context);
                    cek();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
