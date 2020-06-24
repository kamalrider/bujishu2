import 'package:Bujishu/dashboard/valueRecords.dart';
import 'package:Bujishu/dashboard/valueRecords2.dart';
import 'package:flutter/material.dart';

void main() => runApp(CustomerDashboard());

class CustomerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomerDashboardHome(),
    );
  }
}

class CustomerDashboardHome extends StatefulWidget {
  @override
  _CustomerDashboardState createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboardHome>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ValueRecords2Home()));
                  },
                  child:  Container(child: Image.asset('assets/images/value_records_dashboard.png')),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  child:  Container(child: Image.asset('assets/images/perfect_list_dashboard.png')),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  child:  Container(child: Image.asset('assets/images/continue_shopping_dashboard.png')),
                ),
              ),

              Flexible(
                flex: 0,
                child: Container(
                  child: Text(
                    '@2020 Bujishu. All Rights Reserved',
                    style: TextStyle(color: Colors.white, fontSize: 12),
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

