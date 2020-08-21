import 'package:flutter/foundation.dart';

class MyUserData extends ChangeNotifier {
  User _myUserData;

  User get data => _myUserData;
}
