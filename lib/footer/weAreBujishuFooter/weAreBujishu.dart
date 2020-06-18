import 'package:Bujishu/constant.dart';
import 'package:Bujishu/footer/customerServiceFooter/privacyPolicy.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/aboutUs.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/visionCultureValue.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/workForce.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

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
  @override
  _WeAreBujishuState createState() => _WeAreBujishuState();
}

class _WeAreBujishuState extends State<WeAreBujishuHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Container(
        width: 200,
        child: NavDrawer(),
      ),
      appBar: GeneralAppBar(context),
      body: Container(
        color: black,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'WE ARE BUJISHU',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: gold2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: gold2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                            onPressed: () {
                              setState(() {
//                      _launchMap(context,101,5);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutUsHome()));
                              });
                            },
                            child: Text(
                              'About Us',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: gold2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                            onPressed: () {
                              setState(() {
//                      _launchMap(context,101,5);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VisionCultureValueHome()));
                              });
                            },
                            child: Text(
                              'Our Vision, Culture And Value',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: gold2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'Partner Engagement',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: gold2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                            onPressed: () {
                              setState(() {
//                      _launchMap(context,101,5);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WorkForceHome()));
                              });
                            },
                            child: Text(
                              'Workforce',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 2, 0, 10),
                child: Text(
                  '@2020 Bujishu. All Rights Reserved',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
