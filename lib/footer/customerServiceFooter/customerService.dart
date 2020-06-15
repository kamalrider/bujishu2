import 'package:flutter/material.dart';

void main() => runApp(CustomerService());

class CustomerService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomerServiceHome(),
    );
  }
}

class CustomerServiceHome extends StatefulWidget {

  String tokens;

  CustomerServiceHome({Key key, this.tokens}) : super(key: key);

  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerServiceHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    child: Text('Bujishu Service'),
                    onPressed: () {},
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    child: Text('Privacy Policy'),
                    onPressed: () {},
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    child: Text('Track and Order'),
                    onPressed: () {},
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    child: Text('FAQ'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

