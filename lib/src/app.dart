import 'package:flutter/material.dart';
import 'package:tlaco_point/Theme/AppTheme.dart';
import 'package:tlaco_point/routes/AppRoutes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'TlacoPoint',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(context),
      initialRoute: 'Loading',
      routes: getApplicationRoutes(),
    );
  }
}
