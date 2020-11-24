import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Log In')),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _usuario(),
              Divider(),
              _password(),
              Divider(),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {},
                  child: Text('Acceder ', style: TextStyle(fontSize: 20)))
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
