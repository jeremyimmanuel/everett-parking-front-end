import 'package:everett_parking/widgets/locationInfo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../models/polygonList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;

  var _isLoading = true;

  final LatLng _center = const LatLng(47.980802, -122.213511);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<PolygonList>(context, listen: false).getData();
    }).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  void _showInfo(BuildContext context, int id) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return GestureDetector(
          onTap: () {},
          child: LocationInfo(id),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pl = Provider.of<PolygonList>(context).poly;

    final polygons = pl.map((l) => Polygon(
          polygonId: PolygonId(l.id.toString()),
          points: l.coords,
          fillColor: l.colorLoc.withOpacity(0.5),
          strokeWidth: 2,
          strokeColor: Colors.grey[900],
          onTap: () {
            _showInfo(context, l.id);
            },
          consumeTapEvents: true,
        ));

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.5,
            ),
            cameraTargetBounds: CameraTargetBounds(
              LatLngBounds(
                  northeast: LatLng(47.986925, -122.185208),
                  southwest: LatLng(47.969480, -122.220290)),
            ),
            polygons: polygons.toSet(),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          );
  }
}
