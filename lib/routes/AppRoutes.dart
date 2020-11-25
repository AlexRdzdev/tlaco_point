import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/log_in/login.dart';
import 'package:tlaco_point/src/pages/loading.dart';
import 'package:tlaco_point/src/pages/stand_register_pages/stand_register.dart';
import 'package:tlaco_point/src/pages/log_in/signup.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'Loading': (BuildContext context) => Loading(),
    'LogIn': (BuildContext context) => LogIn(),
    'SignUp': (BuildContext context) => SignUp(),
    'StandRegister': (BuildContext context) => SignUpStand(),
  };
}
