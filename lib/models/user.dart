// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.nombre,
    this.apellido1,
    this.apellido2,
    this.email,
    this.password,
    this.esDueno,
  });

  int id;
  String nombre;
  String apellido1;
  String apellido2;
  String email;
  String password;
  bool esDueno;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        apellido1: json["apellido_1"],
        apellido2: json["apellido_2"],
        email: json["email"],
        password: json["password"],
        esDueno: json["es_dueno"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido_1": apellido1,
        "apellido_2": apellido2,
        "email": email,
        "password": password,
        "es_dueno": esDueno,
      };
}
