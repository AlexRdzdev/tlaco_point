import 'package:postgres/postgres.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class SignUpService {
  static registrar(
      {String pNOMBRE,
      String pAPELLIDO_1,
      String pEMAIL,
      String pPASSWORD}) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

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
  }
}
