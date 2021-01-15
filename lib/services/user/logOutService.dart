import 'package:tlaco_point/preferences/user_preferences.dart';

class LogOutService {
  static final _prefs = PreferenciasUsuario();

  static cerrarSesion() {
    _prefs.email = null;
    _prefs.ultimaPagina = null;
    _prefs.nombre = null;
    _prefs.apellido = null;
  }
}
