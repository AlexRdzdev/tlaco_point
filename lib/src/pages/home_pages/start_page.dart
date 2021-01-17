import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:tlaco_point/src/pages/log_in/login.dart';

class StartFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(leading: Icon(Icons.category), title: Text("Categorias")),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[_botonesRedondeados(context)],
              ),
            )
          ],
        ));
  }

  Widget _botonesRedondeados(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _crearBotonRedondeado(
              Image.asset("assets/pizza.png"), 'Pizza', context),
          _crearBotonRedondeado(
              Image.asset("assets/Hamburguesa.png"), 'Hamburguesa', context),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(
              Image.asset("assets/postre.png"), 'Postres', context),
          _crearBotonRedondeado(
              Image.asset("assets/sushi.png"), 'Sushi', context),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(
              Image.asset("assets/tacos.png"), 'Tacos', context),
          _crearBotonRedondeado(
              Image.asset("assets/boneless.png"), 'Sushi', context),
        ]),
      ],
    );
  }

  Widget _crearBotonRedondeado(
      Image image, String texto, BuildContext context) {
    return Container(
      height: 150.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: ElevatedButton(
        onPressed: () =>
            Navigator.pushReplacementNamed(context, LogIn.routeName),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 5.0),
              image,
              Text(texto),
              SizedBox(height: 5.0)
            ],
          ),
        ),
      ),
    );
  }
}
