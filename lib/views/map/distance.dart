import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/controllers/Map.dart';

class MapDistance extends StatefulWidget {
  @override
  _MapDistanceState createState() => _MapDistanceState();
}

class _MapDistanceState extends DistanceMapController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: getProportionateScreenWidth(150),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(2, 2, 2, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade400),
        borderRadius: BorderRadius.circular(5),
        color: Colors.greenAccent,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Jarak Dengan Kendaraan\n", //TODO Maksimal 1000
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              "$mapcount", //TODO Maksimal 1000
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Meters",
              style: TextStyle(
                color: Colors.black,
                // fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}