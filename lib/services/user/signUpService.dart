import 'package:postgres/postgres.dart';
import 'package:tlaco_point/models/user.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';
import 'package:tlaco_point/src/pages/home_pages/home_page.dart';

class SignUpService {
  static final _prefs = PreferenciasUsuario();

  static Future<User> buscarUsuarioPorEmail(String pEMAIL) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    User usuarioPorEmail;

    List<Map<String, Map<String, dynamic>>> result = await connection
        .mappedResultsQuery("SELECT * FROM TP_USUARIOS WHERE EMAIL = @pEMAIL",
            substitutionValues: {"pEMAIL": pEMAIL.trim()});
    if (result.isEmpty) {
      //regresa usuario nulo porque no encontro una coincidencia del correo electronico.
      return usuarioPorEmail;
    } else {
      usuarioPorEmail = User.fromJson(result.single["tp_usuarios"]);
      print(usuarioPorEmail.email);
      return usuarioPorEmail;
    }
  }

  static Future<bool> registrar(
      {String pNOMBRE,
      String pAPELLIDO_1,
      String pEMAIL,
      String pPASSWORD}) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    User coincidencia = await buscarUsuarioPorEmail(pEMAIL);
    if (coincidencia == null) {
      await connection.transaction((connection) async {
        await connection.query(
            "INSERT INTO tp_usuarios(nombre, apellido_1, email, password) VALUES(@pNOMBRE, @pAPELLIDO_1, @pEMAIL, @pPASSWORD);",
            substitutionValues: {
              "pNOMBRE": pNOMBRE,
              "pAPELLIDO_1": pAPELLIDO_1,
              "pEMAIL": pEMAIL,
              "pPASSWORD": pPASSWORD
            });
      }, commitTimeoutInSeconds: 9999);
      print('usuario registrado con exito');
      _prefs.email = pEMAIL;
      _prefs.ultimaPagina = HomePage.routeName;
      _prefs.nombre = pNOMBRE;
      _prefs.apellido = pAPELLIDO_1;
      return true;
    } else {
      print(
          'no se puede registrar el usuario, email $pEMAIL ya está registrado');
      return false;
    }
  }
}
