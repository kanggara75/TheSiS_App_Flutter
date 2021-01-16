import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/core.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HereMap(
      onMapCreated: onMapCreated,
    );
  }

  void onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(
      MapScheme.normalDay,
      (error) {
        if (error != null) {
          print("Error" + error.toString());
          return;
        }
      },
    );

    double distanceInMeter = 800;

    hereMapController.camera.lookAtPointWithDistance(
        GeoCoordinates(0.4706872, 101.3561268), distanceInMeter);
  }
}
