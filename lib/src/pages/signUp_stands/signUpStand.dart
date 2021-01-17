import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tlaco_point/blocs/signUp_Stands/signUp_Stand_Bloc.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/resources/AppColors.dart';
import 'package:tlaco_point/services/Stands/signUpStandService.dart';
import 'package:tlaco_point/utils/utils.dart';

class SignUpStand extends StatefulWidget {
  static const String routeName = 'signUpStand';
  SignUpStand({Key key}) : super(key: key);

  @override
  _SignUpStandState createState() => _SignUpStandState();
}

class _SignUpStandState extends State<SignUpStand> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = new Set<Marker>();

  static final _prefs = PreferenciasUsuario();
  SignUpStandBloc _bloc;

  static final CameraPosition initialPosition = CameraPosition(
    target: LatLng(31.657471, -106.429377),
    zoom: 11,
  );

  @override
  void initState() {
    super.initState();
    _bloc = SignUpStandBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registra tu puesto aquí'),
        actions: [
          IconButton(
              icon: Icon(Icons.gps_fixed),
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(initialPosition));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * .04),
            _inputNombre(size, _bloc),
            _inputEspecialidad(size, _bloc),
            _dondePuesto(size),
            _mapa(size, _bloc),
          ],
        ),
      ),
      floatingActionButton: StreamBuilder<Object>(
          stream: _bloc.formValidStream,
          builder: (context, snapshot) {
            return FlatButton.icon(
                onPressed: snapshot.hasData
                    ? () {
                        _validarRegistro(_prefs.email, _bloc.nombre,
                            _bloc.especialidad, _bloc.latLng);
                      }
                    : null,
                color: AppColors.primaryLightColor,
                textColor: AppColors.primaryTextColor,
                icon: Icon(Icons.navigate_next),
                label: Text('Registrar'));
          }),
    );
  }

  _inputNombre(Size size, SignUpStandBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.nombreStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
              vertical: size.height * .01, horizontal: size.width * .05),
          child: TextField(
            keyboardType: TextInputType.name,
            onChanged: bloc.changeNombre,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Nombre del puesto',
              errorText: snapshot.error,
              counterText: snapshot.data,
              prefixIcon: Icon(Icons.store),
            ),
          ),
        );
      },
    );
  }

  _inputEspecialidad(Size size, SignUpStandBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.especialidadStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * .01, horizontal: size.width * .05),
            child: TextField(
              keyboardType: TextInputType.name,
              onChanged: bloc.changeEspecialidad,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                hintText: 'Especialidad del puesto',
                errorText: snapshot.error,
                counterText: snapshot.data,
                helperText: 'Tacos, hamburguesas, etc.',
                prefixIcon: Icon(FontAwesomeIcons.utensils),
              ),
            ),
          );
        });
  }

  _dondePuesto(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * .01, horizontal: size.width * .05),
      alignment: Alignment.centerLeft,
      child: Text(
        'Dónde está tu puesto? Coloca un marcador!',
      ),
    );
  }

  _mapa(Size size, SignUpStandBloc bloc) {
    return StreamBuilder<LatLng>(
        stream: bloc.latLngStream,
        builder: (context, snapshot) {
          return Container(
              padding: EdgeInsets.only(bottom: size.height * .05),
              height: size.height * .55,
              width: size.width * .90,
              child: GoogleMap(
                initialCameraPosition: initialPosition,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                compassEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                buildingsEnabled: false,
                markers: markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onLongPress: (position) => _mostrarMarcador(position, bloc),
              ));
        });
  }

  _mostrarMarcador(LatLng position, SignUpStandBloc bloc) {
    double lat = position.latitude;
    double lng = position.longitude;

    String stringLat = lat.toStringAsFixed(6);
    String stringLng = lng.toStringAsFixed(6);

    lat = double.parse(stringLat);
    lng = double.parse(stringLng);

    LatLng newLatLng = LatLng(lat, lng);

    setState(() {
      markers.clear();
      markers.add(Marker(markerId: MarkerId('marker'), position: newLatLng));
    });

    bloc.changelatLng = newLatLng;
  }

  _validarRegistro(
      email, String nombre, String especialidad, LatLng latLng) async {
    String mensaje = await SignUpStandService.registrar(
        pCORREO: _prefs.email,
        pNOMBRE: _bloc.nombre,
        pESPECIALIDAD: _bloc.especialidad,
        pLATLNG: _bloc.latLng);

    if (mensaje == "Puesto Registrado exitosamente") {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("EXITO"),
              content: Text(mensaje),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          });
      Navigator.pop(context);
    } else {
      mostrarDialog(context: context, title: 'ERROR', content: mensaje);
    }
  }
}
