import 'package:flutter/material.dart';
import 'package:tlaco_point/services/signUpService.dart';

class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nombreController;
  TextEditingController _apellidoController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _nombreController = new TextEditingController();
    _apellidoController = new TextEditingController();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          _botonBack(),
          _textoSuperior(),
          _inputs(),
          _boton(),
        ],
      ),
      bottomNavigationBar: _footer(context),
    );
  }

  Widget _botonBack() {
    return Row(
      children: [
        SizedBox(width: 20.0),
        BackButton(onPressed: () {
          if (ModalRoute.of(context).canPop) Navigator.pop(context);
        }),
      ],
    );
  }

  Widget _textoSuperior() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          children: [
            Text(
              "Comencemos",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Crea una cuenta para ser parte de la comunidad",
              style: TextStyle(
                fontSize: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputs() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            _inputNombre(),
            SizedBox(height: 10),
            _inputApellido(),
            SizedBox(height: 10),
            _inputEmail(),
            SizedBox(height: 20),
            _inputPassword(),
          ],
        ),
      ),
    );
  }

  Widget _inputNombre() {
    return TextField(
      controller: _nombreController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Nombre',
        helperText: 'Sólo un nombre',
        prefixIcon: Icon(Icons.account_circle),
      ),
    );
  }

  Widget _inputApellido() {
    return TextField(
      controller: _apellidoController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Apellido',
        helperText: 'Primer apellido',
        prefixIcon: Icon(Icons.account_circle_outlined),
      ),
    );
  }

  Widget _inputEmail() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _inputPassword() {
    return TextField(
      controller: _passwordController,
      obscureText: true, //oculta el texto
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _boton() {
    return Hero(
      tag: 'signup',
      child: Container(
        padding: EdgeInsets.only(top: 25.00),
        child: ElevatedButton(
          style: ButtonStyle(),
          onPressed: () {
            setState(() {});
            SignUpService.registrar(
                pNOMBRE: _nombreController.text,
                pAPELLIDO_1: _apellidoController.text,
                pEMAIL: _emailController.text,
                pPASSWORD: _passwordController.text);
          },
          child: Text(
            'Crear cuenta',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ya tienes una cuenta?'),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Inicia Sesión'),
          ),
        ],
      ),
    );
  }
}

_registrarUsuario() async {}
