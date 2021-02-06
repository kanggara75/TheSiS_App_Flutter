import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Map.dart';

class LastCoordinat extends StatefulWidget {
  @override
  _LastCoordinatState createState() => _LastCoordinatState();
}

class _LastCoordinatState extends LastCoordController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(275),
      width: getProportionateScreenWidth(double.infinity),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 189, 178, 255),
        ),
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 189, 178, 255),
      ),
      child: ListView(
        reverse: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "5 Koordinat Terakhir",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              isShowingMainData
                  ? Table(
                      columnWidths: {
                        0: FlexColumnWidth(0.5),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(1),
                      },
                      border: TableBorder(
                          horizontalInside: BorderSide(
                            color: Color.fromARGB(255, 7, 30, 34),
                          ),
                          verticalInside: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 252),
                          )),
                      children: [
                        headerTable(),
                        tableContent(
                          1,
                          lat0,
                          lon0,
                          time0,
                        ),
                        tableContent(
                          2,
                          lat1,
                          lon1,
                          time1,
                        ),
                        tableContent(
                          3,
                          lat2,
                          lon2,
                          time2,
                        ),
                        tableContent(
                          4,
                          lat3,
                          lon3,
                          time3,
                        ),
                        tableContent(
                          5,
                          lat4,
                          lon4,
                          time4,
                        ),
                      ],
                    )
                  : CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  TableRow headerTable() {
    return TableRow(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "  No.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "Latitude ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "Longitude",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "Waktu ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  TableRow tableContent(int no, double lon, double lat, String time) {
    return TableRow(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "  $no",
              textAlign: TextAlign.center,
              style: TextStyle(
                // color: ,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "$lon",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "$lat",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "$time",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
