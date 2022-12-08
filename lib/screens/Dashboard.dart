import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/Settings.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Settings.routeName);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Welcome to the Dashboard, ${user.email!}"),
      ),
    );
  }
}
