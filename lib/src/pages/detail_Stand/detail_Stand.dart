import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/models/resena.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/services/Stands/menu/getStandMenuService.dart';
import 'package:tlaco_point/services/Stands/photo/getStandPhotoService.dart';
import 'package:tlaco_point/services/Stands/resena/getStandReviews.dart';
import 'package:tlaco_point/services/Stands/resena/publishReview.dart';
import 'package:tlaco_point/utils/utils.dart';
import 'package:tlaco_point/widgets/Gmap.dart';

class DetailStand extends StatefulWidget {
  static const String routeName = 'detalle';

  final Puesto puesto;
  const DetailStand({Key key, this.puesto}) : super(key: key);

  @override
  _DetailStandState createState() => _DetailStandState();
}

class _DetailStandState extends State<DetailStand> {
  static final _prefs = PreferenciasUsuario();
  TextEditingController _controllerResena;
  Uint8List fotoBytes;
  Uint8List menuBytes;

  void _obtenerImagenCargada(Puesto puesto) async {
    final Uint8List bytesDownloaded = await GetStandPhoto.obtener(
        idFranquicia: puesto.tpFranquicia.idFranquicia,
        idSucursal: puesto.tpSucursal.idSucursal);
    if (bytesDownloaded == null) return;
    setState(() {
      fotoBytes = bytesDownloaded;
    });
  }

  void _obtenerFotoCargada(Puesto puesto) async {
    final Uint8List bytesDownloaded = await GetStandMenu.obtener(
        idFranquicia: puesto.tpFranquicia.idFranquicia,
        idSucursal: puesto.tpSucursal.idSucursal);
    if (bytesDownloaded == null) return;
    setState(() {
      menuBytes = bytesDownloaded;
    });
  }

  _informacion(BuildContext context, Size size, Puesto puesto) {
    return Container(
      //height: 600,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          SizedBox(height: size.height * .015),
          Text("Puesto: ${puesto.tpFranquicia.nombreFranquicia}",
              style: Theme.of(context).textTheme.headline4),
          SizedBox(height: size.height * .015),
          Center(
            child: Text(
              "Especialidad: ${puesto.tpFranquicia.especialidad}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(height: size.height * .005),
          Center(
            child: Text(
              "El menu del puesto:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          _menu(),
        ],
      ),
    );
  }

  _menu() {
    return (menuBytes != null)
        ? Image.memory(
            menuBytes,
            fit: BoxFit.cover,
          )
        : Image.asset(
            "assets/no-image.png",
            fit: BoxFit.cover,
          );
  }

  _mapa(Size size, Puesto puesto) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Gmap(
        position: puesto.latLng,
      ),
    );
  }

  _resenas(Size size, Puesto puesto) {
    return Container(
        //height: 500,
        width: double.infinity,
        child: Column(
          children: [
            _dejarResena(),
            Expanded(
              child: FutureBuilder(
                  future: GetStandReviewsService.obtener(
                      pIDFRANQUICIA: puesto.tpFranquicia.idFranquicia,
                      pIDSUCURSAL: puesto.tpSucursal.idSucursal),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Resena>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: _listaItems(snapshot.data, context),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ));
  }

  _dejarResena() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            child: TextField(
              controller: _controllerResena,
              keyboardType: TextInputType.text,
              maxLines: 2,
              decoration: InputDecoration(hintText: "Deja tu reseña"),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
              onPressed: () {
                _publicar(widget.puesto, _controllerResena.text);
                _controllerResena.clear();
              },
              child: Text("Publicar"))
        ],
      ),
    );
  }

  List<Widget> _listaItems(List<Resena> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text("${opt.tpUsuarios.nombre} ${opt.tpUsuarios.apellido1}"),
        leading: Icon(Icons.person),
        subtitle: Text("${opt.tpResena.resena}"),
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }

  _publicar(Puesto puesto, String resena) async {
    String respuesta = await PublishReviewService.publicar(
        idFranquicia: puesto.tpFranquicia.idFranquicia,
        idSucursal: puesto.tpSucursal.idSucursal,
        email: _prefs.email,
        resena: resena);
    if (respuesta == "Reseña cargada exitosamente") {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("EXITO"),
              content: Text(respuesta),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          });
    } else {
      mostrarDialog(context: context, title: 'ERROR', content: respuesta);
    }
  }

  @override
  void initState() {
    super.initState();
    _obtenerImagenCargada(widget.puesto);
    _obtenerFotoCargada(widget.puesto);
    _controllerResena = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(widget.puesto.tpFranquicia.nombreFranquicia,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: (fotoBytes != null)
                        ? Image.memory(
                            fotoBytes,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/no-image.png",
                            fit: BoxFit.cover,
                          )),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "Informacion"),
                      Tab(icon: Icon(Icons.location_pin), text: "Ubicacion"),
                      Tab(icon: Icon(Icons.chat), text: "Reseñas"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            Center(child: _informacion(context, size, widget.puesto)),
            Center(child: _mapa(size, widget.puesto)),
            Center(child: _resenas(size, widget.puesto)),
          ])),
    ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
