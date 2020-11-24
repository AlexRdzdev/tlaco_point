import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  //final String _nombre = '';
  //final String _apellido = '';
  //final String _email = '';
  // String _password  = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Registrarse')),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearLastName(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            //  _crearFecha(context),
            Divider(),
            ElevatedButton(
                onPressed: () {},
                child: Text('Registrarse ', style: TextStyle(fontSize: 20)))
          ],
        ));
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Sólo un nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _crearLastName() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Apellido',
          labelText: 'Apellido',
          helperText: 'Primer apellido',
          suffixIcon: Icon(
            Icons.accessibility,
          ),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      // onChanged: (valor) => setState(() {
      //     _email = valor;
      //    }
      //  )
    );
  }

  Widget _crearPassword() {
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
