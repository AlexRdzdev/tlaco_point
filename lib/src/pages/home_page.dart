import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlaco_point/providers/ui_provider.dart';
import 'package:tlaco_point/widgets/botton_navigationb.dart';

import 'Preferences_user/customer_options.dart';
import 'Preferences_user/search_page.dart';
import 'Preferences_user/start_page.dart';

//lass HomePage extends StatefulWidget {
//@override
//_HomePageState createState() => _HomePageState();

//}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Historial'),
          actions: [
            IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
          ],
        ),
        body: _HomePageBody(),
        bottomNavigationBar: BottonNavigationb());
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpt;

    switch (currentIndex) {
      case 0:
        return StartFirstPage();
      case 1:
        return SearchSecondPage();
      case 2:
        return CustomerThirdPage();
      default:
        return StartFirstPage();
    }
  }
}
