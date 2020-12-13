import 'package:postgres/postgres.dart';
import 'package:tlaco_point/models/user.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class LogInAccount {
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

  static Future<bool> vericar({String vEmail, String vPassword}) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    User coincidencia = await buscarUsuarioPorEmail(vEmail);
    if (coincidencia == null) {
      print('No se ha encontrado el correo ingresado');
      return false;
    } else {
      await connection.transaction((connection) async {
        await connection.query(
            "SELECT * FROM TP_USUARIOS WHERE PASSWORD = @vPassword ",
            substitutionValues: {"vEmail": vEmail, "vPassword": vPassword});
      }, commitTimeoutInSeconds: 9999);
      print('usuario encontrado');
      return true;
    }
  }
}
