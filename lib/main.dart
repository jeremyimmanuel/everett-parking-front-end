import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/home.dart';
import './models/polygonList.dart';
import './utils/everettParkingTheme.dart';

void main() => runApp(EverettParking());

/// EveretParking
///
/// Main app widget
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
        theme: everettParkingTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Everett Parking Map'),
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}
