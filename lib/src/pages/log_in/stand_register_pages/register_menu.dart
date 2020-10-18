import 'package:flutter/material.dart';

class RegisterStandMenu extends StatefulWidget {
  @override
  _RegisterStandNameMenu createState() => _RegisterStandNameMenu();
}

class _RegisterStandNameMenu extends State<RegisterStandMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
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
                Navigator.pushNamed(context, 'StandRegisterPhoto');
              },
              child: Text('Siguiente ', style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
