import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:thesis_app/views/map/near.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/map/distance.dart';
import 'package:thesis_app/views/map/fullNear.dart';
import 'package:thesis_app/helper/location_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Near10 extends StatelessWidget {
  static String routeName = "/10Place";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Near10Place(),
    );
  }
}

class MapList extends StatelessWidget {
  static String routeName = "/mapList";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Coming Soon...\n\n"),
            Text("Sorry..."),
          ],
        ),
      ),
    );
  }
}

abstract class NearPlaceController extends State<NearPlace> {
  Timer timer;
  List dataAcc;
  bool isShowingData = false;
  var lat0, lat1, lat2, lat3;
  var lon0, lon1, lon2, lon3;
  var time0, time1, time2, time3;
  String p0 = "", p1 = "", p2 = "", p3 = ""; // create this variable

  @override
  void initState() {
    super.initState();
    makeRequest();
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
      lon0 = dataMap['0Lon'];
      lon1 = dataMap['1Lon'];
      lon2 = dataMap['2Lon'];
      lon3 = dataMap['3Lon'];
      time0 = dataMap['0Time'];
      time1 = dataMap['1Time'];
      time2 = dataMap['2Time'];
      time3 = dataMap['3Time'];
      isShowingData = true;
    });
    cekKoor();
  }

  cekKoor() {
    lon0 = lon0 == null ? 0.00 : lon0;
    lon1 = lon1 == null ? 0.00 : lon1;
    lon2 = lon2 == null ? 0.00 : lon2;
    lon3 = lon3 == null ? 0.00 : lon3;
    lat0 = lat0 == null ? 0.00 : lat0;
    lat1 = lat1 == null ? 0.00 : lat1;
    lat2 = lat2 == null ? 0.00 : lat2;
    lat3 = lat3 == null ? 0.00 : lat3;
    getPlace0(lat0, lon0);
    getPlace1(lat1, lon1);
    getPlace2(lat2, lon2);
    getPlace3(lat3, lon3);
  }

  getPlace0(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";
    setState(() {
      p0 = address;
    });
  }

  getPlace1(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";
    setState(() {
      p1 = address;
    });
  }

  getPlace2(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";
    setState(() {
      p2 = address;
    });
  }

  getPlace3(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p3 = address;
    });
  }
}

abstract class DistanceController extends State<MapDistance> {
  LocationService locationService = LocationService();
  var lat, lon, lat0, lon0;
  var distance, e, d, sign;

  @override
  void initState() {
    locationService.locationStream.listen((userLocation) {
      setState(() {
        lat = userLocation.lat;
        lon = userLocation.lon;
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

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      lon = preferences.getDouble("lon");
      lat = preferences.getDouble("lat");
      lon0 = preferences.getDouble("lon0");
      lat0 = preferences.getDouble("lat0");
      getDistanceFromLatLonInKm(lat, lon, lat0, lon0);
      e = d <= 1 ? (d * 1000) : d;
      distance = e.toStringAsFixed(2);
      sign = d <= 1 ? 'Meters' : 'Km';
    });
  }

  getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    d = R * c; // Distance in km

    return d;
  }

  deg2rad(deg) {
    return deg * (22 / 7 / 180);
  }
}

abstract class Near10PlaceController extends State<Near10Place> {
  Timer timer;
  List dataAcc;
  bool isShowingData = false;
  var lat0, lat1, lat2, lat3, lat4, lat5, lat6, lat7, lat8, lat9, lat10, lat11;
  var lon0, lon1, lon2, lon3, lon4, lon5, lon6, lon7, lon8, lon9, lon10, lon11;
  var time0,
      time1,
      time2,
      time3,
      time4,
      time5,
      time6,
      time7,
      time8,
      time9,
      time10,
      time11;
  String p0 = "",
      p1 = "",
      p2 = "",
      p3 = "",
      p4 = "",
      p5 = "",
      p6 = "",
      p7 = "",
      p8 = "",
      p9 = "",
      p10 = "",
      p11 = ""; // create this variable

