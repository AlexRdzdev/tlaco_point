import 'package:flutter/material.dart';
import 'package:tlaco_point/src/search/search_Delegate.dart';

class SearchSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          readOnly: true,
          onTap: () {
            showSearch(
                context: context, delegate: StandSearch(hintText: "Buscar"));
          },
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            hintText: "Buscar",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
