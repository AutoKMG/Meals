import 'package:flutter/material.dart';

class ErrorPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error 404 not found!',
            style: TextStyle(fontSize: 40, fontFamily: 'Raleway-Black'),
            textAlign: TextAlign.center,
          ),
          Text(
            'You have tried to reach a page that does not exist or there is an error occurred while loading',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
