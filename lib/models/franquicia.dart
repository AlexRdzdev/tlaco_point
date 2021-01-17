import 'dart:convert';

class TpFranquicia {
  TpFranquicia({
    this.idFranquicia,
    this.nombreFranquicia,
    this.especialidad,
  });

  int idFranquicia;
  String nombreFranquicia;
  String especialidad;

  factory TpFranquicia.fromRawJson(String str) =>
      TpFranquicia.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TpFranquicia.fromJson(Map<String, dynamic> json) => TpFranquicia(
        idFranquicia: json["id_franquicia"],
        nombreFranquicia: json["nombre_franquicia"],
        especialidad: json["especialidad"],
      );

  Map<String, dynamic> toJson() => {
        "id_franquicia": idFranquicia,
        "nombre_franquicia": nombreFranquicia,
        "especialidad": especialidad,
      };
}
