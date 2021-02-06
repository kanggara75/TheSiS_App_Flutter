import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Map.dart';

class MapCounter extends StatefulWidget {
  @override
  _MapCounterState createState() => _MapCounterState();
}

class _MapCounterState extends CounterMapController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: getProportionateScreenWidth(150),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(2, 2, 2, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 255, 214, 165)),
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(255, 255, 214, 165),
      ),
      child: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Jumlah Lokasi Tersimpan\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "$mapcount",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\nKoordinat",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
