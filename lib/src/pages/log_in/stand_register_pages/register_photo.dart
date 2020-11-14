import 'package:flutter/material.dart';

class RegisterStandPhoto extends StatefulWidget {
  @override
  _RegisterStandNamePhoto createState() => _RegisterStandNamePhoto();
}

class _RegisterStandNamePhoto extends State<RegisterStandPhoto> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[Text('Photo')]);
  }
}
