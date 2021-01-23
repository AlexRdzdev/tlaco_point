import 'package:flutter/material.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/services/Locales/searchPuestos.dart';
import 'package:tlaco_point/src/pages/detail_Stand/detail_Stand.dart';

class ListSucursalesUsers extends StatefulWidget {
  static const String routeName = 'ListSucursalesUsers';
  _ListSucursalesUsers createState() => _ListSucursalesUsers();
}

class _ListSucursalesUsers extends State<ListSucursalesUsers> {
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
    String especialidad = ModalRoute.of(context).settings.arguments;
    // Las sugerencias que aparecen cuando la persona escribe
    return FutureBuilder(
      future: SearchPuestos.buscar(pESPECIALIDAD: especialidad),
      builder: (BuildContext context, AsyncSnapshot<List<Puesto>> snapshot) {
        print(snapshot.data);
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
        onTap: () {
          Navigator.pushNamed(context, DetailStand.routeName, arguments: opt);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
