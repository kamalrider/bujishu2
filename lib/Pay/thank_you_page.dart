import 'package:Bujishu/home/HomeScreen.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(ThankYouPage());

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThankYouPageHome(),
    );
  }
}

class ThankYouPageHome extends StatefulWidget {
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPageHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Container(
        width: 200,
        child: NavDrawer(),
      ),
      appBar: GeneralAppBar(context),
      body: Center(
        child: Center(

          child: Container(
            padding: const EdgeInsets.all(8.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Text(
                  'Thank you! Your order has been placed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your order number is BJN20200000063.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffD4AF37),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text('Go To Home',style: TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
