import 'package:bujishu2/custom_widgets/camera/camera.dart';
import 'package:bujishu2/home/HomeScreen.dart';
import 'package:bujishu2/home/customer_home/nav_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

void main() => runApp(PaymentMethod2());

enum methodFilter { debitorcredit, offline }

class PaymentMethod2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentMethod2Home(),
    );
  }
}

class PaymentMethod2Home extends StatefulWidget {
  @override
  PaymentMethod2State createState() => PaymentMethod2State();
}

class PaymentMethod2State extends State<PaymentMethod2Home> {
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

  void choiceAction(String choice) {
    if (choice == Constants.weRBujishu) {
      print('profile');
    } else if (choice == Constants.contactUs) {
      print('order');
    } else if (choice == Constants.cS) {
      print('cart');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.yellow,
              height: 2,
            ),
            Container(
              height:
                  MediaQuery.of(context).size.height   - appBarHeight - 100,
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
