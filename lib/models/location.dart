import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  Location({
    this.coords,
    this.type,
    this.numSpots,
    this.id,
    this.polygonId,
  });

  final List<LatLng> coords;
  final String type;
  final int numSpots;
  final int id;
  final String polygonId;
}
