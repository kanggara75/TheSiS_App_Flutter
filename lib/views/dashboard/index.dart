import 'package:flutter/material.dart';
import 'package:thesis_app/views/map/counter.dart';
import 'package:thesis_app/views/map/distance.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/control/index.dart';
import 'package:thesis_app/controllers/Dashboard.dart';
import 'package:thesis_app/views/map/deviceStatus.dart';
import 'package:thesis_app/views/dashboard/fl_chart.dart';

class DashboardBody extends StatefulWidget {
  @override
  _DashboardBodyState createState() => _DashboardBodyState();
}

class _DashboardBodyState extends DashboardController {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Tittle Section
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "   The",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "SiS   ",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: Color.fromARGB(255, 68, 213, 173),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        //Status Section
        Flexible(
          flex: 9,
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
                Flexible(
                  flex: 1,
                  child: DeviceStatus(),
                ),
              ],
            ),
          ),
        ),
        //Control Panel Section
        Flexible(
          flex: 12,
          child: ControlPanel(),
        ),
        //Acc Chart Section
        Flexible(
          flex: 18,
          child: ChartBody(),
        ),
      ],
    );
  }
}
