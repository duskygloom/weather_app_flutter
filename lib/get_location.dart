// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'dart:convert';

// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';


// Comment this class if geolocator is working
// But who needs geolocator :>
class Position {
  final double latitude, longitude;
  const Position.blank()
    : latitude = 37.7825, longitude = -122.411;
  const Position(this.latitude, this.longitude);
}

Future<Position> getPosition() async {
  try {
    final http.Response response = await http.get(Uri.http("ip-api.com", "json"));
    final responseJson = jsonDecode(response.body);
    if (responseJson["status"] == "success")
      return Position(responseJson["lat"], responseJson["lon"]);
    return const Position.blank();
  } catch (e) {
    print(e.toString());
    return const Position.blank();
  }
}

/* Not working :>

Position _emptyLocation = Position(
  longitude: 0, 
  latitude: 0, 
  timestamp: DateTime(2003), 
  accuracy: 0, 
  altitude: 0, 
  heading: 0, 
  speed: 0, 
  speedAccuracy: 0
);

Future<Position> getPosition() async {

  // checking if location turned ond
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (serviceEnabled) {
    debugPrint("Location services not enabled.");
    return Future.value(_emptyLocation);
  }

  // checking if permission granted
  LocationPermission permission = await Geolocator.checkPermission();
  if (!(permission == LocationPermission.always || permission == LocationPermission.whileInUse)) {
    permission = await Geolocator.requestPermission();
    if (!(permission == LocationPermission.always || permission == LocationPermission.whileInUse)) {
      debugPrint("Location permission not granted.");
      return Future.value(_emptyLocation);
    } else {

      // getting location
      var location = Geolocator.getCurrentPosition();
      return Future.value(location);
    }
  } else {

    // getting location
    var location = Geolocator.getCurrentPosition();
    return Future.value(location);
  }
}

*/
