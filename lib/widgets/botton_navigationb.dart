import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tlaco_point/providers/ui_provider.dart';

class BottonNavigationb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpt;

    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectMenuOpt = i,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: 'Cuenta'),
        ]);
  }
}
