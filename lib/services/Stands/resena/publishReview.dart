import 'package:postgres/postgres.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class PublishReviewService {
  static Future<String> publicar({
    int idFranquicia,
    int idSucursal,
    String email,
    String resena,
  }) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    await connection.transaction((connection) async {
      await connection.query(
        '''call PublishReview(
                 pIDFRANQUICIA := @pIDFRANQUICIA,
                 pIDSUCURSAL := @pIDSUCURSAL,
                 pEMAIL := @pEMAIL,
                 pRESENA := @pRESENA)''',
        substitutionValues: {
          "pIDFRANQUICIA": idFranquicia,
          "pIDSUCURSAL": idSucursal,
          "pEMAIL": email,
          "pRESENA": resena
        },
      );
    }, commitTimeoutInSeconds: 9999);

    //_prefs.nombrePuesto = pNOMBRE;
    //_prefs.esDueno = true;

    return "Reseña cargada exitosamente";
  }
}
