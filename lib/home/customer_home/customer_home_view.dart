import 'package:Bujishu/product_and_category/model/category.dart';
import 'package:Bujishu/product_and_category/model/productlist.dart';
import 'package:Bujishu/product_and_category/view/product_by_categoryqwer2.dart';
import 'package:Bujishu/product_and_category/view/product_detail.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../template.dart';
import '../token.dart';

class CustomerHome1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarouselWithIndicator(),
    );
  }
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  String jtoken = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device Token: $deviceToken");
      jtoken = deviceToken;
    });
  }

  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        _setMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _setMessage(message);
      },
    );
  }

  _setMessage(Map<String, dynamic> message) {
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['message'];
    setState(() {
      Message m = Message(title, body, mMessage);
      _messages.add(m);
    });
  }

  List<Message> _messages;

  List<String> _locations = ['All CAtegories (VVIP)']; // Option 2
  String _selectedLocation; // Option 2
  bool nextPage = false;

  int _current = 0;
  List<String> imageList = [
    'assets/images/banner_best_seller_mobile.jpg',
    'assets/images/banner_dc_home_design_mobile.jpg',
    'assets/images/banner_top_rated_mobile.jpg'
  ];

  List<Category> datas = ProductList.categoryList;

  //Map<String, int> map = {imageList:_current};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getToken();
    _configureFirebaseListeners();
    _messages = List<Message>();
  }

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height * 0.07;

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 2,
              ),

              Flexible(
                  flex: 5,
                  child: Column(children: <Widget>[
                    Container(
                      height: 2,
                      color: Color(0xffD4AF37),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.black,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Carousel(
                          boxFit: BoxFit.fitWidth,
                          images: [
                            AssetImage(
                                'assets/images/banner_best_seller_mobile.jpg'),
                            AssetImage(
                                'assets/images/banner_dc_home_design_mobile.jpg'),
                            AssetImage(
                                'assets/images/banner_top_rated_mobile.jpg'),
                          ],

                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 2000),
                          //dotBgColor: Colors.purple.withOpacity(0.5),
                          indicatorBgPadding: 5.0,
                          //moveIndicatorFromBottom: -15,
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          dotColor: Color(0xfffbcc34),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: 2,
                      color: Color(0xffD4AF37),
                    ),
                  ])),

              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: y,
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: Text(
                      'Popular Categories',
                      style: TextStyle(
                        color: Color(0xffD4AF37),
                        fontSize: y,
                        fontFamily: 'Tangerine',
                        //decoration: TextDecoration.underline,
                        decorationColor: Color(0xfffbcc34),
                      ),
                    ),
                  ),
                ),
              ),

              Flexible(
                fit: FlexFit.tight,
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: FutureBuilder<List<Modelt>>(
                    future: fetchAlbum(),
                    builder: (context, snapshot) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1.2),
                          itemCount: ProductList.categoryList.length,
                          itemBuilder: (context, index) {
                            final item = ProductList.categoryList[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8),
                              child: Container(
                                child: MaterialButton(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Image.asset(
                                          item.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                            color: Color(0xffD4AF37),
                                            fontSize: 21,
                                            fontFamily: 'Tangerine'),
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    var childRoute = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new ProductCategoryHomeAPI(
                                        valueId: item.id,
                                        valueApi: item.APIid,
                                      ),
                                    );

                                    var productRoute = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new ProductDetailHome(
                                        value: item.APIid,
                                        pageKey: 0,
                                      ),
                                    );
                                    if (snapshot.hasData) {
                                      if (snapshot.data
                                              .where((i) =>
                                                  i.parentCategoryId ==
                                                  item.APIid)
                                              .toList()
                                              .length >
                                          0)
                                        Navigator.of(context).push(childRoute);
                                      else if (snapshot.data
                                              .where((i) =>
                                                  i.parentCategoryId ==
                                                  item.APIid)
                                              .toList()
                                              .length ==
                                          0)
                                        Navigator.of(context)
                                            .push(productRoute);
                                    } else {
                                      Navigator.of(context).push(childRoute);
                                    }
                                  },
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),

//uncommend
              SizedBox(
                height: 10,
              ),

              Flexible(
                flex: 1,
                child: Container(
                  child: InkWell(
                    onTap: () {
                      var childRoute = new MaterialPageRoute(
                        builder: (BuildContext context) => new TemplateHome(
                          tokens: jtoken,
                        ),
                      );

                      Navigator.push(context, childRoute);
                    },
                    child: Text(
                      '@2020 Bujishu. All Rights Reserved',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryIcon() {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 3,
        itemBuilder: (context, index) {
          final item = ProductList.categoryList[index];
          return Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Image.asset('assets/images/ligthing.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: InkWell(
                child: Text(
                  item.name,
                  style: TextStyle(color: Color(0xfffbcc34), fontSize: 8),
                  textAlign: TextAlign.center,
                ),
//                onTap: () {
//                  var route = new MaterialPageRoute(
//                    builder: (BuildContext context) =>
//                    new ProductCategoryHome(
//                        value: 'Lighting'),
//                  );
//                  Navigator.of(context).push(route);
//                },
              ),
            )
          ]);
        });
  }
}

class Message {
  String title;
  String body;
  String message;

  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}
