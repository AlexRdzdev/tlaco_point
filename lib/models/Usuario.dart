class Usuario {
  int idUsuario;
  String nombre;
  String apellido_1;
  String apellido_2;
  String email;
  String password;
  bool esDueno;

  Usuario(
      {idUsuario, nombre, apellido_1, apellido_2, email, password, esDueno}) {
    this.idUsuario = idUsuario;
    this.nombre = nombre;
    this.apellido_1 = apellido_1;
    this.apellido_2 = apellido_2;
    this.email = email;
    this.password = password;
    this.esDueno = esDueno;
  }
}
