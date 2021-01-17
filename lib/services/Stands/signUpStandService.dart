import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postgres/postgres.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class SignUpStandService {
  static final _prefs = PreferenciasUsuario();

  static Future<String> registrar({
    String pCORREO,
    String pNOMBRE,
    String pESPECIALIDAD,
    LatLng pLATLNG,
  }) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    double pLAT = pLATLNG.latitude;
    double pLNG = pLATLNG.longitude;

    List<
        Map<String,
            Map<String, dynamic>>> result = await connection.mappedResultsQuery(
        "SELECT * FROM TP_USUARIOS WHERE EMAIL = @pEMAIL AND ES_DUENO = FALSE",
        substitutionValues: {"pEMAIL": pCORREO.trim()});
    //if (result.isEmpty) return "Ya tienes un puesto registrado";

    await connection.transaction((connection) async {
      await connection.query(
        '''call signupstand(pcorreo := @pCORREO,
                 pnombre := @pNOMBRE,
                 pespecialidad := @pESPECIALIDAD,
                 platitude := @pLAT,
                 plongitude := @pLNG)''',
        substitutionValues: {
          "pCORREO": pCORREO,
          "pNOMBRE": pNOMBRE,
          "pESPECIALIDAD": pESPECIALIDAD,
          "pLAT": pLAT,
          "pLNG": pLNG,
        },
      );
    }, commitTimeoutInSeconds: 9999);

    //_prefs.nombrePuesto = pNOMBRE;
    //_prefs.esDueno = true;

    return "Puesto Registrado exitosamente";
  }
}