  @override
  void initState() {
    super.initState();
    makeRequest();
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
      lat5 = dataMap['5Lat'];
      lat6 = dataMap['6Lat'];
      lat7 = dataMap['7Lat'];
      lat8 = dataMap['8Lat'];
      lat9 = dataMap['9Lat'];
      lat10 = dataMap['10Lat'];
      lat11 = dataMap['11Lat'];
      lon0 = dataMap['0Lon'];
      lon1 = dataMap['1Lon'];
      lon2 = dataMap['2Lon'];
      lon3 = dataMap['3Lon'];
      lon4 = dataMap['4Lon'];
      lon5 = dataMap['5Lon'];
      lon6 = dataMap['6Lon'];
      lon7 = dataMap['7Lon'];
      lon8 = dataMap['8Lon'];
      lon9 = dataMap['9Lon'];
      lon10 = dataMap['10Lon'];
      lon11 = dataMap['11Lon'];
      time0 = dataMap['0Time'];
      time1 = dataMap['1Time'];
      time2 = dataMap['2Time'];
      time3 = dataMap['3Time'];
      time4 = dataMap['4Time'];
      time5 = dataMap['5Time'];
      time6 = dataMap['6Time'];
      time7 = dataMap['7Time'];
      time8 = dataMap['8Time'];
      time9 = dataMap['9Time'];
      time10 = dataMap['10Time'];
      time11 = dataMap['11Time'];
      isShowingData = true;
    });
    cekKoor();
  }

  cekKoor() {
    lon0 = lon0 == null ? 0.00 : lon0;
    lon1 = lon1 == null ? 0.00 : lon1;
    lon2 = lon2 == null ? 0.00 : lon2;
    lon3 = lon3 == null ? 0.00 : lon3;
    lon4 = lon4 == null ? 0.00 : lon4;
    lon5 = lon5 == null ? 0.00 : lon5;
    lon6 = lon6 == null ? 0.00 : lon6;
    lon7 = lon7 == null ? 0.00 : lon7;
    lon8 = lon8 == null ? 0.00 : lon8;
    lon9 = lon9 == null ? 0.00 : lon9;
    lon10 = lon10 == null ? 0.00 : lon10;
    lon11 = lon11 == null ? 0.00 : lon11;
    lat0 = lat0 == null ? 0.00 : lat0;
    lat1 = lat1 == null ? 0.00 : lat1;
    lat2 = lat2 == null ? 0.00 : lat2;
    lat3 = lat3 == null ? 0.00 : lat3;
    lat4 = lat4 == null ? 0.00 : lat4;
    lat5 = lat5 == null ? 0.00 : lat5;
    lat6 = lat6 == null ? 0.00 : lat6;
    lat7 = lat7 == null ? 0.00 : lat7;
    lat8 = lat8 == null ? 0.00 : lat8;
    lat9 = lat9 == null ? 0.00 : lat9;
    lat10 = lat10 == null ? 0.00 : lat10;
    lat11 = lat11 == null ? 0.00 : lat11;
    getPlace0(lat0, lon0);
    getPlace1(lat1, lon1);
    getPlace2(lat2, lon2);
    getPlace3(lat3, lon3);
    getPlace4(lat4, lon4);
    getPlace5(lat5, lon5);
    getPlace6(lat6, lon6);
    getPlace7(lat7, lon7);
    getPlace8(lat8, lon8);
    getPlace9(lat9, lon9);
    getPlace10(lat10, lon10);
    getPlace11(lat11, lon11);
  }

  getPlace0(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p0 = address;
    });
  }

  getPlace1(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p1 = address;
    });
  }

  getPlace2(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p2 = address;
    });
  }

  getPlace3(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p3 = address;
    });
  }

  getPlace4(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p4 = address;
    });
  }

  getPlace5(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p5 = address;
    });
  }

  getPlace6(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p6 = address;
    });
  }

  getPlace7(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p7 = address;
    });
  }

  getPlace8(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p8 = address;
    });
  }

  getPlace9(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p9 = address;
    });
  }

  getPlace10(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p10 = address;
    });
  }

  getPlace11(lat, lon) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String address =
        "$name, $subLocality, $locality, $administrativeArea, $postalCode";

    setState(() {
      p11 = address;
    });
  }
}
