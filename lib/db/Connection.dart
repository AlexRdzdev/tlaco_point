import 'package:postgres/postgres.dart';

class ConnectionProvider {
  static String host = 'tlacopoint.asuscomm.com',
      user = 'SERROD',
      password = 'mexico01',
      db = 'tlacotest';
  static int port = 5432;

  static getConnection() async {
    var connection = PostgreSQLConnection(host, port, db,
        username: user, password: password);
    await connection.open();
    return connection;
  }
}
