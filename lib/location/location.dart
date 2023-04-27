import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class ListenLocationWidget extends StatefulWidget {
  const ListenLocationWidget({Key? key}) : super(key: key);

  @override
  State<ListenLocationWidget> createState() => _ListenLocationState();
}

class _ListenLocationState extends State<ListenLocationWidget> {
  final Location location = Location();

  LocationData? _location;
  StreamSubscription<LocationData>? _locationSubscription;
  String? _error;

  @override
  void initState() {
    super.initState();
    _listenLocation();
  }

  Future<void> _listenLocation() async {
    _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
      setState(() {
        _error = err.code;
      });
      _locationSubscription?.cancel();
    }).listen((LocationData currentLocation) {
      setState(() {
        _error = null;
        _location = currentLocation;
      });
    });
  }

  Future<void> _stopListen() async {
    _locationSubscription?.cancel();
  }

  Widget _calculateSpeedBetweenLocations() {
    // Check if location is null
    if (_location == null) return const Text("Hold on!");
    return Text(
      '${_location?.speed != null && _location!.speed! * 3600 / 1000 > 0 ? (_location!.speed! * 3600 / 1000).toStringAsFixed(2) : 0} KM/h',
      style: TextStyle(
        color: Colors.lightGreen[500],
        fontSize: 20,
        letterSpacing: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _calculateSpeedBetweenLocations(),
      ],
    );
  }
}
