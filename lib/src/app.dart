import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/home_page.dart';
import 'package:tlaco_point/src/pages/log_in/access_type.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(home: Center(child: AccessType()));
  }
}
