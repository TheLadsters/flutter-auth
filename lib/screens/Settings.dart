import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/Login.dart';
import 'package:intro_to_flutter/services/StorageService.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../services/AuthService.dart';

class Settings extends StatefulWidget {
  static String routeName = "/settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isLoading = false;
  StorageService _storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              // await _authService.logout();
              signOut();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Center(
          child: Text("Settings"),
        ),
      ),
    );
  }

  signOut() async {
    setState(() {
      _isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    _storageService.deleteAllData();
    Navigator.of(context).pushNamedAndRemoveUntil(
        Login.routeName, (Route<dynamic> route) => false);

    setState(() {
      _isLoading = false;
    });
  }
}
