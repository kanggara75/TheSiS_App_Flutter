import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';
import 'package:thesis_app/controllers/Map.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends MapController {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: HereMap(onMapCreated: onMapCreated),
        ),
        Align(
          alignment: Alignment(0.87, 0.92),
          child: FloatingActionButton(
            backgroundColor: Colors.amber,
            child: Icon(Icons.alt_route),
            onPressed: () {
              clear();
            },
          ),
        )
      ],
    );
  }
}

class UserLocationNow extends StatefulWidget {
  @override
  _UserLocationNowState createState() => _UserLocationNowState();
}

class _UserLocationNowState extends UserLocationNowController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("User Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Longitude"),
            Text(
              '$lon , $lon0',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Latitude"),
            Text(
              '$lat , $lat0',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Distance"),
            Text(
              '$distance $sign',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
