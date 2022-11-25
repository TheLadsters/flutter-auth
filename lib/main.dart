import 'package:flutter/material.dart';
import 'package:intro_to_flutter/routes.dart';
import 'package:intro_to_flutter/screens/Login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: Login.routeName,
    debugShowCheckedModeBanner: false,
    routes: routes,
  ));
}
