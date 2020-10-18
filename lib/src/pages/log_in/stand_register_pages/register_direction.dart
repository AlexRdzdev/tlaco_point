import 'package:flutter/material.dart';

class RegisterStandDirection extends StatefulWidget {
  @override
  _RegisterStandNameDirection createState() => _RegisterStandNameDirection();
}

class _RegisterStandNameDirection extends State<RegisterStandDirection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dirección'),
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
                Navigator.pushNamed(context, 'StandRegisterSchedule');
              },
              child: Text('Siguiente ', style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
