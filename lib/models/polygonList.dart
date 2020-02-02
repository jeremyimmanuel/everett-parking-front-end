import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import './location.dart';

class PolygonList with ChangeNotifier {
  List<Location> _poly = [];

  List<Location> get poly => [..._poly];

  Future<void> getData() async {
    final String url = 'http://172.21.27.142:5000/data/parkinglot';

    final response = await http.get(url);
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    // print()
    for (var location in data['locations']) {
      
      List<LatLng> coords = [];
      for (var m in location['coords']) {
        double lat = m['latitude'] as double;
        double lng = m['longitude'] as double;
        print(lat);
        print(lng);
        print(m.runtimeType);
        coords.add(LatLng(lat, lng));
      }

      // List<Map<String, double>> loadedCoords = location['coords'] as List<Map<String, double>>;
      // List<LatLng> coords = loadedCoords.map((ll) => LatLng(
      //       ll['latitude'],
      //       ll['longitude'],
      //     )).toList();

      Location l = Location(
        coords: coords,
        type: location['type'],
        numSpots: location['num_spots'],
        id: location['id'],
        polygonId: location['polygon_id'],
      );

      _poly.add(l);
    }

    notifyListeners();
  }
}
