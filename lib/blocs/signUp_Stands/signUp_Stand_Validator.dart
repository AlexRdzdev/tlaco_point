import 'dart:async';

class SignUpStandValidator {
  final validarNombre = StreamTransformer<String, String>.fromHandlers(
      handleData: (nombre, sink) {
    if (nombre.length >= 1) {
      sink.add(nombre);
    } else {
      sink.addError('Porfavor introduce un nombre');
    }
  });

  final validarEspecialidad = StreamTransformer<String, String>.fromHandlers(
      handleData: (especialidad, sink) {
    if (especialidad.length >= 1) {
      sink.add(especialidad);
    } else {
      sink.addError('Porfavor introduce una especialidad');
    }
  });
}
