import 'package:flcar1/screens/register.dart';
import 'package:flcar1/utils/utils.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/specific_card.dart';

class CarDetail extends StatelessWidget {
  final String title;
  final num price;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String path;

  CarDetail(
      {required this.title,
      required this.price,
      required this.color,
      required this.gearbox,
      required this.fuel,
      required this.brand,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.bookmark, size: 30)),
            IconButton(onPressed: null, icon: Icon(Icons.share, size: 30)),
          ],
        ),
        body: Container(
            color: Colors.white,
            child: Column(children: [
              Text(title, style: MainHeading),
              Text(
                brand,
                style: BasicHeading,
              ),
              Image.asset(path, width: 200, height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpecificsCard(
                    name: '12 Month',
                    price: price * 12,
                    name2: 'Dollars',
                  ),
                  SpecificsCard(
                    name: '6 Month',
                    price: price * 6,
                    name2: 'Dollars',
                  ),
                  SpecificsCard(
                    name: '1 Month',
                    price: price * 1,
                    name2: 'Dollars',
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'SPECIFICATIONS',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpecificsCard(
                    name: 'Color',
                    name2: color,
                    price: 2,
                  ),
                  SpecificsCard(
                    name: 'Gearbox',
                    name2: gearbox,
                    price: 2,
                  ),
                  SpecificsCard(
                    name: 'Fuel',
                    name2: fuel,
                    price: 2,
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(14)),
              GestureDetector(
                onTap: () {},
                child: ElevatedButton(
                  onPressed: (() => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => MyCustomForm())),
                      }),
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ])));
  }
}
