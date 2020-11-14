import 'package:flutter/material.dart';
import 'package:tlaco_point/db/Connection.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_direction.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_menu.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_names.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_photo.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_schedule.dart';

class SignUpStand extends StatefulWidget {
  _SignUpStandState createState() => _SignUpStandState();
}

class _SignUpStandState extends State<SignUpStand> {
  String resultado = 'vacio';
  ButtonStyle _buttonStyle =
      ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)));
  int _registerStandSelectedStep = 0;
  static List<Widget> _registerStandSteps = <Widget>[
    RegisterStandName(),
    RegisterStandDirection(),
    RegisterStandSchedule(),
    RegisterStandMenu(),
    RegisterStandPhoto()
  ];

  void initState() {
    super.initState();
    probarconection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Puesto'),
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
          child: Text(resultado, style: TextStyle(fontSize: 20))),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: _registerStandSelectedStep != _registerStandSteps.length - 1,
    );
  }

  probarconection() async {
    var conn = await ConnectionProvider.getConnection();
    String sql = 'SELECT NOMBRE FROM TP_USUARIOS WHERE EMAIL = @EMAIL';
    List<List<dynamic>> results = await conn
        .query(sql, substitutionValues: {"EMAIL": 'alejandro.rdz10@gmail.com'});
    for (final row in results) {
      setState(() {
        var a = row[0];
        resultado = a;
      });
    }
  }
}
