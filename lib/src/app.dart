import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/Theme/AppTheme.dart';
import 'package:tlaco_point/src/pages/log_in/loading.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
        home: Center(child: Loading()), theme: AppTheme.getAppTheme(context));
  }
}
