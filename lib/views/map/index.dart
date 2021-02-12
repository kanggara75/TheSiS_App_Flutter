import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';
import 'package:thesis_app/controllers/Map.dart';
import 'package:thesis_app/config/constants.dart';

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
          child: HereMap(
            onMapCreated: onMapCreated,
          ),
        ),
        Align(
          alignment: Alignment(0.87, 0.92),
          child: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.alt_route),
            onPressed: () {
              clear();
            },
          ),
        ),
      ],
    );
  }
}
