import 'package:flutter/material.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/services/Stands/searchStandService.dart';
import 'package:tlaco_point/src/pages/detail_Stand/Detail_Stand.dart';

class StandSearch extends SearchDelegate {
  StandSearch({
    String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
        icon: AnimatedIcon(
          progress: transitionAnimation,
          icon: AnimatedIcons.menu_arrow,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Las sugerencias que aparecen cuando la persona escribe
    if (query.isEmpty) return Container();
    return FutureBuilder(
      future: SearchStandService.buscar(pNOMBRE: query),
      builder: (BuildContext context, AsyncSnapshot<List<Puesto>> snapshot) {
        if (snapshot.hasData) {
          final puestos = snapshot.data;
          return ListView(
            children: puestos.map((puesto) {
              return ListTile(
                leading: Icon(Icons.store),
                title: Text(puesto.tpFranquicia.nombreFranquicia),
                subtitle: Text(puesto.tpFranquicia.especialidad),
                onTap: () {
                  //print(puesto.latLng);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailStand(
                        puesto: puesto,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
