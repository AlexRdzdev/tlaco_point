import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postgres/postgres.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/providers/dbConnection_provider.dart';

class SignUpStandService {
  static final _prefs = PreferenciasUsuario();

  static Future<bool> registrar({
    String pNOMBRE,
    String pESPECIALIDAD,
    LatLng pLATLNG,
  }) async {
    PostgreSQLConnection connection =
        await DbConnectionProvider.postgreSql.connection;

    return true;
  }
}
