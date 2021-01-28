import 'package:flutter/material.dart';
import 'package:thesis_app/controllers/Dashboard.dart';
import 'package:thesis_app/views/control/index.dart';
import 'package:thesis_app/views/dashboard/fl_chart.dart';
import 'package:thesis_app/views/map/counter.dart';
import 'package:thesis_app/views/map/distance.dart';

class DashboardBody extends StatefulWidget {
  @override
  _DashboardBodyState createState() => _DashboardBodyState();
}

class _DashboardBodyState extends DashboardController {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.white70,
          ),
        ),
        Flexible(
          flex: 4,
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            // color: Colors.red,
            child: Row(
              children: [
                // Map Counter
                Flexible(
                  flex: 1,
                  child: MapCounter(),
                ),
                // Map Distance
                Flexible(
                  flex: 1,
                  child: MapDistance(),
                ),
                // TODO Views
                Flexible(
                  flex: 1,
                  child: MapDistance(),
                ),
              ],
            ),
          ),
        ),
        //Control Panel Section
        Flexible(
          flex: 6,
          child: ControlPanel(),
        ),
        //Acc Chart Section
        Flexible(
          flex: 9,
          child: ChartBody(),
        ),
      ],
    );
  }
  // child: buildCard(Icons.ac_unit, "AC Unit"),

  Card buildCard(IconData icon, String text) {
    return Card(
      color: Colors.blueAccent,
      elevation: 10,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Icon(icon),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
