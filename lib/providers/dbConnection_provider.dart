import 'package:postgres/postgres.dart';

class DbConnectionProvider {
  static PostgreSQLConnection _connection;
  static final DbConnectionProvider postgreSql = DbConnectionProvider._();
  DbConnectionProvider._();

  static String _host = 'tlacopoint.asuscomm.com',
      _user = 'SERROD',
      _password = 'mexico01',
      _db = 'tlacotest';
  static int _port = 5432;

  Future<PostgreSQLConnection> get connection async {
    if (_connection == null || _connection.isClosed) {
      _connection = await initConnection();
      return _connection;
    } else {
      return _connection;
    }
  }

  Future<PostgreSQLConnection> initConnection() async {
    PostgreSQLConnection connection = PostgreSQLConnection(_host, _port, _db,
        username: _user, password: _password);
    await connection.open();
    return connection;
  }
}
