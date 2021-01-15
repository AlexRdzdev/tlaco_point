import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlaco_point/providers/ui_provider.dart';

import 'package:tlaco_point/src/pages/home_pages/start_page.dart';
import 'package:tlaco_point/src/pages/home_pages/search_page.dart';
import 'package:tlaco_point/src/pages/home_pages/customer_options.dart';

import 'package:tlaco_point/widgets/botton_navigationb.dart';

//lass HomePage extends StatefulWidget {
//@override
//_HomePageState createState() => _HomePageState();

//}

class HomePage extends StatelessWidget {
  static const String routeName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomePageBody(), bottomNavigationBar: BottomNavBar());
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
