import 'package:flutter/material.dart';
import 'package:tlaco_point/resources/AppTheme.dart';

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
                child: Text('Acceder',
                    style: TextStyle(
                        fontSize: 20, color: AppTheme.secondaryDarkColor)),
                splashColor: AppTheme.primaryColor),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              child: Text('Crear cuenta ',
                  style: TextStyle(
                      fontSize: 20, color: AppTheme.secondaryDarkColor)),
              splashColor: AppTheme.primaryColor,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Registrar Puesto',
                  style: TextStyle(
                      fontSize: 20, color: AppTheme.secondaryDarkColor)),
              splashColor: AppTheme.primaryColor,
            ),
          ]),
    ));
  }
}
