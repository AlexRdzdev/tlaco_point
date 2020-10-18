import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/log_in/access_type.dart';
import 'package:tlaco_point/src/pages/log_in/loading.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_direction.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_menu.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_names.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_photo.dart';
import 'package:tlaco_point/src/pages/log_in/stand_register_pages/register_schedule.dart';
import 'package:tlaco_point/src/pages/log_in/user_login.dart';
import 'package:tlaco_point/src/pages/log_in/user_signup.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'Loading': (BuildContext context) => Loading(),
    'AccessType': (BuildContext context) => AccessType(),
    'Login': (BuildContext context) => Loginn(),
    'UserRegistry': (BuildContext context) => UserRegistry(),
    'StandRegisterName': (BuildContext context) => RegisterStandName(),
    'StandRegisterDirection': (BuildContext context) =>
        RegisterStandDirection(),
    'StandRegisterSchedule': (BuildContext context) => RegisterStandSchedule(),
    'StandRegisterMenu': (BuildContext context) => RegisterStandMenu(),
    'StandRegisterPhoto': (BuildContext context) => RegisterStandPhoto(),
  };
}
