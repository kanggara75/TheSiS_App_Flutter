import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/routing.dart';
import 'package:http/http.dart' as http;
import 'package:thesis_app/views/map/index.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/views/map/counter.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/map/lastCoor.dart';
import 'package:thesis_app/helper/location_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapScreen extends StatelessWidget {
  static String routeName = "/mappage";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MapPage(),
    );
  }
}

class MapCount extends StatelessWidget {
  static String routeName = "/mapcount";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MapCounter(),
    );
  }
}

abstract class MapController extends State<MapPage> {
  LocationService locationService = LocationService();
  HereMapController _controller;
  MapPolyline _mapPolyline;
  var lat, lon, lon0, lat0;

  @override
  void initState() {
    locationService.locationStream.listen((userLocation) {
      setState(() {
        lat = userLocation.lat;
        lon = userLocation.lon;
        makeRequest();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    locationService.dispose();
    _controller?.finalize();
    super.dispose();
  }

  makeRequest() async {
    var response = await http.get(
      BaseUrl.maplist,
      headers: {'Accept': 'application/json'},
    );
    final dataMap = json.decode(response.body);
    setState(() {
      lat0 = dataMap['0Lat'];
      lon0 = dataMap['0Lon'];
    });
  }

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
      GeoCoordinates(lat0, lon0),
      hereMapController,
    );

    drawMarker(
      hereMapController,
      0,
      GeoCoordinates(lat, lon),
    );

    drawMarker0(
      hereMapController,
      0,
      GeoCoordinates(lat0, lon0),
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
      "assets/icons/Location.png",
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

  Future<void> drawMarker0(
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
    } else {
      _controller.mapScene.addMapPolyline(_mapPolyline);
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

abstract class CounterMapController extends State<MapCounter> {
  var mapcount;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      mapcount = preferences.getInt("mapcount");
      mapcount = mapcount == null ? 0 : mapcount;
    });
  }
}

abstract class LastCoordController extends State<LastCoordinat> {
  var lat0,
      lat1,
      lat2,
      lat3,
      lat4,
      lon0,
      lon1,
      lon2,
      lon3,
      lon4,
      time0,
      time1,
      time2,
      time3,
      time4;
  bool isShowingMainData;
  List dataAcc;
  Timer timer;

  @override
  void initState() {
    super.initState();
    makeRequest();
    isShowingMainData = false;
    timer = new Timer.periodic(
      new Duration(seconds: 30),
      (t) => makeRequest(),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  makeRequest() async {
    var response = await http.get(
      BaseUrl.maplist,
      headers: {'Accept': 'application/json'},
    );
    final dataMap = json.decode(response.body);
    setState(() {
      lat0 = dataMap['0Lat'];
      lat1 = dataMap['1Lat'];
      lat2 = dataMap['2Lat'];
      lat3 = dataMap['3Lat'];
      lat4 = dataMap['4Lat'];
      lon0 = dataMap['0Lon'];
      lon1 = dataMap['1Lon'];
      lon2 = dataMap['2Lon'];
      lon3 = dataMap['3Lon'];
      lon4 = dataMap['4Lon'];
      time0 = dataMap['0Time'];
      time1 = dataMap['1Time'];
      time2 = dataMap['2Time'];
      time3 = dataMap['3Time'];
      time4 = dataMap['4Time'];
      isShowingMainData = true;
      savePref(lon0, lat0);
    });
  }

  savePref(lon, lat) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setDouble("lon0", lon);
      preferences.setDouble("lat0", lat);
    });
  }
}
