import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Location object
/// 
/// JSON seriealizer for this project's API
class Location {
  Location({
    this.coords,
    this.type,
    this.numSpots,
    this.id,
    this.timeRestriction,
    // this.polygonId,
  });

  // A list of LatLng objects of the location's bounding points
  final List<LatLng> coords;

  // The type of parking space the location has
  final int type;

  // The number of parking spots the location has
  final int numSpots;

  // The unique id of the location, 
  // should be used for the String value for PolygonId when drawing polygon
  final int id;

  // String representation of time restriction
  final String timeRestriction;

  // Get the String representation of the type of parking location
  String get typeString {
    int count = 0;
    while(count < 8){
      if(type & (1 << count) == 0)
        count++;
      else{
        switch (count) {
          case 0:
            return 'Public Lot';
            break;
          case 1:
            return 'Private Lot';
            break;
          case 2:
            return 'Private Garage';
            break;
          case 3:
            return 'Everpark Parking Garage';
            break;
          case 4:
            return 'Trinity Lutheran (Port Gardner)';
          case 5:
            return 'Snohomosish Co.';
            break;
          case 6:
            return 'On street parking';
            break;
          default:
            return 'Other';
        }
      }
    }
    return 'None';
  }

  // Get color based on location type
  Color get colorLoc {
    switch (typeString) {
      case 'Private Lot':
        return Color.fromARGB(255, 235, 210, 148);
        break;
      case 'Public Lot':
        return Color.fromARGB(255, 125, 224, 224);
        break;
      case 'Private Garage':
        return Colors.green;
        break;
      case 'Everpark Parking Garage':
        return Colors.yellow;
        break;
      case 'Trinity Lutheran (Port Gardner)':
        return Color.fromARGB(255, 248, 209, 177);
        break;
      case 'Snohomosish Co. ':
        return Colors.purple;
        break;
      default:
        return Colors.black;
        break;
    }
  }
}
