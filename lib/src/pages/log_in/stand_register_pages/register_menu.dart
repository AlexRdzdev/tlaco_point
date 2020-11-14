import 'package:flutter/material.dart';

class RegisterStandMenu extends StatefulWidget {
  @override
  _RegisterStandNameMenu createState() => _RegisterStandNameMenu();
}

class _RegisterStandNameMenu extends State<RegisterStandMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[Text('Menu')]);
  }
}
