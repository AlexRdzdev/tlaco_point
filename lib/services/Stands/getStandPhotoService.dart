import 'dart:typed_data';
import 'package:postgres/postgres.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class GetStandPhoto {
  static Future<Uint8List> obtener({
    int idFranquicia,
    int idSucursal,
  }) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    PostgreSQLResult result = await connection.query('''
    SELECT foto
    FROM TP_FOTO
    WHERE ES_MENU = FALSE
    AND ID_FRANQUICIA = @pIDFRANQUICIA
    AND ID_SUCURSAL = @pIDSUCURSAL''', substitutionValues: {
      "pIDFRANQUICIA": idFranquicia,
      "pIDSUCURSAL": idSucursal,
    });

    print(result);

    final PostgreSQLResultRow row1 = result.first;
    //print(result[0][0]);
    Uint8List bytes = row1.first;
    //print(bytes);

    return bytes;
  }
}
