import 'package:postgres/postgres.dart';
import 'package:tlaco_point/models/user.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';
import 'package:tlaco_point/src/pages/home_pages/home_page.dart';

class LogInService {
  static final _prefs = PreferenciasUsuario();

  static Future<User> buscarUsuarioPorEmail(String vEmail) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    User usuarioPorEmail;

    List<Map<String, Map<String, dynamic>>> result = await connection
        .mappedResultsQuery("SELECT * FROM TP_USUARIOS WHERE EMAIL = @pEMAIL ",
            substitutionValues: {"pEMAIL": vEmail.trim()});
    if (result.isEmpty) {
      //regresa usuario nulo porque no encontro una coincidencia del correo electronico.
      return usuarioPorEmail;
    } else {
      usuarioPorEmail = User.fromJson(result.single["tp_usuarios"]);
      print(usuarioPorEmail.email);
      return usuarioPorEmail;
    }
  }

  static Future<User> buscarUsuarioPorEmailyContrasena(
      String vEmail, String vPassword) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    User usuarioPorPass;

    List<
        Map<String,
            Map<String, dynamic>>> result = await connection.mappedResultsQuery(
        "SELECT * FROM TP_USUARIOS WHERE EMAIL = @pEmail AND PASSWORD = @pPassword ",
        substitutionValues: {"pEmail": vEmail, "pPassword": vPassword});
    if (result.isEmpty) {
      //regresa usuario nulo porque la contraseña no es correcta.
      return usuarioPorPass;
    } else {
      usuarioPorPass = User.fromJson(result.single["tp_usuarios"]);
      print(usuarioPorPass.email);
      return usuarioPorPass;
    }
  }

  static Future<bool> verificar({String vEmail, String vPassword}) async {
    User coincidencia = await buscarUsuarioPorEmail(vEmail);
    if (coincidencia == null) {
      print('No se ha encontrado el correo ingresado');
      return false;
    } else {
      coincidencia = await buscarUsuarioPorEmailyContrasena(vEmail, vPassword);
      if (coincidencia == null) {
        print('Constraseña incorrecta');
        return false;
      } else {
        print('usuario encontrado');
        _prefs.email = vEmail;
        _prefs.nombre = coincidencia.nombre;
        _prefs.apellido = coincidencia.apellido1;
        _prefs.ultimaPagina = HomePage.routeName;
        return true;
      }
    }
  }
}
