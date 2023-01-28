import 'package:firebase_auth/firebase_auth.dart';
import 'package:flcar1/screens/cars_overview.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return CarsOverviewScreen();
          } else {
            return const LoginDemo();
          }
        }),
      ),
    );
  }
}
