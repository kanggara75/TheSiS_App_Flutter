import 'package:flutter/material.dart';
import 'package:thesis_app/views/admin/index.dart';

class AdminScreen extends StatelessWidget {
  static String routeName = '/admin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminBody(),
    );
  }
}
