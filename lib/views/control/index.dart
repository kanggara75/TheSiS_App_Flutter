import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Control.dart';
import 'package:thesis_app/helper/switch_button.dart';

class ControlPanel extends StatefulWidget {
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends ControlPanelController {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenWidth(700),
            height: getProportionateScreenHeight(200),
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 150, 196, 255),
              ),
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 150, 196, 255),
            ),
            child: updateState
                ? Table(
                    columnWidths: {
                      0: FlexColumnWidth(2.5),
                      1: FlexColumnWidth(1),
                    },
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Color.fromARGB(255, 189, 178, 255),
                      ),
                    ),
                    children: [
                      alarmButton(),
                      mesinButton(),
                      listrikButton(),
                      notifButton(),
                    ],
                  )
                : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  //Tampilan Untuk Switch Alarm
  TableRow alarmButton() {
    return TableRow(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              " Alarm",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            SwitchButton(
              press: () => alarmState(),
              duration: 200,
              left: alarmS ? 60.0 : 0.0,
              right: alarmS ? 0.0 : 60.0,
              color: alarmS ? Colors.greenAccent : Colors.redAccent,
              icon: alarmS
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 35,
                      key: UniqueKey(),
                    )
                  : Icon(
                      Icons.remove_circle_outline,
                      color: Color.fromARGB(255, 100, 0, 0),
                      size: 35,
                      key: UniqueKey(),
                    ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
          ],
        ),
      ],
    );
  }

  //Tampilan Untuk Switch mesin
  TableRow mesinButton() {
    return TableRow(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              " Mesin",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            SwitchButton(
              press: () => mesinState(),
              duration: 200,
              left: mesinS ? 60.0 : 0.0,
              right: mesinS ? 0.0 : 60.0,
              color: mesinS ? Colors.greenAccent : Colors.redAccent,
              icon: mesinS
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 35,
                      key: UniqueKey(),
                    )
                  : Icon(
                      Icons.remove_circle_outline,
                      color: Color.fromARGB(255, 100, 0, 0),
                      size: 35,
                      key: UniqueKey(),
                    ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
          ],
        ),
      ],
    );
  }

//Tampilan Untuk Switch Kelistrikan
  TableRow listrikButton() {
    return TableRow(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              " Kelistrikan",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            SwitchButton(
              press: () => listrikState(),
              duration: 200,
              left: listrikS ? 60.0 : 0.0,
              right: listrikS ? 0.0 : 60.0,
              color: listrikS ? Colors.greenAccent : Colors.redAccent,
              icon: listrikS
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 35,
                      key: UniqueKey(),
                    )
                  : Icon(
                      Icons.remove_circle_outline,
                      color: Color.fromARGB(255, 100, 0, 0),
                      size: 35,
                      key: UniqueKey(),
                    ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
          ],
        ),
      ],
    );
  }

  //Tampilan Untuk Switch Notifikasi
  TableRow notifButton() {
    return TableRow(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              " Notifikasi",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            SwitchButton(
              press: () => notifState(),
              duration: 200,
              left: notifS ? 60.0 : 0.0,
              right: notifS ? 0.0 : 60.0,
              color: notifS ? Colors.greenAccent : Colors.redAccent,
              icon: notifS
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 35,
                      key: UniqueKey(),
                    )
                  : Icon(
                      Icons.remove_circle_outline,
                      color: Color.fromARGB(255, 100, 0, 0),
                      size: 35,
                      key: UniqueKey(),
                    ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
          ],
        ),
      ],
    );
  }
}
