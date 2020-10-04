import 'package:flutter/material.dart';
import 'package:tlaco_point/resources/AppTheme.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child: Image.asset('assets/TlacoPoint.png')),
      ),
      //backgroundColor: AppTheme.secondaryColor,
    );
  }
}
