import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/core.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HereMap(
      onMapCreated: onMapCreated,
    );
  }

  Future<void> drawMarker(HereMapController hereMapController, int drawOrder,
      GeoCoordinates geoCoordinates) async {
    ByteData fileData = await rootBundle.load("assets/icons/marker.png");
    Uint8List pixelData = fileData.buffer.asUint8List();
    MapImage mapImage =
        MapImage.withPixelDataAndImageFormat(pixelData, ImageFormat.png);
    MapMarker mapMarker = MapMarker(geoCoordinates, mapImage);
    mapMarker.drawOrder = drawOrder;
    hereMapController.mapScene.addMapMarker(mapMarker);
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

    drawMarker(hereMapController, 0, GeoCoordinates(0.4706872, 101.3561268));

    double distanceInMeter = 800;

    hereMapController.camera.lookAtPointWithDistance(
        GeoCoordinates(0.4706872, 101.3561268), distanceInMeter);
  }
}
