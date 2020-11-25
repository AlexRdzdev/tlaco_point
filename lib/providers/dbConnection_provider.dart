import 'package:postgres/postgres.dart';

class DbConnectionProvider {
  static PostgreSQLConnection _connection;
  static final DbConnectionProvider postgreSql = DbConnectionProvider._();
  DbConnectionProvider._();

  static String host = 'tlacopoint.asuscomm.com',
      user = 'SERROD',
      password = 'mexico01',
      db = 'tlacotest';
  static int port = 5432;

  Future<PostgreSQLConnection> get connection async {
    if (_connection == null || _connection.isClosed) {
      _connection = await initConnection();
      return _connection;
    } else {
      return _connection;
    }
  }

  Future<PostgreSQLConnection> initConnection() async {
    PostgreSQLConnection connection = PostgreSQLConnection(host, port, db,
        username: user, password: password);
    await connection.open();
    return connection;
  }
}
