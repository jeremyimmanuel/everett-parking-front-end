import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import './models/polygonList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;

  // var _isInit = true;

  final LatLng _center = const LatLng(47.976501, -122.210697);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<PolygonList>(context, listen: false).getData();
    });
    super.initState();
  }

  // Color _getTypeColor(String type) {
  //   switch (type) {
  //     case :
  //       return 
  //       break;
  //     default:
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final pl = Provider.of<PolygonList>(context, listen: false).poly;

    final polygons = pl.map((l) => Polygon(
          polygonId: PolygonId(l.polygonId),
          points: l.coords,
          fillColor: Colors.blue.withOpacity(0.1),
          
        ));

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 14.1,
      ),
      cameraTargetBounds: CameraTargetBounds(
        LatLngBounds(
            northeast: LatLng(47.986925, -122.185208),
            southwest: LatLng(47.969480, -122.220290)),
      ),
      polygons: polygons.toSet(),
    );
  }
}
