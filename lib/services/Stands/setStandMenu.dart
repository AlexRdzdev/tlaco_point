import 'dart:typed_data';
import 'package:postgres/postgres.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class SetStandMenuService {
  static Future<String> cargar({
    int idFranquicia,
    int idSucursal,
    Uint8List bytes,
  }) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    await connection.transaction((connection) async {
      await connection.query(
        '''call SetStandMenu(
                 pIDFRANQUICIA := @pIDFRANQUICIA,
                 pIDSUCURSAL := @pIDSUCURSAL,
                 pBYTES := @pBYTES:bytea)''',
        substitutionValues: {
          "pIDFRANQUICIA": idFranquicia,
          "pIDSUCURSAL": idSucursal,
          "pBYTES": bytes,
        },
      );
    }, commitTimeoutInSeconds: 9999);

    //_prefs.nombrePuesto = pNOMBRE;
    //_prefs.esDueno = true;

    return "Foto cargada exitosamente";
  }
}
