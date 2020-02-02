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

  Color _getTypeColor(String type) {
    switch (type) {
      case 'private lot':
        return Color.fromARGB(255, 235, 210, 148);
        break;
      case 'public lot':
        return Color.fromARGB(255, 125, 224, 224);
        break;
      case 'private garage':
        return Colors.green;
        break;
      case 'everpark parking garage':
        return Colors.yellow;
        break;
      case 'trinity lutheran (port gardner)':
        return Color.fromARGB(255, 248, 209, 177);
        break;
      case 'snohomosish co. ':
        return Colors.purple;
        break;
      default:
        return Colors.black;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pl = Provider.of<PolygonList>(context).poly;

    final polygons = pl.map((l) => Polygon(
          polygonId: PolygonId(l.id.toString()),
          points: l.coords,
          fillColor: Colors.blue.withOpacity(0.1),
        ));


    // FIXME get rid of these print statements
    print('in homepage build');
    print(polygons);

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GoogleMap(
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
