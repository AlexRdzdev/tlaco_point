import 'package:flutter/material.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/services/Stands/getUserStandsService.dart';
import 'package:tlaco_point/src/pages/list_restaurants/restaurants_options.dart';

class ListSucursalesUsers extends StatefulWidget {
  static const String routeName = 'ListSucursalesUsers';
  _ListSucursalesUsers createState() => _ListSucursalesUsers();
}

class _ListSucursalesUsers extends State<ListSucursalesUsers> {
  static final _prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tus Puestos'),
      ),
      body: Container(
        child: listaSucursales(context),
      ),
    );
  }

  Widget listaSucursales(BuildContext context) {
    return FutureBuilder(
      future: GetUserStandsService.buscar(pEMAIL: _prefs.email),
      builder: (BuildContext context, AsyncSnapshot<List<Puesto>> snapshot) {
        //print(snapshot.data);
        if (snapshot.hasData) {
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> _listaItems(List<Puesto> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt.tpFranquicia.nombreFranquicia),
        leading: Icon(Icons.store),
        subtitle: Text(opt.tpFranquicia.especialidad),
        onTap: () => Navigator.pushNamed(context, StandOptions.routeName,
            arguments: opt),
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
