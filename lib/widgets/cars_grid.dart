import 'dart:convert';
import 'package:flcar1/utils/utils.dart';
import 'package:flutter/material.dart';
import '../screens/car_detail.dart';

class CarsGrid extends StatefulWidget {
  @override
  _CarsGridState createState() => _CarsGridState();
}

class _CarsGridState extends State<CarsGrid> {
  //null safety error handling by inserting empty list
  List<dynamic> _carList = [];
  void _getcar() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('../../assets/cars.json');
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
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: _carList.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CarDetail(
                      title: _carList[i]['title'],
                      brand: _carList[i]['brand'],
                      fuel: _carList[i]['fuel'],
                      price: _carList[i]['price'],
                      path: _carList[i]['path'],
                      gearbox: _carList[i]['gearbox'],
                      color: _carList[i]['color'],
                    )));
          },
          child: Container(
              margin: EdgeInsets.only(
                  top: i.isEven ? 0 : 20, bottom: i.isEven ? 20 : 0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, blurRadius: 10, spreadRadius: 5)
                  ]),
              child: Column(
                children: [
                  Hero(
                      tag: _carList[i]['color'],
                      child: Image.asset(_carList[i]['path'])),
                  Text(
                    _carList[i]['title'],
                    style: BasicHeading,
                  ),
                  Text((_carList[i]['price']).toString(), style: SubHeading),
                  Text('per month')
                ],
              )),
        ),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
