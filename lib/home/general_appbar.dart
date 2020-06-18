import 'package:Bujishu/Pay/cart.dart';
import 'package:Bujishu/footer/contactUs.dart';
import 'package:Bujishu/footer/customerServiceFooter/customerService.dart';
import 'package:Bujishu/footer/weAreBujishuFooter/weAreBujishu.dart';
import 'package:Bujishu/home/HomeScreen.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import '../main.dart';

AppBar GeneralAppBar(BuildContext context){



  SharedPreferences sharedPreferences;

  void choiceAction(String choice) {

      if (choice == Constants.weRBujishu) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WeAreBujishuHome()));
      } else if (choice == Constants.contactUs) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsHome()));
      } else if (choice == Constants.cS) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerServiceHome()));
      } else if (choice == Constants.SignOut) {
//        sharedPreferences.clear();
//        sharedPreferences.commit();
//        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(
//                builder: (BuildContext context) => LoginApp()),
//                (Route<dynamic> route) => false);

        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApp()));


      }


  }

  return AppBar(
    iconTheme: new IconThemeData(color: Color(0xfffbcc34)),
    backgroundColor: Colors.black,
    actions: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 50),
//        width: MediaQuery
//            .of()
//            .size
//            .width,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[

            Flexible(
              flex: 1,
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).pop(true),
                        child: Icon(Icons.arrow_back))),

            SizedBox(
              width: 10,
            ),

            Flexible(
              flex: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                    child: Image.asset('assets/images/bujishu_logo.png')),
//              child: Icon(Icons.menu),
              ),
            ),
            Flexible(
              flex: 5,
              child: Row(
                children: <Widget>[
//                      Container(
////                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                        width: 50,
//                        height: 20,
//                        child: MaterialButton(
//                          onPressed: () {
//                            sharedPreferences.clear();
//                            sharedPreferences.commit();
//                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginApp()), (Route<dynamic> route) => false);
//                          },
//                          child: Image.asset(
//                            'assets/images/profile.png',
//                            fit: BoxFit.fitHeight,
//                          ),
//                        ),
//                      ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Image.asset(
                      'assets/images/heart.png',
                      fit: BoxFit.fitHeight,
                      height: 20,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 20,
                      child: InkWell(
                          child: Image.asset(
                            'assets/images/cart.png',
                            fit: BoxFit.fitHeight,
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPageHome()));
                          })),
                  PopupMenuButton<String>(
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

//          Container(
//            margin: EdgeInsets.only(right: 80),
//          ),
    ],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
//            Align(
//                alignment: Alignment.topLeft,
//                child: Container(
//                  margin: EdgeInsets.only(right: 120),
//                  child: Image.asset(
//                    'assets/images/bujishu_logo.png',
//                    fit: BoxFit.contain,
//                    height: 50,
//                  ),
//                ),
//
//            ),

//            Container(
//                padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))

        /*Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.contain,
                height: 20,
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/heart.png',
                fit: BoxFit.contain,
                height: 20,
              ),
            ),

            Container(
              // margin: EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/images/cart.png',
                  fit: BoxFit.contain,
                  height: 20,
                )), */

//            Container(
//                margin: EdgeInsets.only(right: 20),
//                width: 5,
//                child: PopupMenuButton<String>(
//                    onSelected: choiceAction,
//                    itemBuilder: (BuildContext context) {
//                      return Constants.choices.map((String choice) {
//                        return PopupMenuItem<String>(
//                          value: choice,
//                          child: Text(choice),
//                        );
//                      }).toList();
//                    }))
      ],
    ),
  );
}

class Constants {
  static const String weRBujishu = 'WE ARE BUJISHU';
  static const String contactUs = 'Contact Us';
  static const String cS = 'Customer Service';
  static const String facebook = 'Facebook';
  static const String insta = 'Instagram';

//  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
    weRBujishu,
    contactUs,
    cS,
    facebook,
    insta,
    SignOut,
  ];
}