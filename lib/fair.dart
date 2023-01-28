import 'package:flutter/material.dart';

class FancyHelloWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const BoxFit fit = BoxFit.scaleDown;
    return Scaffold(
        appBar: AppBar(
          title: Text('Features'),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 50),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              alignment: AlignmentDirectional.topStart,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 350,
              child: Image.asset(
                'images/car4.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 150,
              width: 450,
              child: Image.asset(
                'images/car2.jpeg',
                fit: fit,
              ),
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text('Easy and safe rentel'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text('Latest model cars'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text('Fair fuel policy'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text('Widespread branch network'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text('Pest price guarantee '),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text('24/7 service'),
              ],
            ),
          ],
        ));
  }
}
