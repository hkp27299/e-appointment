import 'package:flutter/material.dart';
import 'Data/user.dart';

class UserScreen extends StatelessWidget {
  static const routename = '/userscreen';

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi-'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}

