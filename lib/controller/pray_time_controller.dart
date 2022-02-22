import 'dart:convert';

import 'package:pray_times_api/model/pray_times_model.dart';
import 'package:http/http.dart' as http;

Future<Data> fetchAlbum() async {
  String city = 'Damas';
  String country = 'Syrie';
  int method = 4;
  final response = await http.get(Uri.parse(
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method'));

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