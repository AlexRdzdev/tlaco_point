import 'package:flutter/material.dart';

class RegisterStandName extends StatefulWidget {
  @override
  _RegisterStandNameState createState() => _RegisterStandNameState();
}

class _RegisterStandNameState extends State<RegisterStandName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre'),
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
                Navigator.pushNamed(context, 'StandRegisterDirection');
              },
              child: Text('Siguiente ', style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }

  Widget _NombrePuesto() {
    return null;
  }
}
