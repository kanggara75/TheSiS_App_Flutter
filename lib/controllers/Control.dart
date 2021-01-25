import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/control/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlScreen extends StatelessWidget {
  static String routeName = "/control";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ControlPanel(),
    );
  }
}

abstract class ControlPanelController extends State<ControlPanel> {
  bool alarmS = false, mesinS = false, notifS = false, listrikS = false;
  int alarm, mesin, notif, listrik, gps;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      alarm = preferences.getInt("alarm");
      mesin = preferences.getInt("mesin");
      listrik = preferences.getInt("listrik");
      notif = preferences.getInt("notif");
      alarmS = alarm == 0 ? false : true;
      notifS = notif == 0 ? false : true;
      mesinS = mesin == 0 ? false : true;
      listrikS = listrik == 0 ? false : true;
    });
  }

  alarmState() {
    setState(() {
      alarmS = !alarmS;
      alarm = alarmS ? 1 : 0;
      update(2, alarm);
    });
  }

  listrikState() {
    setState(() {
      listrikS = !listrikS;
      listrik = listrikS ? 1 : 0;
      update(3, listrik);
    });
  }

  mesinState() {
    setState(() {
      mesinS = !mesinS;
      mesin = mesinS ? 1 : 0;
      update(4, mesin);
    });
  }

  notifState() {
    setState(() {
      notifS = !notifS;
      notif = notifS ? 1 : 0;
      update(5, notif);
    });
  }

  // ignore: missing_return
  Future<List> update(int id, int state) async {
    final kontrol = await http.post(BaseUrl.updateKontrol, body: {
      "id": id.toString(),
      "state": state.toString(),
    });

    final kontrolData = json.decode(kontrol.body);
    print(kontrolData);
    gps = kontrolData['GPS'];
    notif = kontrolData['Notif'];
    alarm = kontrolData['Alarm'];
    mesin = kontrolData['Mesin'];
    listrik = kontrolData['Listrik'];

    if (kontrolData.length == 0) {
      setState(() {
        String msg = "Error";
        print(msg);
      });
    } else {
      setState(() {
        savePref(gps, notif, alarm, mesin, listrik);
      });
    }
  }

  savePref(gps, notif, alarm, mesin, listrik) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("gps", gps);
      preferences.setInt("alarm", alarm);
      preferences.setInt("mesin", mesin);
      preferences.setInt("notif", notif);
      preferences.setInt("listrik", listrik);
    });
  }
}
