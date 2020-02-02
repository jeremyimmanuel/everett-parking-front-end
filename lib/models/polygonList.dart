import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import './location.dart';

/// PolygonList
/// 
/// A class that holds all available parking
/// spaces/lots
/// TODO: rename PolygonList to LocationList
class PolygonList with ChangeNotifier {
  // The location list that holds the data
  List<Location> _poly = [];

  // Public getter
  List<Location> get poly => [..._poly];

  // Get specific Location object based on its id
  Location getLoc(int id) {  
    return _poly.firstWhere((l) => id == l.id);
  }
  
  // Fetches data form API
  // TODO: should change url according to server's ip address
  Future<void> getData() async {
    final String url = 'http://10.156.2.88:5000/data/parkinglot';

    final response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data);
    for (var location in data) {
      
      List<LatLng> coords = [];
      for (var m in location['coords']) {
        double lat = m['latitude'] as double;
        double lng = m['longitude'] as double;
        // print(lat);
        // print(lng);
        // print(m.runtimeType);
        coords.add(LatLng(lat, lng));
      }

      Location l = Location(
        coords: coords,
        type: location['type'],
        numSpots: location['num_spots'],
        id: location['id'],
        timeRestriction: location['time_restriction'],
        restrictions: location['restriction'],
        // polygonId: location['lot_name'],
      );

      _poly.add(l);
    }

    notifyListeners();
  }
}
