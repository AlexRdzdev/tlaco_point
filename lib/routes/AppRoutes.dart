import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/log_in/access_type.dart';
import 'package:tlaco_point/src/pages/log_in/loading.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register.dart';
import 'package:tlaco_point/src/pages/log_in/user_login.dart';
import 'package:tlaco_point/src/pages/log_in/user_signup.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'Loading': (BuildContext context) => Loading(),
    'AccessType': (BuildContext context) => AccessType(),
    'Login': (BuildContext context) => UserLogin(),
    'UserRegistry': (BuildContext context) => UserSignUp(),
    'StandRegister': (BuildContext context) => SignUpStand(),
  };
}
