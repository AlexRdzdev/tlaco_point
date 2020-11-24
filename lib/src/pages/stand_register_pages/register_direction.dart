import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:tlaco_point/resources/AppColors.dart';
import 'package:tlaco_point/widgets/Maps.dart';

class RegisterStandDirection extends StatefulWidget {
  @override
  _RegisterStandNameDirectionState createState() =>
      _RegisterStandNameDirectionState();
}

class _RegisterStandNameDirectionState extends State<RegisterStandDirection> {
  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      MapTemplate(
        height: 550,
        options: MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(31.660496, -106.421630),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.place,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
