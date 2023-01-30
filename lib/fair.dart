import 'package:flutter/material.dart';

class FancyHelloWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const BoxFit fit = BoxFit.scaleDown;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Container(
              alignment: AlignmentDirectional.bottomStart,
              child: IconButton(
                // alignment: AlignmentDirectional.topEnd,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
          title: Text('Features'),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 35, color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 350,
              child: Image.asset(
                'assets/car4.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 150,
              width: 450,
              child: Image.asset(
                'assets/car2.jpg',
                fit: fit,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.check_box),
                Text('Easy and safe rentel'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Icon(Icons.check_box),
                Text('Latest model cars'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.check_box),
                Text('Fair fuel policy'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.check_box),
                Text('Widespread branch network'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.check_box),
                Text('Pest price guarantee '),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.check_box),
                Text('24/7 service'),
              ],
            ),
          ],
        ));
  }
}
