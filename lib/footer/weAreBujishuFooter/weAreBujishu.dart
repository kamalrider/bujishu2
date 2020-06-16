import 'package:Bujishu/footer/customerServiceFooter/privacyPolicy.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/aboutUs.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/visionCultureValue.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/workForce.dart';
import 'package:flutter/material.dart';

void main() => runApp(WeAreBujishu());

class WeAreBujishu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeAreBujishuHome(),
    );
  }
}

class WeAreBujishuHome extends StatefulWidget {

  String tokens;

  WeAreBujishuHome({Key key, this.tokens}) : super(key: key);

  @override
  _WeAreBujishuState createState() => _WeAreBujishuState();
}

class _WeAreBujishuState extends State<WeAreBujishuHome> {
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
                    child: Text('About Us'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsHome()));
                    },
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    child: Text('Our Vision, Culture, Value'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VisionCultureValueHome()));
                    },
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyHome()));
                    },
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    child: Text('Workforce'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkForceHome()));
                    },
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

