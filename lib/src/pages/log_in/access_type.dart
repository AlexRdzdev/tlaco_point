import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/log_in/log_inn.dart';

class AccessType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/TlacoPoint.png',
            width: 300.0,
            height: 250.0,
            alignment: Alignment.center,
          ),
        ),
        const SizedBox(height: 30),
        RaisedButton(
            onPressed: () {
              final route = MaterialPageRoute(builder: (context) => Loginn());

              Navigator.push(context, route);
            },
            child: Text(
              'Acceder',
              style: TextStyle(fontSize: 20),
            )),
        const SizedBox(height: 30),
        RaisedButton(
            onPressed: () {},
            child: Text('Crear cuenta ', style: TextStyle(fontSize: 20))),
        const SizedBox(height: 70),
        const Text.rich(TextSpan(
            text: 'Tienes un puesto? Registralo',
            style: TextStyle(fontWeight: FontWeight.bold))),
        const SizedBox(height: 20),
        RaisedButton(
            onPressed: () {},
            child: Text('Registrar Puesto', style: TextStyle(fontSize: 20))),
      ]),
    ));
  }
}

//Image.asset(
//              'assets/TlacoPoint.png',
//            scale: 10.0,
//        ),
