import 'package:flutter/material.dart';

import 'package:tlaco_point/src/pages/stand_register_pages/register_direction.dart';
import 'package:tlaco_point/src/pages/stand_register_pages/register_names.dart';
import 'package:tlaco_point/src/pages/stand_register_pages/register_owner.dart';

class SignUpStand extends StatefulWidget {
  _SignUpStandState createState() => _SignUpStandState();
}

class _SignUpStandState extends State<SignUpStand> {
  ButtonStyle _buttonStyle =
      ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)));
  int _registerStandSelectedStep = 0;
  static List<Widget> _registerStandSteps = <Widget>[
    RegisterOwner(),
    RegisterStandName(),
    RegisterStandDirection()
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Puesto'),
      ),
      body: Center(
        child: _registerStandSteps.elementAt(_registerStandSelectedStep),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        alignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _backButton(),
          _nextButton(),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Visibility(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              _registerStandSelectedStep--;
            });
          },
          style: _buttonStyle,
          child: Text('Regresar', style: TextStyle(fontSize: 20))),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: _registerStandSelectedStep != 0,
    );
  }

  Widget _nextButton() {
    return Visibility(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              _registerStandSelectedStep++;
            });
          },
          style: _buttonStyle,
          child: Text('Siguiente', style: TextStyle(fontSize: 20))),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: _registerStandSelectedStep != _registerStandSteps.length - 1,
    );
  }
}
