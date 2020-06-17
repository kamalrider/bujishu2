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

  String tokens;

  TemplateHome({Key key, this.tokens}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<TemplateHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(

      ),
    );
  }

}

