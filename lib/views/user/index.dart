import 'package:flutter/material.dart';
import 'package:thesis_app/views/map/near.dart';
import 'package:thesis_app/controllers/User.dart';
import 'package:thesis_app/views/user/button.dart';
import 'package:thesis_app/views/map/lastCoor.dart';
import 'package:thesis_app/views/dashboard/title.dart';
import 'package:thesis_app/views/profile/userInfo.dart';

class UserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: TitleBar(),
        ),
        Flexible(
          flex: 3,
          child: UserInfo(),
        ),
        //Places Sectin
        Flexible(
          flex: 13,
          child: LastCoordinat(),
        ),
        //Acc Chart Section
        Flexible(
          flex: 11,
          child: NearPlace(),
        ),
        Flexible(
          flex: 5,
          child: UserButton(),
        ),
      ],
    );
  }
}
