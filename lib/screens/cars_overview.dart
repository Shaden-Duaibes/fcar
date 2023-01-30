import 'package:flcar1/utils/utils.dart';
import 'package:flutter/material.dart';
import '../contact.dart';
//import '../fair.dart';
import '../fair.dart';
import '../main.dart';
import '../utils/utils.dart';
import '../widgets/cars_grid.dart';

class CarsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: .4,
          title: Text('Cars Rental', style: SubHeading),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CarLogo(),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 13, 123, 201)),
                accountName: Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text(
                  'HomePage',
                  //style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.book_online),
                title: const Text(
                  'About fair',
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => FancyHelloWidget()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text(
                  'Contact us',
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => Contact()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Log_Out',
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => LoginDemo()));
                },
              ),
            ],
          ),
        ),
        body: CarsGrid());
  }
}

/*
 ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Available Cars',
              style: MainHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarsGrid(),
          )
        ],
      ),*/

class CarLogo extends StatefulWidget {
  const CarLogo({Key? key}) : super(key: key);

  @override
  State<CarLogo> createState() => _CarLogoState();
}

class _CarLogoState extends State<CarLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
          image: NetworkImage(
              'https://t3.ftcdn.net/jpg/04/08/51/18/360_F_408511812_8UGTuX8BieG571jrbmz0PYsqLv1xPrjO.jpg')),
    );
  }
}
