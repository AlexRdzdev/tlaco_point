import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlaco_point/Theme/AppTheme.dart';
import 'package:tlaco_point/providers/ui_provider.dart';
import 'package:tlaco_point/routes/AppRoutes.dart';
import 'package:tlaco_point/src/pages/loading.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
      ],
      child: MaterialApp(
        title: 'TlacoPoint',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getAppTheme(context),
        initialRoute: Loading.routeName,
        routes: getApplicationRoutes(),
      ),
    );
  }
}
