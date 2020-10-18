import 'package:flutter/material.dart';

class RegisterStandSchedule extends StatefulWidget {
  @override
  _RegisterStandNameSchedule createState() => _RegisterStandNameSchedule();
}

class _RegisterStandNameSchedule extends State<RegisterStandSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horario'),
      ),
      floatingActionButton: ButtonBar(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar ', style: TextStyle(fontSize: 20))),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'StandRegisterMenu');
              },
              child: Text('Siguiente ', style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
