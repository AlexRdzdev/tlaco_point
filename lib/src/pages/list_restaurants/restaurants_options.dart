import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/src/pages/detail_Stand/addMenuStand.dart';
import 'package:tlaco_point/src/pages/detail_Stand/addStandPhoto.dart';
import 'package:tlaco_point/src/pages/detail_Stand/detail_Stand.dart';

class StandOptions extends StatelessWidget {
  StandOptions({Key key}) : super(key: key);

  static const String routeName = 'opciones';

  @override
  Widget build(BuildContext context) {
    final Puesto puesto = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Opciones de ${puesto.tpFranquicia.nombreFranquicia}"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Visualizar Pagina"),
            leading: Icon(Icons.store),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailStand(
                  puesto: puesto,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Agregar Menú"),
            leading: FaIcon(FontAwesomeIcons.utensils),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddMenuStand(
                  puesto: puesto,
                ),
              ),
            ),
          ),
          Divider(),
          /**ListTile(
            title: Text("Agregar Horario"),
            leading: FaIcon(FontAwesomeIcons.solidClock),
            onTap: () {},
          ),
          */
          //Divider(),

          ListTile(
            title: Text("Agregar Foto"),
            leading: Icon(Icons.camera_alt),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStandPhoto(
                  puesto: puesto,
                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
