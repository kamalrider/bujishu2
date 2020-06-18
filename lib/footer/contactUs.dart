import 'package:Bujishu/footer/customerServiceFooter/privacyPolicy.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/aboutUs.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/visionCultureValue.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/workForce.dart';
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
      path: 'smith@example.com',
      queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});

  final Uri _phoneLaunchUri = Uri(
    scheme: 'tel',
    path: '+60195726569',
  );

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMap(BuildContext context, lat, lng) async {
    var url = '';
    var urlAppleMaps = '';
    if (Platform.isAndroid) {
      url = "https://www.google.com/maps/search/?api=1&query=${lat},${lng}";
    } else {
      urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';
      url = "comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else if (await canLaunch(urlAppleMaps)) {
      await launch(urlAppleMaps);
    } else {
      throw 'Could not launch $url';
    }}

    _map()async{
      if (Platform.isIOS) {
        await MapLauncher.launchMap(
          mapType: MapType.apple,
          coords: Coords(3.156521, 101.705432),
          title: "Menara Bangkok Bank",
          description: "Bujishu Sdn Bhd",
        );
      } else {
        await MapLauncher.launchMap(
          mapType: MapType.google,
          coords: Coords(3.156521, 101.705432),
          title: "Menara Bangkok Bank",
          description: "Bujishu Sdn Bhd",
        );
      }
    }

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
                      child: Text('Email'),
                      onPressed: () {
                        setState(() {
                        _launched = _openUrl('mailto: namikazekamal95@gmail.com');
                          launch(_emailLaunchUri.toString());
                        });
                      }),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    child: Text('number'),
                    onPressed: () {
                      setState(() {
//                        _launched = _openUrl('tel:\${+60195726569}');
                        launch(_phoneLaunchUri.toString());
                      });
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
                    child: Text('Location'),
                    onPressed: () {
//                      const url = 'http://maps.google.com/maps?q=Menara Bangkok Bank';
//                      _launchURL(url);

                    setState(() {
//                      _launchMap(context,101,5);
                     _map();
                    });

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
