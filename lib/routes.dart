import 'package:flutter/cupertino.dart';
import 'package:intro_to_flutter/screens/Dashboard.dart';
import 'package:intro_to_flutter/screens/Login.dart';
import 'package:intro_to_flutter/screens/Settings.dart';
import 'package:intro_to_flutter/screens/Signup.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => Login(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  SignUp.routeName: (BuildContext context) => SignUp(),
  Settings.routeName: (BuildContext context) => Settings(),
};
