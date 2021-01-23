import 'package:flutter/material.dart';
import 'package:tlaco_point/src/pages/list_restaurants/list_sucursales.dart';
import 'dart:ui';

class StartFirstPage extends StatefulWidget {
  static const String routeName = 'StartFirstPage';
  _Sucursales createState() => _Sucursales();
}

class _Sucursales extends State<StartFirstPage> {
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
              Image.asset("assets/boneless.png"), 'Boneless', context),
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
        onPressed: () {
          Navigator.pushNamed(context, ListSucursales.routeName,
              arguments: texto);
        },
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
