import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  GoogleMapController? _mapController;
  final Location _location = Location();
  LatLng _currentLocation = const LatLng(0, 0);
  final List<LatLng> _polylineCoordinates = [];
  final Set<Polyline> _polyLines = {};
  Marker _marker = const Marker(markerId: MarkerId('current_location'));
  bool isDrawingPermission = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() {
    _location.onLocationChanged.listen((LocationData newLocation) {
      _currentLocation = LatLng(newLocation.latitude!, newLocation.longitude!);
      if (isDrawingPermission) {
        _updatePolyline();
      }
      _updateMarker();
      setState(() {});
    });
    _startLocationUpdates();
  }

  void _startLocationUpdates() async {
    if (await _location.serviceEnabled()) {
      _location.changeSettings(interval: 10000);
      _location.enableBackgroundMode(enable: true);
    } else {
      bool serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  void _updatePolyline() {
    _polylineCoordinates.add(_currentLocation);
    _polyLines.add(Polyline(
      polylineId: const PolylineId('tracking_polyline'),
      points: _polylineCoordinates,
      color: Colors.blue,
      width: 5,
    ));
  }

  void _updateMarker() {
    _marker = Marker(
      markerId: const MarkerId('current_location'),
      position: _currentLocation,
      infoWindow: InfoWindow(
        title: 'My current location',
        snippet:
        'Lat: ${_currentLocation.latitude}, Lng: ${_currentLocation.longitude}',
      ),
      onTap: () {
        _mapController!
            .showMarkerInfoWindow(const MarkerId('current_location'));
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController!.animateCamera(CameraUpdate.newLatLng(_currentLocation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Location Tracker'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
        CameraPosition(target: _currentLocation, zoom: 15),
        markers: {_marker},
        polylines: _polyLines,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
      ),

    );
  }
}