import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tlaco_point/preferences/user_preferences.dart';
import 'package:tlaco_point/services/user/logOutService.dart';
import 'package:tlaco_point/src/pages/signUp_stands/signUpStand.dart';

class CustomerThirdPage extends StatefulWidget {
  @override
  _CustomerThirdPageState createState() => _CustomerThirdPageState();
}

class _CustomerThirdPageState extends State<CustomerThirdPage> {
  final _prefs = PreferenciasUsuario();
  String _nombre;
  String _apellido;

  @override
  void initState() {
    super.initState();
    setState(() {
      _nombre = _prefs.nombre;
      _apellido = _prefs.apellido;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.account_circle),
          title: Text('$_nombre $_apellido')),
      body: ListView(
        children: <Widget>[
          // ListTile(
          //     leading: Icon(Icons.account_box), title: Text("Edita tu cuenta")),
          _listOption(),
        ],
      ),
      floatingActionButton: FlatButton.icon(
        icon: FaIcon(FontAwesomeIcons.signOutAlt),
        label: Text('Cerrar sesión'),
        onPressed: () => cerrarSesion(context),
      ),
    );
  }

  void cerrarSesion(BuildContext context) async {
    await LogOutService.cerrarSesion();
    Navigator.of(context).pushReplacementNamed(_prefs.ultimaPagina);
  }

  _listOption() {
    if (_prefs.esDueno) {
      return ListTile(
          leading: Icon(Icons.storefront), title: Text(_prefs.nombrePuesto));
    }
    return ListTile(
        leading: Icon(Icons.add_business),
        title: Text("Registra tu puesto"),
        onTap: () => Navigator.pushNamed(context, SignUpStand.routeName));
  }
}
