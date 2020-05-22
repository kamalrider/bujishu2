import 'package:bujishu2/custom_widgets/camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Text(
              'Contact',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: TextEditingController()..text = 'Test Account',
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
            Text(
              'Contact',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: TextEditingController()..text = 'Test Account',
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
            Text(
              'Contact',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: TextEditingController()..text = 'Test Account',
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
            Text(
              'Contact',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: TextEditingController()..text = 'Test Account',
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
                    child: Text(
                      'Save Card',
                      style: TextStyle(fontSize: 12),
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
                color: Colors.yellow,
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
            Text(
              'Reference Number',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: TextEditingController()..text = 'Test Account',
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
                        border: Border.all(color: Colors.grey)
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
                          border: Border.all(color: Colors.grey)
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
            Text(
              'Payment amount',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: TextEditingController()..text = 'Test Account',
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
                color: Colors.yellow,
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

    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color(0xfffbcc34)),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 50),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: 20,
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
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
                          child: Image.asset(
                            'assets/images/cart.png',
                            fit: BoxFit.fitHeight,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
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
                                  border: Border.all(color: Colors.black),
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
                            Expanded(
                              child: Container(
                                height: h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
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
                            Expanded(
                              child: Container(
                                height: h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
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
                            border: Border.all(color: Colors.grey)
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
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    'Test Account',
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
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    'Test Account',
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
                                          'Address',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Address',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Address',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Address',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Address',
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
                                  color: Colors.blue,
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
            )
          ],
        ),
      ),
    );
  }
}
