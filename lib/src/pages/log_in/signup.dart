import 'package:flutter/material.dart';
import 'package:tlaco_point/services/signUpService.dart';

class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Size size;
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
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * .10),
            _botonBack(),
            _textoSuperior(),
            _inputs(),
            _boton(context),
          ],
        ),
      ),
      bottomNavigationBar: _footer(context),
    );
  }

  Widget _botonBack() {
    return Row(
      children: [
        SizedBox(width: size.width * .05),
        BackButton(onPressed: () {
          if (ModalRoute.of(context).canPop) Navigator.pop(context);
        }),
      ],
    );
  }

  Widget _textoSuperior() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: size.height * .01),
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
        padding: EdgeInsets.symmetric(horizontal: size.height * .025),
        child: Column(
          children: [
            _inputNombre(),
            SizedBox(height: size.height * .02),
            _inputApellido(),
            SizedBox(height: size.height * .02),
            _inputEmail(),
            SizedBox(height: size.height * .02),
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

  Widget _boton(BuildContext context) {
    return Hero(
      tag: 'signup',
      child: Container(
        padding: EdgeInsets.only(top: size.height * .05),
        child: ElevatedButton(
          style: ButtonStyle(),
          onPressed: () async {
            bool registrado = await _registrarUsuario(
                pNOMBRE: _nombreController.text,
                pAPELLIDO_1: _apellidoController.text,
                pEMAIL: _emailController.text,
                pPASSWORD: _passwordController.text);
            if (registrado) {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Registrado con exito'),
                  );
                },
              );
              Navigator.pushReplacementNamed(context, 'Home');
            } else {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('El correo ya esta registrado'),
                  );
                },
              );
            }
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

_registrarUsuario(
    {String pNOMBRE,
    String pAPELLIDO_1,
    String pEMAIL,
    String pPASSWORD}) async {
  print('parametro: $pEMAIL');
  bool registrado = await SignUpService.registrar(
      pNOMBRE: pNOMBRE,
      pAPELLIDO_1: pAPELLIDO_1,
      pEMAIL: pEMAIL,
      pPASSWORD: pPASSWORD);
  return registrado;
}
