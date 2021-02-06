import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/views/dashboard/title.dart';
import 'package:thesis_app/views/map/lastCoor.dart';
import 'package:thesis_app/views/map/near.dart';
import 'package:thesis_app/views/profile/userInfo.dart';

class UserBody extends StatefulWidget {
  @override
  _UserBodyState createState() => _UserBodyState();
}

class _UserBodyState extends UserBodyController {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: TitleBar(),
        ),
        Flexible(
          flex: 1,
          child: UserInfo(),
        ),
        //Places Sectin
        Flexible(
          flex: 4,
          child: LastCoordinat(),
        ),
        //Acc Chart Section
        Flexible(
          flex: 3,
          child: NearPlace(),
        ),
      ],
    );
  }
}
