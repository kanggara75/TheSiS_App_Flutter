import 'package:flutter/material.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/models/Locator.dart';

class MapDistance extends StatefulWidget {
  @override
  _MapDistanceState createState() => _MapDistanceState();
}

class _MapDistanceState extends DistanceController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: getProportionateScreenWidth(150),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(2, 2, 2, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 253, 255, 182)),
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(255, 253, 255, 182),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Jarak Dengan Kendaraan\n",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              "$distance",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\n$sign",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
