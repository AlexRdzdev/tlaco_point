import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del email
  get email {
    return _prefs.getString('email') ?? '';
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  // GET y SET del nombre
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

// GET y SET del nombre
  get apellido {
    return _prefs.getString('apellido') ?? '';
  }

  set apellido(String value) {
    _prefs.setString('apellido', value);
  }

// GET y SET del nombre del puesto
  get nombrePuesto {
    return _prefs.getString('nombrePuesto') ?? '';
  }

  set nombrePuesto(String value) {
    _prefs.setString('nombrePuesto', value);
  }

  // GET y SET del es_dueno
  get esDueno {
    return _prefs.getBool('esDueno') ?? false;
  }

  set esDueno(bool value) {
    _prefs.setBool('esDueno', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'LogIn';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
