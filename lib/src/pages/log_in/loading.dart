import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tlaco_point/resources/AppColors.dart';
import 'package:tlaco_point/src/pages/Theme/AppTheme.dart';
import 'access_type.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Splash2(),
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new SecondScreen(),
        image: new Image.asset('assets/TlacoPoint.png'),
        loadingText: Text("Loading"),
        photoSize: 100.0,
        loaderColor: AppColors.primaryDarkColor);
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(child: AccessType()),
        theme: AppTheme.getAppTheme(context));
  }
}
