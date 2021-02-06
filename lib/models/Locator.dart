import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thesis_app/helper/location_services.dart';
import 'package:thesis_app/views/map/distance.dart';
import 'package:thesis_app/views/map/near.dart';
import 'package:thesis_app/config/constants.dart';

abstract class NearPlaceController extends State<NearPlace> {
  Timer timer;
  List dataAcc;
  bool isShowingMainData;
  var lat0, lat1, lat2, lat3;
  var lon0, lon1, lon2, lon3;
  var time0, time1, time2, time3;
  String p0 = "", p1 = "", p2 = "", p3 = ""; // create this variable

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
      lon0 = dataMap['0Lon'];
      lon1 = dataMap['1Lon'];
      lon2 = dataMap['2Lon'];
      lon3 = dataMap['3Lon'];
      time0 = dataMap['0Time'];
      time1 = dataMap['1Time'];
      time2 = dataMap['2Time'];
      time3 = dataMap['3Time'];
      isShowingMainData = true;
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

    print(address);
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

    print(address);
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

    print(address);
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

    print(address);
    setState(() {
      p3 = address;
    });
  }
}

abstract class DistanceController extends State<MapDistance> {
  LocationService locationService = LocationService();
  double lat, lon, lat0, lon0;
  var distance, e, d, sign;

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
        lon0 = preferences.getDouble("lon0");
        lat0 = preferences.getDouble("lat0");
        getDistanceFromLatLonInKm(lat, lon, lat0, lon0);

        e = d <= 1 ? (d * 1000) : d;
        print(e);
        distance = e.toStringAsFixed(2);

        sign = d <= 1 ? 'Meters' : 'Km';
        print(sign);
      },
    );
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
