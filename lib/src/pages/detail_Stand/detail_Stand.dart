import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/resources/AppColors.dart';
import 'package:tlaco_point/widgets/Gmap.dart';

class DetailStand extends StatelessWidget {
  static const String routeName = 'detalle';
  const DetailStand({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Puesto puesto = ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(context, puesto),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              _informacion(context, size, puesto),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .020),
                child: Text(
                  'Su ubicacion:',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .020),
                child: Text(
                  'Presiona el marcador para saber su ruta',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              _mapa(size, puesto),
            ]),
          ),
        ],
      ),
    );
  }

  _crearAppBar(BuildContext context, Puesto puesto) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: AppColors.primaryColor,
      expandedHeight: 200.0,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(puesto.tpFranquicia.nombreFranquicia),
      ),
    );
  }

  _informacion(BuildContext context, Size size, Puesto puesto) {
    return Container(
      padding: EdgeInsets.only(top: size.height * .10),
      child: Column(
        children: <Widget>[
          Text("Puesto: ${puesto.tpFranquicia.nombreFranquicia}",
              style: Theme.of(context).textTheme.headline4),
          SizedBox(height: size.height * .080),
          Text(
            "Especialidad: ${puesto.tpFranquicia.especialidad}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: size.height * .080),
        ],
      ),
    );
  }

  _mapa(Size size, Puesto puesto) {
    return Container(
      height: size.height * .65,
      width: size.width,
      child: Gmap(
        position: puesto.latLng,
      ),
    );
  }
}
