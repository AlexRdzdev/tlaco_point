import 'package:flutter/material.dart';

class RegisterStandSchedule extends StatefulWidget {
  @override
  _RegisterStandNameSchedule createState() => _RegisterStandNameSchedule();
}

class _RegisterStandNameSchedule extends State<RegisterStandSchedule> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[Text('Schedule')]);
  }
}
