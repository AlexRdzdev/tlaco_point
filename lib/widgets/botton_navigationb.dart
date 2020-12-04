import 'package:flutter/material.dart';

class BottonNavigationb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded), label: 'Cuenta'),
    ]);
  }
}
