import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:pray_times_api/model/pray_times_model.dart';
import 'package:http/http.dart' as http;

Future<Data> fetchAlbum() async {
  double pLat;
  double pLong;
  final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium);

  pLat = position.latitude;
  pLong = position.longitude;

  String date = DateTime.now().toIso8601String();
  int method = 4;

    
  final response = await http.get(Uri.parse(
      "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Data.fromJson(json.decode(response.body));
  
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


