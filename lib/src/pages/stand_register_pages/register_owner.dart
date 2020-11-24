import 'package:flutter/material.dart';

class RegisterOwner extends StatefulWidget {
  @override
  _RegisterOwnerState createState() => _RegisterOwnerState();
}

class _RegisterOwnerState extends State<RegisterOwner> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text.rich(
              TextSpan(
                text: 'Para registrar tu puesto primero inicia sesión.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _correo(),
          Divider(),
          _password(),
          Divider(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {}
            },
            child: Text(
              'Iniciar sesión',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _correo() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Correo Electronico',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Porfavor introduce tu email';
        }
        return null;
      },
    );
  }

  Widget _password() {
    return TextFormField(
      obscureText: true, //oculta el texto
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Porfavor introduce tu contraseña';
        }
        return null;
      },
    );
  }
}
