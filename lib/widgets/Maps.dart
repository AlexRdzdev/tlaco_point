import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapTemplate extends StatefulWidget {
  final double height;
  final double width;
  final MarkerLayerOptions options;

  const MapTemplate({Key key, this.height = 550, this.width, this.options})
      : super(key: key);

  @override
  _MapTemplateState createState() => _MapTemplateState();
}

class _MapTemplateState extends State<MapTemplate> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          child: FlutterMap(
            options: MapOptions(
              center: new LatLng(31.660496, -106.421630),
              zoom: 13.0,
            ),
            layers: [
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    builder: (ctx) => Container(
                      child: Icon(Icons.place),
                    ),
                  ),
                ],
              ),
            ],
            children: <Widget>[
              TileLayerWidget(
                  options: TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'])),
              MarkerLayerWidget(options: widget.options),
            ],
          ),
        ),
        Container(
          height: widget.height,
          width: widget.width,
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.my_location),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
          ),
        )
      ],
    );
  }
}
