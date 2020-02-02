/// LocationInfo
///
/// This widget is shown when user taps on a highlighted 
/// polygon on the map, which means its a valid parking 
/// space/lot. The widget shows further details regarding 
/// the parking space/lot

import 'package:everett_parking/models/polygonList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/location.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo(this.id);

  final int id;

  void _showDesc(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('About'),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Location loc = Provider.of<PolygonList>(context, listen: false).getLoc(id);
    List<bool> showArr = loc.restrictionBoolArr;

    List<String> desc = [
      'Permit required',
      'Disabled parking',
      'Bus zone',
      'Loading zone',
      'Senior center permit required',
      'Official vehicle only',
      'High School permit only',
    ];
    List<Icon> icons = [
      Icon(Icons.assignment),
      Icon(Icons.accessible),
      Icon(Icons.directions_bus),
      Icon(Icons.text_rotation_angledown),
      Icon(Icons.person),
      Icon(Icons.account_balance),
      Icon(Icons.school),
    ];
    List<Widget> restrictions = [];

    for (var i = 0; i < 8; i++) {
      if (showArr[i]) {
        restrictions.add(
          IconButton(
            icon: icons[i],
            onPressed: () => _showDesc(context, desc[i]),
          ),
        );
      }
    }
    // loc.restricton

    return Container(
      color: loc.colorLoc.withAlpha(255), // Color.fromRGBO(55, 103, 163, .9),
      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${loc.typeString.toUpperCase()}',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Number of parking spots: ${loc.numSpots}',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Time limit (minutes): ${loc.timeRestriction == "0" ? 'No Time Limit' : loc.timeRestriction}',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 25,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: restrictions,
          ),
        ],
      ),
    );
  }
}
