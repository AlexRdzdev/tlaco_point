import 'package:flutter/material.dart';

class AccessType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/TlacoPoint.jpg'),
            SizedBox(height: 30),
            RaisedButton(
                onPressed: () {},
                child: Text('Acceder', style: TextStyle(fontSize: 20))),
            const SizedBox(height: 30),
            RaisedButton(
                onPressed: () {},
                child: Text('Crear cuenta ', style: TextStyle(fontSize: 20))),
            RaisedButton(
                onPressed: () {},
                child:
                    Text('Registrar Puesto', style: TextStyle(fontSize: 20))),
          ]),
    ));
  }
}
