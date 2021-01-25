import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/services/Stands/getStandPhotoService.dart';
import 'package:tlaco_point/widgets/Gmap.dart';

class DetailStand extends StatefulWidget {
  static const String routeName = 'detalle';

  final Puesto puesto;
  const DetailStand({Key key, this.puesto}) : super(key: key);

  @override
  _DetailStandState createState() => _DetailStandState();
}

class _DetailStandState extends State<DetailStand> {
  Uint8List bytes;

  _informacion(BuildContext context, Size size, Puesto puesto) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * .080),
          Text("Puesto: ${puesto.tpFranquicia.nombreFranquicia}",
              style: Theme.of(context).textTheme.headline4),
          SizedBox(height: size.height * .080),
          Text(
            "Especialidad: ${puesto.tpFranquicia.especialidad}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }

  void _obtenerImagenCargada(Puesto puesto) async {
    final Uint8List bytesDownloaded = await GetStandPhoto.obtener(
        idFranquicia: puesto.tpFranquicia.idFranquicia,
        idSucursal: puesto.tpSucursal.idSucursal);
    if (bytesDownloaded == null) return;
    setState(() {
      bytes = bytesDownloaded;
    });
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

  @override
  void initState() {
    super.initState();
    _obtenerImagenCargada(widget.puesto);
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
                    background: (bytes != null)
                        ? Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/no-image.png",
                            fit: BoxFit.cover,
                          )),
              ),
              SliverPersistentHeader(
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
                pinned: true,
              ),
            ];
          },
          body: TabBarView(children: [
            Center(child: _informacion(context, size, widget.puesto)),
            Center(child: _mapa(size, widget.puesto)),
            Center(child: Text("reseñas")),
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
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
