import 'package:postgres/postgres.dart';
import 'package:tlaco_point/models/resena.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class GetStandReviewsService {
  static Future<List<Resena>> obtener(
      {int pIDFRANQUICIA, int pIDSUCURSAL}) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    List<Map<String, Map<String, dynamic>>> result =
        await connection.mappedResultsQuery('''SELECT R.id_resenaa, 
        R.clasificacion, 
        R.resena, 
        U.nombre, 
        U.apellido_1
        FROM TP_RESENA R
          INNER JOIN TP_USUARIOS U
            ON U.id_usuario = R.id_usuario
        WHERE R.id_franquicia = @pIDFRANQUICIA
          AND R.id_sucursal = @pIDSUCURSAL''', substitutionValues: {
      "pIDFRANQUICIA": pIDFRANQUICIA,
      "pIDSUCURSAL": pIDSUCURSAL,
    });

    print(result);

    final resenas = Resenas.fromJsonList(result);
    //print(puestos.items[0].tpFranquicia.nombreFranquicia);

    return resenas.items;
  }
}
