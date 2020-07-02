import 'package:flutter/material.dart';

void main() => runApp(Lolo());

class Lolo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoloHome(h: 2,),
    );
  }
}

class LoloHome extends StatefulWidget {
  int h;

  LoloHome({this.h});
  @override
  _LoloState createState() => _LoloState();
}

class _LoloState extends State<LoloHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(widget.h.toString()),
      ),
    );
  }
}
