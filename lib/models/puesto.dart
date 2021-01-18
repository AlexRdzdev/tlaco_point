import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tlaco_point/models/franquicia.dart';
import 'package:tlaco_point/models/sucursal.dart';

class Puestos {
  List<Puesto> items = new List();
  Puestos();

  Puestos.fromJsonList(List<Map<String, Map<String, dynamic>>> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final puesto = new Puesto.fromJson(item);
      items.add(puesto);
    }
  }
}

class Puesto {
  Puesto({
    this.tpFranquicia,
    this.tpSucursal,
    this.latLng,
  });

  TpFranquicia tpFranquicia;
  TpSucursal tpSucursal;
  LatLng latLng;

  factory Puesto.fromRawJson(String str) => Puesto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Puesto.fromJson(Map<String, dynamic> json) => Puesto(
        tpFranquicia: TpFranquicia.fromJson(json["tp_franquicia"]),
        tpSucursal: TpSucursal.fromJson(json["tp_sucursal"]),
        latLng: LatLng(json[null]["latitud"], json[null]["longitud"]),
      );

  Map<String, dynamic> toJson() => {
        "tp_franquicia": tpFranquicia.toJson(),
        "tp_sucursal": tpSucursal.toJson(),
        null: latLng.toJson(),
      };
}
