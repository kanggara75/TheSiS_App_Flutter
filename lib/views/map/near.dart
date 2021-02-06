import 'package:flutter/material.dart';
import 'package:thesis_app/models/Locator.dart';
import 'package:thesis_app/config/size_config.dart';

class NearPlace extends StatefulWidget {
  @override
  _NearPlaceState createState() => _NearPlaceState();
}

class _NearPlaceState extends NearPlaceController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(double.infinity),
      width: getProportionateScreenWidth(double.infinity),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 7, 30, 34),
        ),
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 7, 30, 34),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "4 Lokasi Terakhir",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          isShowingMainData
              ? Table(
                  columnWidths: {
                    0: FlexColumnWidth(0.5),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1),
                  },
                  border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Color.fromARGB(255, 248, 250, 241),
                      ),
                      verticalInside: BorderSide(
                        color: Color.fromARGB(255, 248, 250, 241),
                      )),
                  children: [
                    headerTable(),
                    tableContent(
                      1,
                      p0,
                      time0,
                    ),
                    tableContent(
                      2,
                      p1,
                      time1,
                    ),
                    tableContent(
                      3,
                      p2,
                      time2,
                    ),
                    tableContent(
                      4,
                      p3,
                      time3,
                    ),
                  ],
                )
              : CircularProgressIndicator(),
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
              "Nama Tempat ",
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

  TableRow tableContent(int no, String address, String time) {
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
              "$address",
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
