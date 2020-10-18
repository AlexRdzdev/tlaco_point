import 'package:flutter/material.dart';

class RegisterStandPhoto extends StatefulWidget {
  @override
  _RegisterStandNamePhoto createState() => _RegisterStandNamePhoto();
}

class _RegisterStandNamePhoto extends State<RegisterStandPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotos'),
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
                Navigator.pushReplacementNamed(context, 'Loading');
              },
              child: Text('Siguiente ', style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
