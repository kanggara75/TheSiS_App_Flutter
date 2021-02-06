import 'package:flutter/material.dart';
import 'package:thesis_app/models/Locator.dart';
import 'package:thesis_app/config/size_config.dart';

class Near10Place extends StatefulWidget {
  @override
  _Near10PlaceState createState() => _Near10PlaceState();
}

class _Near10PlaceState extends Near10PlaceController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(double.infinity),
      width: getProportionateScreenWidth(double.infinity),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 7, 30, 34),
        ),
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 7, 30, 34),
      ),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "12 Lokasi Terakhir",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              isShowingData
                  ? Table(
                      columnWidths: {
                        0: FlexColumnWidth(0.5),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(1),
                      },
                      border: TableBorder(
                        top: BorderSide(
                          color: Color.fromARGB(255, 248, 250, 241),
                        ),
                        right: BorderSide(
                          color: Color.fromARGB(255, 248, 250, 241),
                        ),
                        left: BorderSide(
                          color: Color.fromARGB(255, 248, 250, 241),
                        ),
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 248, 250, 241),
                        ),
                        horizontalInside: BorderSide(
                          color: Color.fromARGB(255, 248, 250, 241),
                        ),
                        verticalInside: BorderSide(
                          color: Color.fromARGB(255, 248, 250, 241),
                        ),
                      ),
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
                        tableContent(
                          5,
                          p4,
                          time4,
                        ),
                        tableContent(
                          6,
                          p5,
                          time5,
                        ),
                        tableContent(
                          7,
                          p6,
                          time6,
                        ),
                        tableContent(
                          8,
                          p7,
                          time7,
                        ),
                        tableContent(
                          9,
                          p8,
                          time8,
                        ),
                        tableContent(
                          10,
                          p9,
                          time9,
                        ),
                        tableContent(
                          11,
                          p10,
                          time10,
                        ),
                        tableContent(
                          12,
                          p11,
                          time11,
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
