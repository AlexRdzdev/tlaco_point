import 'package:flutter/material.dart';

import 'package:tlaco_point/resources/AppTheme.dart';

class accessType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: const Text('Log In', style: TextStyle(fontSize: 20)),
            ),
          ]),
    ));
  }
}
