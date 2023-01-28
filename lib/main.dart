import 'package:flcar1/auth.dart';
import 'package:flcar1/sign_up.dart';
import 'package:flutter/material.dart';
import './screens/cars_overview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental',
      theme: ThemeData(primaryColor: Colors.white),
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _nameController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  String _email = '';
  String _password = '';
  bool _isObscure = true;
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: Colors.lightGreen);
    return MaterialApp(
        home: Scaffold(
      body: Form(
        key: _formKey,
        //padding: const EdgeInsets.all(10),
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/carr.jpg',
                width: 200, height: 200, fit: BoxFit.cover),
          ),
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              )),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            // color: Colors.green,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  _email = value.toString();
                });
                validateEmail(String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter mail';
                  }
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = RegExp(pattern.toString());
                  if (!regex.hasMatch(value.toString())) {
                    return 'Enter Valid Email';
                  } else {
                    return null;
                  }
                }
              },

              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.contact_mail),
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'you@email.com',
              ),
              // The validator receives the text that the user has entered.
            ),
          ),
          Container(
              //  color: Color.fromARGB(0, 8, 83, 49),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextFormField(
                  controller: _passwordController,
                  key: _passKey,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        child: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      labelText: 'Enter Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter password';
                    } else if (value.length < 8) {
                      return 'Password should be more than 8 characters';
                    } else {
                      return null;
                    }
                  })),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: TextButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Forgett password'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
          ),
          GestureDetector(
            onTap: signIn,
            child: Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      const SnackBar(content: Text('Processing Data'));
                      _formKey.currentState!.save();
                      Auth();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => CarsOverviewScreen()));
                    }

                    print(_nameController.text);
                    print(_passwordController.text);
                  },
                )),
          ),
          Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.all(5),
              child: Row(children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: (() {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => FormPage()));
                  }),
                )
              ])),
        ]),
      ),
    ));
  }
}
