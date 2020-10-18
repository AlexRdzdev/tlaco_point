import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tlaco_point/resources/AppColors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: 'AccessType',
        image: new Image.asset('assets/TlacoPoint.png'),
        loadingText: Text("Loading"),
        photoSize: 100.0,
        loaderColor: AppColors.primaryDarkColor);
  }
}
