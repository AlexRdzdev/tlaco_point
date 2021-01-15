import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tlaco_point/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user;

  User get user {
    return this._user;
  }

  set user(User user) {
    this._user = user;
    notifyListeners();
  }
}
