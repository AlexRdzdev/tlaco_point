import 'package:flutter/material.dart';

class RegisterStandName extends StatefulWidget {
  @override
  _RegisterStandNameState createState() => _RegisterStandNameState();
}

class _RegisterStandNameState extends State<RegisterStandName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _nombrePuesto(),
          Divider(),
          _especialidadPuesto(),
        ],
      ),
    );
  }

  Widget _nombrePuesto() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Ejemplo: Tacos Alex',
          labelText: 'Nombre del puesto',
          helperText: '',
          suffixIcon: Icon(Icons.storefront),
          icon: Icon(Icons.store)),
    );
  }

  Widget _especialidadPuesto() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Ejemplo: Tacos',
          labelText: 'Especialidad',
          helperText: '',
          suffixIcon: Icon(Icons.local_dining),
          icon: Icon(Icons.store)),
    );
  }
}
