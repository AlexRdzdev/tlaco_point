import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tlaco_point/blocs/signUp_Stands/signUp_Stand_Validator.dart';

class SignUpStandBloc extends SignUpStandValidator {
  final _nombreController = BehaviorSubject<String>();
  final _especialidadController = BehaviorSubject<String>();
  final _latLngController = BehaviorSubject<LatLng>();

  String get nombre => _nombreController.value;
  String get especialidad => _especialidadController.value;
  LatLng get latLng => _latLngController.value;

//Obtener data del stream
  Stream<String> get nombreStream =>
      _nombreController.stream.transform(validarNombre);
  Stream<String> get especialidadStream =>
      _especialidadController.stream.transform(validarEspecialidad);
  Stream<LatLng> get latLngStream => _latLngController.stream;

  Stream<bool> get formValidStream =>
      Rx.combineLatest3<String, String, LatLng, bool>(
          nombreStream, especialidadStream, latLngStream, (a, b, c) => true);

//Insertar valores al stream
  Function(String) get changeNombre => _nombreController.sink.add;
  Function(String) get changeEspecialidad => _especialidadController.sink.add;
  set changelatLng(LatLng latLng) => _latLngController.sink.add(latLng);

  dispose() {
    _nombreController?.close();
    _especialidadController?.close();
    _latLngController?.close();
  }
}
