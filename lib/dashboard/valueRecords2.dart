import 'package:flutter/material.dart';

void main() => runApp(ValueRecords2());

class ValueRecords2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValueRecords2Home(),
    );
  }
}

class ValueRecords2Home extends StatefulWidget {


  @override
  _ValueRecords2State createState() => _ValueRecords2State();
}

class _ValueRecords2State extends State<ValueRecords2Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(

      ),
    );
  }

}

