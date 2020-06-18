import 'package:Bujishu/footer/customerServiceFooter/privacyPolicy.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/aboutUs.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/visionCultureValue.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/workForce.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      queryParameters: {
        'subject': 'Example Subject & Symbols are allowed!'
      }
  );

  final Uri _phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+60195726569',

  );
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
//                        _launched = _openUrl('mailto: namikazekamal95@gmail.com');
                        launch(_emailLaunchUri.toString());
                      });
                    }

                  ),
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
                    child: Text('Privacy Policy'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => PrivacyPolicyHome()));
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

