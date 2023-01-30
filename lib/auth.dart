import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flcar1/screens/cars_overview.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarsOverviewScreen();
          } else {
            return const LoginDemo();
          }
        });
  }
}
