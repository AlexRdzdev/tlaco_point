import 'package:flutter/material.dart';
import 'package:tlaco_point/resources/AppTheme.dart';

class Loginn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Log In'),
          backgroundColor: AppTheme.primaryDarkColor,
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _usuario(),
              Divider(),
              _password(),
              Divider(),
              RaisedButton(
                onPressed: () {},
                child: Text('Acceder ',
                    style: TextStyle(
                        fontSize: 20, color: AppTheme.secondaryDarkColor)),
                splashColor: AppTheme.primaryColor,
              )
            ]));
  }

  Widget _usuario() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre',
          labelText: 'Nombre_Usuario',
          helperText: 'Nombre de Usuario',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _password() {
    return TextField(
        obscureText: true, //oculta el texto
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock))
        // onChanged: (valor) => setState(() {
        //     _email = valor;
        //}
        );
  }
}
