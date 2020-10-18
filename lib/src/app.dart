import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/Theme/AppTheme.dart';
import 'package:tlaco_point/src/routes/AppRoutes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: AppTheme.getAppTheme(context),
      initialRoute: 'Loading',
      routes: getApplicationRoutes(),
    );
  }
}
