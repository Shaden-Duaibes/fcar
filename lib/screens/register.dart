import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

/*class HomeScreen extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase demo'),
      ),
      body: Padding(
          padding: EdgeInsets.all(2),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Read Data From Cloud Fire Store',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Container(
                height: 250,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: StreamBuilder<QuerySnapshot>(
                    stream: users,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot,
                    ) {
                      if (snapshot.hasError) return Text('Error has occurred');
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Text('loading');
                      final data = snapshot.requireData;
                      return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            return Text(
                                'My name is ${data.docs[index]['location']} ,my Age is ${data.docs[index]['date']}, my phone is ${data.docs[index]['number']}');
                          });
                    })),
          ])),
    );
  }
}*/

class MyCustomForm extends StatefulWidget {
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  @override
  final _formKey = GlobalKey<FormState>();
  var location = '';
  var date = '';
  var to = '';
  var number = '';
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
        appBar: AppBar(
          title: Text('Rental'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            alignment: AlignmentDirectional.center,
            child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                suffixIcon: Icon(Icons.place_outlined),
                                hintText: 'What is your location',
                                labelText: 'location',
                              ),
                              onChanged: (value) {
                                location = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your location';
                                }
                                return null;
                              }),
                          SizedBox(height: 15),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              suffixIcon: Icon(Icons.date_range),
                              hintText: 'Enter your date',
                              labelText: 'date',
                            ),
                            onChanged: (value) {
                              date = value;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                suffixIcon: Icon(Icons.date_range),
                                hintText: 'Enter your date',
                                labelText: 'date to',
                              ),
                              onChanged: (value) {
                                to = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your date to';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                suffixIcon: Icon(Icons.phone_android),
                                hintText: 'What is your phone number',
                                labelText: 'Phone Number',
                              ),
                              onChanged: (value) {
                                number = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your Phone Number';
                                }
                                return null;
                              }),
                          SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  users
                                      .add({
                                        'location': location,
                                        'date': date,
                                        'to': to,
                                        'number': number,
                                      })
                                      .then((value) => print('user added'))
                                      .catchError(
                                          (error) => print('Error happened'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Sending data to Firebase')));
                                }
                              },
                              child: Text('Submit'),
                            ),
                          )
                        ])))));
  }
}
