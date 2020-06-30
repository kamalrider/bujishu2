import 'package:Bujishu/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _value = 42;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: gold2,
          ),
          child: new DropdownButton(
            value: _value,
            items: <DropdownMenuItem<int>>[
              new DropdownMenuItem(
                child: new Text('Foo'),
                value: 0,
              ),
              new DropdownMenuItem(
                child: new Text('Bar'),
                value: 42,
              ),
            ],
            onChanged: (int value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ),
    );
  }
}