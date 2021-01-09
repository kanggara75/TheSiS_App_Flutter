import 'package:flutter/material.dart';
import 'package:thesis_app/views/forgot/index.dart';

class ForgotScreen extends StatelessWidget {
  static String routeName = '/forgot';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgotBody(),
    );
  }
}
