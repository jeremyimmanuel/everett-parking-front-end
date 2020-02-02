import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home.dart';
import './models/polygonList.dart';

void main() => runApp(EverettParking());

class EverettParking extends StatefulWidget {
  @override
  _EverettParkingState createState() => _EverettParkingState();
}

class _EverettParkingState extends State<EverettParking> {
    
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PolygonList()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Maps Sample App'),
            backgroundColor: Colors.green[700],
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}
