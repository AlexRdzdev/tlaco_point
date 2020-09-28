import 'package:flutter/material.dart';
import 'package:tlaco_point/resources/AppTheme.dart';

class AccessType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('Log In',
              style: TextStyle(fontSize: 20, color: AppTheme.primaryTextColor)),
        ),
        const SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          child: Text('Acceder',
              style: TextStyle(fontSize: 20, color: AppTheme.primaryTextColor)),
        ),
      ]),
    ));
  }
}
