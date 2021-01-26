// To parse this JSON data, do
//
//     final resena = resenaFromJson(jsonString);

import 'dart:convert';

class Resenas {
  List<Resena> items = new List();
  Resenas();

  Resenas.fromJsonList(List<Map<String, Map<String, dynamic>>> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final puesto = new Resena.fromJson(item);
      items.add(puesto);
    }
  }
}

class Resena {
  Resena({
    this.tpResena,
    this.tpUsuarios,
  });

  TpResena tpResena;
  TpUsuarios tpUsuarios;

  factory Resena.fromRawJson(String str) => Resena.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resena.fromJson(Map<String, dynamic> json) => Resena(
        tpResena: TpResena.fromJson(json["tp_resena"]),
        tpUsuarios: TpUsuarios.fromJson(json["tp_usuarios"]),
      );

  Map<String, dynamic> toJson() => {
        "tp_resena": tpResena.toJson(),
        "tp_usuarios": tpUsuarios.toJson(),
      };
}

class TpResena {
  TpResena({
    this.idResenaa,
    this.clasificacion,
    this.resena,
  });

  int idResenaa;
  int clasificacion;
  String resena;

  factory TpResena.fromRawJson(String str) =>
      TpResena.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TpResena.fromJson(Map<String, dynamic> json) => TpResena(
        idResenaa: json["id_resenaa"],
        clasificacion: json["clasificacion"],
        resena: json["resena"],
      );

  Map<String, dynamic> toJson() => {
        "id_resenaa": idResenaa,
        "clasificacion": clasificacion,
        "resena": resena,
      };
}

class TpUsuarios {
  TpUsuarios({
    this.nombre,
    this.apellido1,
  });

  String nombre;
  String apellido1;

  factory TpUsuarios.fromRawJson(String str) =>
      TpUsuarios.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TpUsuarios.fromJson(Map<String, dynamic> json) => TpUsuarios(
        nombre: json["nombre"],
        apellido1: json["apellido_1"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido_1": apellido1,
      };
}
