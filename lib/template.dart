import 'package:flutter/material.dart';

void main() => runApp(Template());

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemplateHome(),
    );
  }
}

class TemplateHome extends StatefulWidget {


  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<TemplateHome> {

  String _valGender;
  String _valFriends;
  List _listGender = ["Male", "Female"];
  List _myFriends = [
    "Clara",
    "John",
    "Rizal",
    "Steve",
    "Laurel",
    "Bernard",
    "Miechel"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
child: Column(
  children: <Widget>[
    DropdownButton(
      hint: Text("Select Your Friends"),
      value: _valFriends,
      items: _myFriends.map((value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _valFriends = value;
        });
      },
    ),
    DropdownButton(
      hint: Text("Select The Gender"),
      value: _valGender,
      items: _listGender.map((value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _valGender = value;
        });
      },
    ),
  ],
),
      ),
    );
  }

}

