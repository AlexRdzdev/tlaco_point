import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/list_restaurants/list_restaurantsUsers.dart';
import 'package:tlaco_point/src/pages/list_restaurants/list_sucursales.dart';
import 'package:tlaco_point/src/pages/detail_Stand/Detail_Stand.dart';
import 'package:tlaco_point/src/pages/loading.dart';
import 'package:tlaco_point/src/pages/log_in/login.dart';
import 'package:tlaco_point/src/pages/log_in/signup.dart';
import 'package:tlaco_point/src/pages/home_pages/home_page.dart';
import 'package:tlaco_point/src/pages/signUp_stands/signUpStand.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    Loading.routeName: (BuildContext context) => Loading(),
    LogIn.routeName: (BuildContext context) => LogIn(),
    SignUp.routeName: (BuildContext context) => SignUp(),
    HomePage.routeName: (BuildContext context) => HomePage(),
    SignUpStand.routeName: (BuildContext context) => SignUpStand(),
    ListSucursales.routeName: (BuildContext context) => ListSucursales(),
    DetailStand.routeName: (BuildContext context) => DetailStand(),
    ListSucursalesUsers.routeName: (BuildContext context) =>
        ListSucursalesUsers(),
  };
}
