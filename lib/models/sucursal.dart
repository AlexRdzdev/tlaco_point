import 'dart:convert';

class TpSucursal {
  TpSucursal({
    this.idSucursal,
  });

  int idSucursal;

  factory TpSucursal.fromRawJson(String str) =>
      TpSucursal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TpSucursal.fromJson(Map<String, dynamic> json) => TpSucursal(
        idSucursal: json["id_sucursal"],
      );

  Map<String, dynamic> toJson() => {
        "id_sucursal": idSucursal,
      };
}
