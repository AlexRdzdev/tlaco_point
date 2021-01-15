import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatefulWidget {
  Gmap({Key key}) : super(key: key);

  @override
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition initialPosition = CameraPosition(
    target: LatLng(31.657471, -106.429377),
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
