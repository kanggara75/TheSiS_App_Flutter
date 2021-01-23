import 'package:flutter/material.dart';
import 'package:thesis_app/views/admin/index.dart';

class AdminPage extends StatelessWidget {
  static String routeName = '/adminpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminBody(),
    );
  }
}
