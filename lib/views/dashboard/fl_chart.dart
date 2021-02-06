import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:thesis_app/controllers/Dashboard.dart';

class ChartBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChartBodyState();
}

class ChartBodyState extends ChartController {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color(0xff2c274c),
            Color(0xff46426c),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: isShowingMainData
                    ? LineChart(
                        sampleData1(),
                        swapAnimationDuration:
                            const Duration(milliseconds: 250),
                      )
                    : CircularProgressIndicator(),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: isShowingMainData ? Colors.white : Colors.redAccent,
            ),
            onPressed: () {
              setState(() {
                isShowingMainData = false;
              });
              makeRequest();
            },
          )
        ],
      ),
    );
  }
}
