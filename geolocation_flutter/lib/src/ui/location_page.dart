import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _stringPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Localiza aí')),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _buildFloatingActionButton() => AnimatedOpacity(
        opacity: _stringPosition != null ? 1.0 : 0.0,
        curve: Curves.linear,
        duration: Duration(milliseconds: 500),
        child: FloatingActionButton.extended(
          onPressed: _stringPosition != null ? () => setState(() => _stringPosition = null) : null,
          icon: Icon(Icons.delete),
          label: Text('Apagar Localização'),
        ),
      );

  _buildBody() => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _stringPosition != null ? Text("$_stringPosition") : Text('Clique no botão abaixo'),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: FlatButton.icon(
                onPressed: () => _getCurrentLocation(),
                icon: const Icon(Icons.location_on),
                label: const Text('Pega Localização'),
              ),
            ),
          ],
        ),
      );

  _getCurrentLocation() {
    final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager = true;
    _geolocator.checkGeolocationPermissionStatus().then((GeolocationStatus _locationStatus) {
      if (_locationStatus == GeolocationStatus.granted) {
        _geolocator
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
            .then((Position position) {
          setState(() {
            _stringPosition = 'Altitude: ${position.altitude} Longitude: ${position.longitude}';
          });
        }).catchError((e) {
          _stringPosition = e.toString();
        });
      }
    });
  }
}
