import 'dart:convert';
import 'package:flcar1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/car_detail.dart';

class CarsGrid extends StatefulWidget {
  @override
  _CarsGridState createState() => _CarsGridState();
}

class _CarsGridState extends State<CarsGrid> {
  //null safety error handling by inserting empty list
  List<dynamic> _carList = [];
  Future<void> _getcar() async {
    String peopleString = await rootBundle.loadString('assets/cars.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _carList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getcar();
  }

  @override
  Widget build(BuildContext context) {
    //Eliminating the drawer because, this is a stand alone program.
    return Scaffold(
      body: _showcar(),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  Widget _showcar() {
    return Container(
        child: GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: _carList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CarDetail(
                      title: _carList[index]['title'],
                      brand: _carList[index]['brand'],
                      fuel: _carList[index]['fuel'],
                      price: _carList[index]['price'],
                      path: _carList[index]['path'],
                      gearbox: _carList[index]['gearbox'],
                      color: _carList[index]['color'],
                    )));
          },
          child: Container(
              margin: EdgeInsets.only(
                  top: index.isEven ? 0 : 20, bottom: index.isEven ? 20 : 0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, blurRadius: 10, spreadRadius: 5)
                  ]),
              child: Column(
                children: [
                  Hero(
                      tag: Text('bt2'),
                      child: Image.asset(_carList[index]['path'])),
                  Text(
                    _carList[index]['title'],
                    style: BasicHeading,
                  ),
                  Text((_carList[index]['price']).toString(),
                      style: SubHeading),
                  Text('per month')
                ],
              )),
        ),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    ));
  }
}
