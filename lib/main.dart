import 'package:flutter/material.dart';

import 'src/app.dart';

import 'package:tlaco_point/preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
