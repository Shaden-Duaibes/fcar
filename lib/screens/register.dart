import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

bool drop = false;

class _RegisterState extends State<Register> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 6,
        title: Text("Book a car"),
        centerTitle: true,
      ),
      body: Container(
          width: 900,
          margin: EdgeInsets.all(50),
          color: Colors.blueGrey,
          child: Form(
            key: _key,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("Please fill this form to book the car.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    )),
                Padding(padding: EdgeInsets.all(18)),
                Form(
                    child: Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 490),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.white)),
                              hintText: "Your Location",
                              label: Text(
                                "Location",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.map,
                                color: Colors.white,
                              )),
                        )),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(165, 40, 50, 40)),
                        Checkbox(value: drop, onChanged: ((value) {})),
                        Text("Drop/Pick up at home ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                            )),
                        Text(" 100 Nis extra ",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 490),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.white)),
                              hintText: "From",
                              label: Text(
                                "Pickup Date",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.date_range,
                                color: Colors.white,
                              )),
                        )),
                    Padding(padding: EdgeInsets.all(30)),
                    ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 490),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.white)),
                              hintText: "To",
                              label: Text(
                                "Return Date",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.date_range,
                                color: Colors.white,
                              )),
                        )),
                    Padding(padding: EdgeInsets.all(30)),
                    ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 490),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.white)),
                              hintText: "Phone number",
                              label: Text(
                                "Phone number",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              )),
                          keyboardType: TextInputType.number,
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ))
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
