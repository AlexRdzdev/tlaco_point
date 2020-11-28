import 'package:postgres/postgres.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class SignUpService {
  registrar() async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    connection.query('SELECT * FROM TP_USUARIOS');
  }
}
