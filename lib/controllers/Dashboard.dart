import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/dashboard/index.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:thesis_app/views/dashboard/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = "/dashboard";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: DashboardBody(),
    );
  }
}

class ChartScreen extends StatelessWidget {
  static String routeName = "/chart";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ChartBody(),
    );
  }
}

abstract class DashboardController extends State<DashboardBody> {}

abstract class ChartController extends State<ChartBody> {
  bool isShowingMainData;
  List dataAcc;
  Timer timer;

  @override
  void initState() {
    super.initState();
    makeRequest();
    isShowingMainData = false;
    timer = new Timer.periodic(
      new Duration(seconds: 30),
      (t) => makeRequest(),
    );
    // seriesList = _createChart();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  makeRequest() async {
    var response = await http.get(
      BaseUrl.acc,
      headers: {'Accept': 'application/json'},
    );

    setState(() {
      dataAcc = json.decode(response.body);
      isShowingMainData = true;
      print(dataAcc.toList());
    });
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 1,
      maxX: 51,
      maxY: 1050,
      minY: -1050,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(00.00, (dataAcc[50]['x'] / 1.00)),
        FlSpot(01.00, (dataAcc[49]['x'] / 1.00)),
        FlSpot(02.00, (dataAcc[48]['x'] / 1.00)),
        FlSpot(03.00, (dataAcc[47]['x'] / 1.00)),
        FlSpot(04.00, (dataAcc[46]['x'] / 1.00)),
        FlSpot(05.00, (dataAcc[45]['x'] / 1.00)),
        FlSpot(06.00, (dataAcc[44]['x'] / 1.00)),
        FlSpot(07.00, (dataAcc[43]['x'] / 1.00)),
        FlSpot(08.00, (dataAcc[42]['x'] / 1.00)),
        FlSpot(09.00, (dataAcc[41]['x'] / 1.00)),
        FlSpot(10.00, (dataAcc[40]['x'] / 1.00)),
        FlSpot(11.00, (dataAcc[39]['x'] / 1.00)),
        FlSpot(12.00, (dataAcc[38]['x'] / 1.00)),
        FlSpot(13.00, (dataAcc[37]['x'] / 1.00)),
        FlSpot(14.00, (dataAcc[36]['x'] / 1.00)),
        FlSpot(15.00, (dataAcc[35]['x'] / 1.00)),
        FlSpot(16.00, (dataAcc[34]['x'] / 1.00)),
        FlSpot(17.00, (dataAcc[33]['x'] / 1.00)),
        FlSpot(18.00, (dataAcc[32]['x'] / 1.00)),
        FlSpot(19.00, (dataAcc[31]['x'] / 1.00)),
        FlSpot(20.00, (dataAcc[30]['x'] / 1.00)),
        FlSpot(21.00, (dataAcc[29]['x'] / 1.00)),
        FlSpot(22.00, (dataAcc[28]['x'] / 1.00)),
        FlSpot(23.00, (dataAcc[27]['x'] / 1.00)),
        FlSpot(24.00, (dataAcc[26]['x'] / 1.00)),
        FlSpot(25.00, (dataAcc[25]['x'] / 1.00)),
        FlSpot(26.00, (dataAcc[24]['x'] / 1.00)),
        FlSpot(27.00, (dataAcc[23]['x'] / 1.00)),
        FlSpot(28.00, (dataAcc[22]['x'] / 1.00)),
        FlSpot(29.00, (dataAcc[21]['x'] / 1.00)),
        FlSpot(30.00, (dataAcc[20]['x'] / 1.00)),
        FlSpot(31.00, (dataAcc[19]['x'] / 1.00)),
        FlSpot(32.00, (dataAcc[18]['x'] / 1.00)),
        FlSpot(33.00, (dataAcc[17]['x'] / 1.00)),
        FlSpot(34.00, (dataAcc[16]['x'] / 1.00)),
        FlSpot(35.00, (dataAcc[15]['x'] / 1.00)),
        FlSpot(36.00, (dataAcc[14]['x'] / 1.00)),
        FlSpot(37.00, (dataAcc[13]['x'] / 1.00)),
        FlSpot(38.00, (dataAcc[12]['x'] / 1.00)),
        FlSpot(39.00, (dataAcc[11]['x'] / 1.00)),
        FlSpot(40.00, (dataAcc[10]['x'] / 1.00)),
        FlSpot(41.00, (dataAcc[09]['x'] / 1.00)),
        FlSpot(42.00, (dataAcc[08]['x'] / 1.00)),
        FlSpot(43.00, (dataAcc[07]['x'] / 1.00)),
        FlSpot(44.00, (dataAcc[06]['x'] / 1.00)),
        FlSpot(45.00, (dataAcc[05]['x'] / 1.00)),
        FlSpot(46.00, (dataAcc[04]['x'] / 1.00)),
        FlSpot(47.00, (dataAcc[03]['x'] / 1.00)),
        FlSpot(48.00, (dataAcc[02]['x'] / 1.00)),
        FlSpot(49.00, (dataAcc[01]['x'] / 1.00)),
        FlSpot(50.00, (dataAcc[00]['x'] / 1.00)),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(00.00, (dataAcc[50]['y'] / 1.00)),
        FlSpot(01.00, (dataAcc[49]['y'] / 1.00)),
        FlSpot(02.00, (dataAcc[48]['y'] / 1.00)),
        FlSpot(03.00, (dataAcc[47]['y'] / 1.00)),
        FlSpot(04.00, (dataAcc[46]['y'] / 1.00)),
        FlSpot(05.00, (dataAcc[45]['y'] / 1.00)),
        FlSpot(06.00, (dataAcc[44]['y'] / 1.00)),
        FlSpot(07.00, (dataAcc[43]['y'] / 1.00)),
        FlSpot(08.00, (dataAcc[42]['y'] / 1.00)),
        FlSpot(09.00, (dataAcc[41]['y'] / 1.00)),
        FlSpot(10.00, (dataAcc[40]['y'] / 1.00)),
        FlSpot(11.00, (dataAcc[39]['y'] / 1.00)),
        FlSpot(12.00, (dataAcc[38]['y'] / 1.00)),
        FlSpot(13.00, (dataAcc[37]['y'] / 1.00)),
        FlSpot(14.00, (dataAcc[36]['y'] / 1.00)),
        FlSpot(15.00, (dataAcc[35]['y'] / 1.00)),
        FlSpot(16.00, (dataAcc[34]['y'] / 1.00)),
        FlSpot(17.00, (dataAcc[33]['y'] / 1.00)),
        FlSpot(18.00, (dataAcc[32]['y'] / 1.00)),
        FlSpot(19.00, (dataAcc[31]['y'] / 1.00)),
        FlSpot(20.00, (dataAcc[30]['y'] / 1.00)),
        FlSpot(21.00, (dataAcc[29]['y'] / 1.00)),
        FlSpot(22.00, (dataAcc[28]['y'] / 1.00)),
        FlSpot(23.00, (dataAcc[27]['y'] / 1.00)),
        FlSpot(24.00, (dataAcc[26]['y'] / 1.00)),
        FlSpot(25.00, (dataAcc[25]['y'] / 1.00)),
        FlSpot(26.00, (dataAcc[24]['y'] / 1.00)),
        FlSpot(27.00, (dataAcc[23]['y'] / 1.00)),
        FlSpot(28.00, (dataAcc[22]['y'] / 1.00)),
        FlSpot(29.00, (dataAcc[21]['y'] / 1.00)),
        FlSpot(30.00, (dataAcc[20]['y'] / 1.00)),
        FlSpot(31.00, (dataAcc[19]['y'] / 1.00)),
        FlSpot(32.00, (dataAcc[18]['y'] / 1.00)),
        FlSpot(33.00, (dataAcc[17]['y'] / 1.00)),
        FlSpot(34.00, (dataAcc[16]['y'] / 1.00)),
        FlSpot(35.00, (dataAcc[15]['y'] / 1.00)),
        FlSpot(36.00, (dataAcc[14]['y'] / 1.00)),
        FlSpot(37.00, (dataAcc[13]['y'] / 1.00)),
        FlSpot(38.00, (dataAcc[12]['y'] / 1.00)),
        FlSpot(39.00, (dataAcc[11]['y'] / 1.00)),
        FlSpot(40.00, (dataAcc[10]['y'] / 1.00)),
        FlSpot(41.00, (dataAcc[09]['y'] / 1.00)),
        FlSpot(42.00, (dataAcc[08]['y'] / 1.00)),
        FlSpot(43.00, (dataAcc[07]['y'] / 1.00)),
        FlSpot(44.00, (dataAcc[06]['y'] / 1.00)),
        FlSpot(45.00, (dataAcc[05]['y'] / 1.00)),
        FlSpot(46.00, (dataAcc[04]['y'] / 1.00)),
        FlSpot(47.00, (dataAcc[03]['y'] / 1.00)),
        FlSpot(48.00, (dataAcc[02]['y'] / 1.00)),
        FlSpot(49.00, (dataAcc[01]['y'] / 1.00)),
        FlSpot(50.00, (dataAcc[00]['y'] / 1.00)),
      ],
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(00.00, (dataAcc[50]['z'] / 1.00)),
        FlSpot(01.00, (dataAcc[49]['z'] / 1.00)),
        FlSpot(02.00, (dataAcc[48]['z'] / 1.00)),
        FlSpot(03.00, (dataAcc[47]['z'] / 1.00)),
        FlSpot(04.00, (dataAcc[46]['z'] / 1.00)),
        FlSpot(05.00, (dataAcc[45]['z'] / 1.00)),
        FlSpot(06.00, (dataAcc[44]['z'] / 1.00)),
        FlSpot(07.00, (dataAcc[43]['z'] / 1.00)),
        FlSpot(08.00, (dataAcc[42]['z'] / 1.00)),
        FlSpot(09.00, (dataAcc[41]['z'] / 1.00)),
        FlSpot(10.00, (dataAcc[40]['z'] / 1.00)),
        FlSpot(11.00, (dataAcc[39]['z'] / 1.00)),
        FlSpot(12.00, (dataAcc[38]['z'] / 1.00)),
        FlSpot(13.00, (dataAcc[37]['z'] / 1.00)),
        FlSpot(14.00, (dataAcc[36]['z'] / 1.00)),
        FlSpot(15.00, (dataAcc[35]['z'] / 1.00)),
        FlSpot(16.00, (dataAcc[34]['z'] / 1.00)),
        FlSpot(17.00, (dataAcc[33]['z'] / 1.00)),
        FlSpot(18.00, (dataAcc[32]['z'] / 1.00)),
        FlSpot(19.00, (dataAcc[31]['z'] / 1.00)),
        FlSpot(20.00, (dataAcc[30]['z'] / 1.00)),
        FlSpot(21.00, (dataAcc[29]['z'] / 1.00)),
        FlSpot(22.00, (dataAcc[28]['z'] / 1.00)),
        FlSpot(23.00, (dataAcc[27]['z'] / 1.00)),
        FlSpot(24.00, (dataAcc[26]['z'] / 1.00)),
        FlSpot(25.00, (dataAcc[25]['z'] / 1.00)),
        FlSpot(26.00, (dataAcc[24]['z'] / 1.00)),
        FlSpot(27.00, (dataAcc[23]['z'] / 1.00)),
        FlSpot(28.00, (dataAcc[22]['z'] / 1.00)),
        FlSpot(29.00, (dataAcc[21]['z'] / 1.00)),
        FlSpot(30.00, (dataAcc[20]['z'] / 1.00)),
        FlSpot(31.00, (dataAcc[19]['z'] / 1.00)),
        FlSpot(32.00, (dataAcc[18]['z'] / 1.00)),
        FlSpot(33.00, (dataAcc[17]['z'] / 1.00)),
        FlSpot(34.00, (dataAcc[16]['z'] / 1.00)),
        FlSpot(35.00, (dataAcc[15]['z'] / 1.00)),
        FlSpot(36.00, (dataAcc[14]['z'] / 1.00)),
        FlSpot(37.00, (dataAcc[13]['z'] / 1.00)),
        FlSpot(38.00, (dataAcc[12]['z'] / 1.00)),
        FlSpot(39.00, (dataAcc[11]['z'] / 1.00)),
        FlSpot(40.00, (dataAcc[10]['z'] / 1.00)),
        FlSpot(41.00, (dataAcc[09]['z'] / 1.00)),
        FlSpot(42.00, (dataAcc[08]['z'] / 1.00)),
        FlSpot(43.00, (dataAcc[07]['z'] / 1.00)),
        FlSpot(44.00, (dataAcc[06]['z'] / 1.00)),
        FlSpot(45.00, (dataAcc[05]['z'] / 1.00)),
        FlSpot(46.00, (dataAcc[04]['z'] / 1.00)),
        FlSpot(47.00, (dataAcc[03]['z'] / 1.00)),
        FlSpot(48.00, (dataAcc[02]['z'] / 1.00)),
        FlSpot(49.00, (dataAcc[01]['z'] / 1.00)),
        FlSpot(50.00, (dataAcc[00]['z'] / 1.00)),
      ],
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
}
