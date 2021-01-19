import 'dart:typed_data';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/routing.dart';
import 'package:thesis_app/views/map/index.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/helper/location_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapScreen extends StatelessWidget {
  static String routeName = "/dashboard";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MapPage(),
    );
  }
}

abstract class MapController extends State<MapPage> {
  LocationService locationService = LocationService();
  double lat, lon;

  @override
  void initState() {
    locationService.locationStream.listen((userLocation) {
      setState(() {
        lat = userLocation.lat;
        lon = userLocation.lon;
        savePref(lon, lat);
      });
    });
    super.initState();
    getPref();
  }

  @override
  void dispose() {
    locationService.dispose();
    _controller?.finalize();
    super.dispose();
  }

  savePref(lon, lat) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setDouble("lon", lon);
      preferences.setDouble("lat", lat);
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(
      () {
        lon = preferences.getDouble("lon");
        lat = preferences.getDouble("lat");
      },
    );
  }

  MapPolyline _mapPolyline;
  HereMapController _controller;

  void onMapCreated(HereMapController hereMapController) {
    _controller = hereMapController;

    hereMapController.mapScene.loadSceneForMapScheme(
      MapScheme.hybridDay,
      (error) {
        if (error != null) {
          print("Error" + error.toString());
          return;
        }
      },
    );

    drawRoute(
      GeoCoordinates(lat, lon),
      GeoCoordinates(0.4705807, 101.3623994),
      hereMapController,
    );

    drawMarker(
      hereMapController,
      0,
      GeoCoordinates(lat, lon),
    );

    double distanceInMeter = 800;

    hereMapController.camera.lookAtPointWithDistance(
      GeoCoordinates(lat, lon),
      distanceInMeter,
    );
  }

  Future<void> drawMarker(
    HereMapController hereMapController,
    int drawOrder,
    GeoCoordinates geoCoordinates,
  ) async {
    ByteData fileData = await rootBundle.load(
      "assets/icons/marker.png",
    );
    Uint8List pixelData = fileData.buffer.asUint8List();
    MapImage mapImage = MapImage.withPixelDataAndImageFormat(
      pixelData,
      ImageFormat.png,
    );
    MapMarker mapMarker = MapMarker(
      geoCoordinates,
      mapImage,
    );
    mapMarker.drawOrder = drawOrder;
    hereMapController.mapScene.addMapMarker(
      mapMarker,
    );
  }

  clear() {
    if (_mapPolyline != null) {
      _controller.mapScene.removeMapPolyline(_mapPolyline);
      _mapPolyline = null;
    }
  }

  Future<void> drawRoute(
    GeoCoordinates start,
    GeoCoordinates end,
    HereMapController hereMapController,
  ) async {
    RoutingEngine routingEngine = RoutingEngine();
    Waypoint startWayPoint = Waypoint.withDefaults(start);
    Waypoint endWayPoint = Waypoint.withDefaults(end);

    List<Waypoint> wayPoints = [
      startWayPoint,
      endWayPoint,
    ];

    routingEngine.calculateCarRoute(
      wayPoints,
      CarOptions.withDefaults(),
      (routingError, routes) {
        if (routingError == null) {
          var route = routes.first;

          GeoPolyline routeGeoPolyline = GeoPolyline(route.polyline);
          double depth = 20;
          _mapPolyline = MapPolyline(
            routeGeoPolyline,
            depth,
            Colors.red,
          );
          hereMapController.mapScene.addMapPolyline(_mapPolyline);
        } else {
          print("\n\n===================================\n\n");
          print(routingError);
          print("\n\n===================================\n\n");
        }
      },
    );
  }
}

abstract class UserLocationNowController extends State<UserLocationNow> {
  LocationService locationService = LocationService();
  double lat, lon;

  @override
  void initState() {
    locationService.locationStream.listen((userLocation) {
      setState(() {
        lat = userLocation.lat;
        lon = userLocation.lon;
        savePref(lon, lat);
      });
    });
    super.initState();
    getPref();
  }

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  savePref(lon, lat) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setDouble("lon", lon);
      preferences.setDouble("lat", lat);
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(
      () {
        lon = preferences.getDouble("lon");
        lat = preferences.getDouble("lat");
      },
    );
  }
}
