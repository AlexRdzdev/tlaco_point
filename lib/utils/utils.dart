import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void mostrarDialog({BuildContext context, String title, String content}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}
