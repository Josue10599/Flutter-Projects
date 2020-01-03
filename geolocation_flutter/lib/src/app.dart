import 'package:flutter/material.dart';
import 'package:geolocation_flutter/src/ui/location_page.dart';

class GeoLocationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoLocationApp',
      home: LocationPage(),
    );
  }
}
