import 'package:flutter/material.dart';
import 'package:tlaco_point/resources/AppColors.dart';

class HomePage extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tituo'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de clics',
              style: estiloTexto,
            ),
            Text(
              '1',
              style: estiloTexto,
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              print('hola mundo');
            }),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
