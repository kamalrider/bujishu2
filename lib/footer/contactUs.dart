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

void main() => runApp(ContactUs());

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactUsHome(),
    );
  }
}

class ContactUsHome extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUsHome> {
  Future<void> _launched;

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'bujishu-cs@delhubdigital.com',
      queryParameters: {'subject': 'Please Help me'});

  final Uri _phoneLaunchUri = Uri(
    scheme: 'tel',
    path: '+60321818821',
  );

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _map() async {
    if (Platform.isIOS) {
      await MapLauncher.launchMap(
        mapType: MapType.apple,
        coords: Coords(3.156521, 101.705432),
        title: "Menara Bangkok Bank",
        description: "Bujishu Sdn Bhd",
      );
    } else {
//        await MapLauncher.launchMap(
//          mapType: MapType.google,
//          coords: Coords(3.156521, 101.705432),
//          title: "Menara Bangkok Bank",
//          description: "Bujishu Sdn Bhd",
//        );
      const url = 'http://maps.google.com/maps?q=Menara Bangkok Bank';
      _launchURL(url);
    }
  }

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
                          'OUR CONTACT',
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
                              _map();
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(
                                        Icons.location_on,
                                        color: gold2,
                                      ))),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    '1.26.5, Menara Bangkok Bank,Kuala Lumpur, Malaysia',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
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
//                        _launched = _openUrl('tel:\${+60195726569}');
                              launch(_phoneLaunchUri.toString());
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(
                                        Icons.call,
                                        color: gold2,
                                      ))),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    '03-21818821',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
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
                              _launched = _openUrl(
                                  'mailto: bujishu-cs@delhubdigital.com');
                              launch(_emailLaunchUri.toString());
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(
                                        Icons.email,
                                        color: gold2,
                                      ))),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    'bujishu-cs@delhubdigital.com',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
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
