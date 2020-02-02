import 'package:badges/badges.dart';
import 'package:everett_parking/models/polygonList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/location.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo(this.id);

  final int id;

  

  void _showDesc(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('About'),
          content: Text('This is where the description will be'),
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

    // List<Widget> restrictions = [];
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
            'Time limit (minutes): ${loc.timeRestriction}',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 25,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.school),
                onPressed: () => _showDesc(context),
              ),
              IconButton(
                icon: Icon(Icons.directions_bus),
                onPressed: () => _showDesc(context),
              ),
              IconButton(
                icon: Icon(Icons.accessible),
                onPressed: () => _showDesc(context),
              ),
              Badge(
                badgeContent: Text('240'),
                child: Container(),
                badgeColor: Colors.grey[500],
              ),
              IconButton(
                icon: Icon(Icons.assignment),
                onPressed: () => _showDesc(context),
              ),
              IconButton(
                icon: Icon(Icons.tram),
                onPressed: () => _showDesc(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
