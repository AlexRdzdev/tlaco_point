import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:tlaco_point/models/puesto.dart';

class Gmap extends StatefulWidget {
  final LatLng position;
  Gmap({Key key, @required this.position}) : super(key: key);

  @override
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = new Set<Marker>();

  static CameraPosition initialPosition = CameraPosition(
    target: LatLng(31.657471, -106.429377),
    zoom: 11,
  );

  @override
  void initState() {
    super.initState();
    initialPosition = CameraPosition(
      target: widget.position,
      zoom: 15,
    );
    markers
        .add(Marker(markerId: MarkerId('puesto'), position: widget.position));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialPosition,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      compassEnabled: false,
      rotateGesturesEnabled: false,
      tiltGesturesEnabled: false,
      buildingsEnabled: false,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
