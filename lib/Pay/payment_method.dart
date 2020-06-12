import 'dart:async';

import 'package:Bujishu/Pay/thank_you_page.dart';
import 'package:Bujishu/constant.dart';
import 'package:Bujishu/custom_widgets/camera/camera.dart';
import 'package:Bujishu/home/HomeScreen.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

void main() => runApp(PaymentMethod());

enum methodFilter { debitorcredit, offline }

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentMethodHome(),
    );
  }
}

class PaymentMethodHome extends StatefulWidget {
  @override
  PaymentMethodState createState() => PaymentMethodState();
}

class PaymentMethodState extends State<PaymentMethodHome> {
  bool _value1 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);

  dynamic _image;

  void openCamera(context) async {
    final image = await CustomCamera.openCamera();

    setState(() {
      _image = image;
    });
  }

  void openGallery(context) async {
    final image = await CustomCamera.openGallery();

    setState(() {
      _image = image;
    });
  }

  methodFilter filter = methodFilter.debitorcredit;

  Color creditDebitBgColor;
  Color offlineBgColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    double h = 120;
    double appBarHeight = AppBar().preferredSize.height;


    Widget showImage() {
      if (_image != null) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Image.memory(
            _image,
            fit: BoxFit.fitHeight,
          ),
        );
      } else {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Image.asset(
            'assets/images/pic.png',
            fit: BoxFit.fitHeight,
          ),
        );
      }
    }

    Widget CreditDebitFill() {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Card Number',
                  //textAlign: TextAlign.center,
                ),
                Text('*',style: TextStyle(color: Colors.red),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                child: TextFormField(
                  controller: TextEditingController()..text = '',
                  textAlign: TextAlign.center,
                  onChanged: (text) => {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Name on Card ',
                  //textAlign: TextAlign.center,
                ),
                Text('*',style: TextStyle(color: Colors.red),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                child: TextFormField(
                  controller: TextEditingController()..text = '',
                  textAlign: TextAlign.center,
                  onChanged: (text) => {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Expiration Date ',
                  //textAlign: TextAlign.center,
                ),
                Text('*',style: TextStyle(color: Colors.red),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                child: TextFormField(
                  controller: TextEditingController()..text = '',
                  textAlign: TextAlign.center,
                  onChanged: (text) => {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CVV ',
                  //textAlign: TextAlign.center,
                ),
                Text('*',style: TextStyle(color: Colors.red),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                child: TextFormField(
                  controller: TextEditingController()..text = '',
                  textAlign: TextAlign.center,
                  onChanged: (text) => {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(value: _value1, onChanged: _value1Changed),
                  Container(
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'I agree to the  ',
                          //textAlign: TextAlign.center,
                        ),
                        Text('terms and conditions',style: TextStyle(color: Colors.blue),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
              child: Text(
                  'I acknowledge that my card information is saved in my Bujishu account (You will still need to provide CVV for each transaction).',textAlign: TextAlign.center, style: TextStyle(fontSize: 10),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 30,
              
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: MaterialButton(
                  child: Text('Pay Now'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget OfflinePayment() {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Reference Number ',
                  textAlign: TextAlign.center,
                ),
                Text('*', style: TextStyle(color: Colors.red),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                child: TextFormField(
                  controller: TextEditingController()..text = '',
                  textAlign: TextAlign.center,
                  onChanged: (text) => {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                  ),
                ),
              ),
            ),
            showImage(),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),

                      ),
                      child: MaterialButton(
                          child: Text('Camera'),
                          onPressed: () {
                            openCamera(context);
                          }),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),

                      ),
                      child: MaterialButton(
                        child: Text('Gallery'),
                        onPressed: () {
                          openGallery(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Payment amount ',
                  textAlign: TextAlign.center,
                ),
                Text('*',style: TextStyle(color: Colors.red),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                child: TextFormField(
                  controller: TextEditingController()..text = '',
                  textAlign: TextAlign.center,
                  onChanged: (text) => {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.yellow,

                ),
                child: MaterialButton(
                  onPressed: (){
                    // set up the button



                    Widget okButton = FlatButton(
                      child: Text("YES"),
                      onPressed: () {
                        generalToast('Your payment is processing');
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                        Timer(Duration(seconds: 3), () {
                          Widget okButton = FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ThankYouPage()));

                              Navigator.of(context, rootNavigator: true).pop('dialog');
//                        generalToast('Your payment already submitted');


                            },
                          );

                          // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                            title: Text("Congratulation!!!"),
                            content: Text("Your payment have been submitted"),
                            actions: [
                              okButton,
                            ],
                          );

                          // show the dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );

                        });
//                        Navigator.of(context, rootNavigator: true).pop('dialog');
//                        generalToast('Your payment already submitted');



                      },
                    );

                    Widget noButton = FlatButton(
                      child: Text("NO"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop('dialog');
//                        generalToast('Your payment already submitted');


                      },
                    );

                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: Text("Confirmation"),
                      content: Text("Are you sure want to submit your Payment"),
                      actions: [
                        okButton,
                        noButton,
                      ],
                    );

                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: Text('Submit Payment'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget filterContainer() {
      switch (filter) {
        case methodFilter.debitorcredit:
          return CreditDebitFill();
        case methodFilter.offline:
          return OfflinePayment();
      }
      return CreditDebitFill();
    }

    setState(() {
      if ( filter == methodFilter.debitorcredit){
        creditDebitBgColor = Colors.grey;
        offlineBgColor = Colors.white;
      } else if (filter == methodFilter.offline){
        creditDebitBgColor = Colors.white;
        offlineBgColor = Colors.grey;
      }
    });

    return Scaffold(
      drawer: Container(
        width: 200,
        child: NavDrawer(),
      ),
      appBar:
          GeneralAppBar(context),
//      AppBar(
//        iconTheme: new IconThemeData(color: Color(0xfffbcc34)),
//        backgroundColor: Colors.black,
//        actions: <Widget>[
//          Container(
//            padding: EdgeInsets.only(left: 50),
////        width: MediaQuery
////            .of()
////            .size
////            .width,
//            width: MediaQuery.of(context).size.width,
//            child: Row(
//              children: <Widget>[
//                Flexible(
//                  flex: 7,
//                  child: Align(
//                    alignment: Alignment.topLeft,
//                    child: Image.asset('assets/images/bujishu_logo.png'),
////              child: Icon(Icons.menu),
//                  ),
//                ),
//                Flexible(
//                  flex: 5,
//                  child: Row(
//                    children: <Widget>[
////                      Container(
//////                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
////                        width: 50,
////                        height: 20,
////                        child: MaterialButton(
////                          onPressed: () {
////                            sharedPreferences.clear();
////                            sharedPreferences.commit();
////                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginApp()), (Route<dynamic> route) => false);
////                          },
////                          child: Image.asset(
////                            'assets/images/profile.png',
////                            fit: BoxFit.fitHeight,
////                          ),
////                        ),
////                      ),
//                      Container(
//                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                        child: Image.asset(
//                          'assets/images/heart.png',
//                          fit: BoxFit.fitHeight,
//                          height: 20,
//                        ),
//                      ),
//                      Container(
//                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                          height: 20,
//                          child: InkWell(
//                              child: Image.asset(
//                                'assets/images/cart.png',
//                                fit: BoxFit.fitHeight,
//                              ),
//                              onTap: () {
//                                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPageHome()));
//                              })),
//                      PopupMenuButton<String>(
//                        onSelected: choiceAction,
//                        itemBuilder: (BuildContext context) {
//                          return Constants.choices.map((String choice) {
//                            return PopupMenuItem<String>(
//                              value: choice,
//                              child: Text(choice),
//                            );
//                          }).toList();
//                        },
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//
////          Container(
////            margin: EdgeInsets.only(right: 80),
////          ),
//        ],
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: [
////            Align(
////                alignment: Alignment.topLeft,
////                child: Container(
////                  margin: EdgeInsets.only(right: 120),
////                  child: Image.asset(
////                    'assets/images/bujishu_logo.png',
////                    fit: BoxFit.contain,
////                    height: 50,
////                  ),
////                ),
////
////            ),
//
////            Container(
////                padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))
//
//            /*Container(
//              margin: EdgeInsets.only(right: 10),
//              child: Image.asset(
//                'assets/images/profile.png',
//                fit: BoxFit.contain,
//                height: 20,
//              ),
//            ),
//
//            Container(
//              margin: EdgeInsets.only(right: 10),
//              child: Image.asset(
//                'assets/images/heart.png',
//                fit: BoxFit.contain,
//                height: 20,
//              ),
//            ),
//
//            Container(
//              // margin: EdgeInsets.only(right: 10),
//                child: Image.asset(
//                  'assets/images/cart.png',
//                  fit: BoxFit.contain,
//                  height: 20,
//                )), */
//
////            Container(
////                margin: EdgeInsets.only(right: 20),
////                width: 5,
////                child: PopupMenuButton<String>(
////                    onSelected: choiceAction,
////                    itemBuilder: (BuildContext context) {
////                      return Constants.choices.map((String choice) {
////                        return PopupMenuItem<String>(
////                          value: choice,
////                          child: Text(choice),
////                        );
////                      }).toList();
////                    }))
//          ],
//        ),
//      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.yellow,
              height: 2,
            ),
            Container(
              height:
                  MediaQuery.of(context).size.height  - appBarHeight - 2 - 40,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([

                      SizedBox(height: 10,),
                      Text('Select Payment Method', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: h,
                                decoration: BoxDecoration(
                                  color: creditDebitBgColor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black)
                                ),
                                child: MaterialButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                            'assets/images/credit_debit_card_01.png'),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Credit/Debit Card',
                                            textAlign: TextAlign.center,
                                          )),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      filter = methodFilter.debitorcredit;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 2,),
                            Expanded(
                              child: Container(
                                height: h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: MaterialButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                            'assets/images/online_banking_01.png'),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Online Banking',
                                            textAlign: TextAlign.center,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 2,),
                            Expanded(
                              child: Container(
                                height: h,
                                decoration: BoxDecoration(
                                  color: offlineBgColor,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: MaterialButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                            'assets/images/offline_payment_01.png'),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Offline Payment',
                                            textAlign: TextAlign.center,
                                          )),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      filter = methodFilter.offline;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 5,),
                              Text(
                                'Name',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    'Raja Muhammad Kamal Bin Raja Badly',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    border: Border.all(color: Colors.black)),
//                                child: TextFormField(
//                                  controller: TextEditingController()
//                                    ..text = 'Test Account',
//                                  textAlign: TextAlign.center,
//                                  onChanged: (text) => {},
//                                  cursorColor: Colors.black,
//                                  decoration: InputDecoration(
//                                    border: InputBorder.none,
//                                    focusedBorder: InputBorder.none,
//                                    enabledBorder: InputBorder.none,
//                                    errorBorder: InputBorder.none,
//                                    disabledBorder: InputBorder.none,
////                                      contentPadding: EdgeInsets.only(
////                                          left: 15,
////                                          bottom: 11,
////                                          top: 11,
////                                          right: 15),
//                                  ),
//                                ),
//                              ),
//                            ),
                              Text(
                                'Contact',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    '019-5726569',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    border: Border.all(color: Colors.black)),
//                                child: TextFormField(
//                                  controller: TextEditingController()
//                                    ..text = 'Test Account',
//                                  textAlign: TextAlign.center,
//                                  onChanged: (text) => {},
//                                  cursorColor: Colors.black,
//                                  decoration: InputDecoration(
//                                    border: InputBorder.none,
//                                    focusedBorder: InputBorder.none,
//                                    enabledBorder: InputBorder.none,
//                                    errorBorder: InputBorder.none,
//                                    disabledBorder: InputBorder.none,
////                                      contentPadding: EdgeInsets.only(
////                                          left: 15,
////                                          bottom: 11,
////                                          top: 11,
////                                          right: 15),
//                                  ),
//                                ),
//                              ),
//                            ),

                              Text(
                                'Address',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5,),
                               Container(
                                 width: MediaQuery.of(context).size.width * 0.8,
                                 decoration: BoxDecoration(
                                   border: Border.all(color: Colors.grey),
                                   borderRadius: BorderRadius.circular(5),
                                 ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
//                                    TextFormField(
//                                      controller: TextEditingController()
//                                        ..text = 'Test Account',
//                                      textAlign: TextAlign.center,
//                                      onChanged: (text) => {},
//                                      cursorColor: Colors.black,
//                                      decoration: InputDecoration(
//                                        border: InputBorder.none,
//                                        focusedBorder: InputBorder.none,
//                                        enabledBorder: InputBorder.none,
//                                        errorBorder: InputBorder.none,
//                                        disabledBorder: InputBorder.none,
////                                      contentPadding: EdgeInsets.only(
////                                          left: 15,
////                                          bottom: 11,
////                                          top: 11,
////                                          right: 15),
//                                      ),
//                                    ),
//                                    TextFormField(
//                                      controller: TextEditingController()
//                                        ..text = 'Test Account',
//                                      textAlign: TextAlign.center,
//                                      onChanged: (text) => {},
//                                      cursorColor: Colors.black,
//                                      decoration: InputDecoration(
//                                        border: InputBorder.none,
//                                        focusedBorder: InputBorder.none,
//                                        enabledBorder: InputBorder.none,
//                                        errorBorder: InputBorder.none,
//                                        disabledBorder: InputBorder.none,
////                                      contentPadding: EdgeInsets.only(
////                                          left: 15,
////                                          bottom: 11,
////                                          top: 11,
////                                          right: 15),
//                                      ),
//                                    ),
//                                    TextFormField(
//                                      controller: TextEditingController()
//                                        ..text = 'Test Account',
//                                      textAlign: TextAlign.center,
//                                      onChanged: (text) => {},
//                                      cursorColor: Colors.black,
//                                      decoration: InputDecoration(
//                                        border: InputBorder.none,
//                                        focusedBorder: InputBorder.none,
//                                        enabledBorder: InputBorder.none,
//                                        errorBorder: InputBorder.none,
//                                        disabledBorder: InputBorder.none,
////                                      contentPadding: EdgeInsets.only(
////                                          left: 15,
////                                          bottom: 11,
////                                          top: 11,
////                                          right: 15),
//                                      ),
//                                    ),
//                                    TextFormField(
//                                      controller: TextEditingController()
//                                        ..text = 'Test Account',
//                                      textAlign: TextAlign.center,
//                                      onChanged: (text) => {},
//                                      cursorColor: Colors.black,
//                                      decoration: InputDecoration(
//                                        border: InputBorder.none,
//                                        focusedBorder: InputBorder.none,
//                                        enabledBorder: InputBorder.none,
//                                        errorBorder: InputBorder.none,
//                                        disabledBorder: InputBorder.none,
////                                      contentPadding: EdgeInsets.only(
////                                          left: 15,
////                                          bottom: 11,
////                                          top: 11,
////                                          right: 15),
//                                      ),
//                                    ),
//                                    TextFormField(
//                                      controller: TextEditingController()
//                                        ..text = 'Test Account',
//                                      textAlign: TextAlign.center,
//                                      onChanged: (text) => {},
//                                      cursorColor: Colors.black,
//                                      decoration: InputDecoration(
//                                        border: InputBorder.none,
//                                        focusedBorder: InputBorder.none,
//                                        enabledBorder: InputBorder.none,
//                                        errorBorder: InputBorder.none,
//                                        disabledBorder: InputBorder.none,
////                                      contentPadding: EdgeInsets.only(
////                                          left: 15,
////                                          bottom: 11,
////                                          top: 11,
////                                          right: 15),
//                                      ),
//                                    ),
                                        Text(
                                          'No. 21, Jalan Ampang',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Bandar Sunway',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'PJ',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '46050',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Selangor',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              SizedBox(height: 5,),

                              Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: 30,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue,
                                  ),
                                  child: MaterialButton(
                                    child: Text('Edit'),
                                  ),
                                ),

                              SizedBox(height: 5,),

                              filterContainer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 5,),
                              Text('Order Summary'),
                              SizedBox(height: 5,),
                              Text(
                                  'Subtotal (2 item(s) and shipping fee included)'),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Total Amount'),
                                    Text('RM1839.00'),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('We Accept', textAlign: TextAlign.center,),
                      Container(
                        height: 100,
                        child: Image.asset(
                          'assets/images/visa_mastercard.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                      ),

                    ]),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                child: Text('@2020 Bujishu. All Rights Reserved', style: TextStyle(color: Colors.black, fontSize: 12),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
