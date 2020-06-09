import 'package:bujishu2/APITutorial/PostAPI3.dart';
import 'package:bujishu2/Pay/cart.dart';
import 'package:bujishu2/home/customer_home/nav_drawer.dart';
import 'package:bujishu2/product_and_category/model/category.dart';
import 'package:bujishu2/product_and_category/model/productlist.dart';
import 'package:bujishu2/product_and_category/view/product_by_category.dart';
import 'package:bujishu2/product_and_category/view/product_by_categoryqwer2.dart';
import 'package:bujishu2/product_and_category/view/product_detail.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login.dart';

void main() => runApp(CustomerHome1());

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

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginApp()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery
        .of(context)
        .size
        .height * 0.07;
    int z = y.toInt();

    return Scaffold(
      drawer: Container(
        width: 200,
        child: NavDrawer(),
      ),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color(0xfffbcc34)),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 50),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 7,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/images/bujishu_logo.png'),
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
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPageHome()));
                            }
                          )),
                      PopupMenuButton<String>(
                        onSelected: choiceAction,
                        itemBuilder: (BuildContext context){
                          return Constants.choices.map((String choice){
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),);
                          })
                              .toList();
                        }
                        ,),
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
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
//uncommend
              Flexible(
                  flex: 2,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02,
                    ),
                    Container(
                      width: 335,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.05,

                      //color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: DropdownButton(
                              hint: Text(
                                ' Categories',
                                style: TextStyle(fontSize: 10),
                              ),
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                _selectedLocation = newValue;
                              },
                              items: _locations.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    location,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            width: 2,
                            color: Color(0xfffbcc34),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                            child: TextField(),
                          ),
                          Container(
                            width: 2,
                            color: Color(0xfffbcc34),
                          ),
                          Container(
                            width: 30,
                            padding: EdgeInsets.fromLTRB(
                              8,
                              8,
                              8,
                              8,
                            ),
                            child: Image.asset(
                              'assets/images/search.png',
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        ],
                      ),
                    ),
                  ])),

//uncommend
//              Divider(
//                thickness: 2,
//                color: Color(0xffD4AF37),
//              ),

              Flexible(
                  flex: 5,
                  child: Column(children: <Widget>[
                    Container(
                      height: 2,
                      color: Color(0xffD4AF37),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.black,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.20,
//            padding: EdgeInsets.only(left: 50,right: 50),
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    Container(
                      height: 2,
                      color: Color(0xffD4AF37),
                    ),
                  ])),

//uncommend
//              SizedBox(
//                height: 10,
//              ),

//              Positioned(
//                  top: 0.0,
//                  left: 0.0,
//                  right: 0.0,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
////                    children: map<Widget>(imageList, (index, url) {
////                      return Container(
////                        width: 8.0,
////                        height: 8.0,
////                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
////                        decoration: BoxDecoration(
////                            shape: BoxShape.circle,
////                            color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
////                        ),
////                      );
////                    }),
//                  )
//              ),
              /* Align(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/

//uncommend
//              SizedBox(
//                height: 5,
//              ),

//uncommend
//              SizedBox(
//                height: 0,
//              ),

              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: y,
                    margin: EdgeInsets.only(top: 5, bottom: 5, left: 20),
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
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: FutureBuilder<List<Modelt>>(
                    future: fetchAlbum(),
                    builder: (context,snapshot){

                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1.2),
                          itemCount: ProductList.categoryList.length,
                          itemBuilder: (context, index) {
                            final item = ProductList.categoryList[index];
                            return Padding(
                              padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
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
                                      new ProductCategoryHomeAPI(value: item),
                                    );

                                    var productRoute = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      new ProductDetailHome(value: item.APIid, pageKey: 0,),
                                    );
                                      if (snapshot.hasData){
                                        if (snapshot.data.where((i)=> i.parentCategoryId == item.APIid).toList().length > 0 )
                                          Navigator.of(context).push(childRoute);
                                        else if (snapshot.data.where((i)=> i.parentCategoryId == item.APIid).toList().length == 0 )
                                          Navigator.of(context).push(productRoute);
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
//                child: Column(
//                  children: <Widget>[
//                    Align(
//                      alignment: Alignment.center,
//                      child: Padding(
//                        padding: EdgeInsets.only(left: 15, right: 15),
//
//                        child: Container(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                          child: categoryIcon(),
//
//                        ),
                //categoryIcon(),color: Colors.red,

                //start
//                        child: Column(
//                          children: <Widget>[
//                            Row(
//                              children: <Widget>[
//                                Expanded(
//                                  child: Column(
//                                    children: <Widget>[
//                                      Container(
//                                        height:
//                                            MediaQuery.of(context).size.height *
//                                                0.12,
//                                        //color: Colors.red,
//                                        child: Image.asset(
//                                            'assets/images/bed.png'),
//                                      ),
//                                      Container(
//                                        margin: EdgeInsets.only(top: 5),
//                                        child: Text(
//                                          'BEDSHEET',
//                                          style: TextStyle(
//                                            color: Color(0xfffbcc34),
//                                            fontSize: 8,
//                                          ),
//                                          textAlign: TextAlign.center,
//                                        ),
//                                      )
//                                    ],
//                                  ),
//                                ),
//                                Expanded(
//                                    child: Column(children: <Widget>[
//                                  Container(
//                                    height: MediaQuery.of(context).size.height *
//                                        0.12,
//                                    child: Image.asset(
//                                        'assets/images/curtain.png'),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(top: 5),
//                                    child: Text(
//                                      'CURTAIN',
//                                      style: TextStyle(
//                                          color: Color(0xfffbcc34),
//                                          fontSize: 8),
//                                      textAlign: TextAlign.center,
//                                    ),
//                                  )
//                                ])),
//                                Expanded(
//                                    child: Column(children: <Widget>[
//                                  Container(
//                                    height: MediaQuery.of(context).size.height *
//                                        0.12,
//                                    child: Image.asset(
//                                        'assets/images/ligthing.png'),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(top: 5),
//                                    child: InkWell(
//                                      child: Text(
//                                        'LIGHTING',
//                                        style: TextStyle(
//                                            color: Color(0xfffbcc34),
//                                            fontSize: 8),
//                                        textAlign: TextAlign.center,
//                                      ),
//                                      onTap: () {
//                                        var route = new MaterialPageRoute(
//                                          builder: (BuildContext context) =>
//                                              new ProductCategoryHome(
//                                                  value: 'Lighting'),
//                                        );
//                                        Navigator.of(context).push(route);
//                                      },
//                                    ),
//                                  )
//                                ])),
//                              ],
//                            ),
//                            SizedBox(
//                              height: MediaQuery.of(context).size.height * 0.02,
//                            ),
//                            Row(
//                              children: <Widget>[
//                                Expanded(
//                                    child: Column(children: <Widget>[
//                                  Container(
//                                    height: MediaQuery.of(context).size.height *
//                                        0.12,
//                                    child: Image.asset(
//                                        'assets/images/mattress.png'),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(top: 5),
//                                    child: Text(
//                                      'WALLPAPER',
//                                      style: TextStyle(
//                                          color: Color(0xfffbcc34),
//                                          fontSize: 8),
//                                      textAlign: TextAlign.center,
//                                    ),
//                                  )
//                                ])),
//                                Expanded(
//                                    child: Column(children: <Widget>[
//                                  Container(
//                                    height: MediaQuery.of(context).size.height *
//                                        0.12,
//                                    child:
//                                        Image.asset('assets/images/roll.png'),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(top: 5),
//                                    child: Text(
//                                      'CARPET',
//                                      style: TextStyle(
//                                          color: Color(0xfffbcc34),
//                                          fontSize: 8),
//                                      textAlign: TextAlign.center,
//                                    ),
//                                  )
//                                ])),
//                                Expanded(
//                                    child: Column(children: <Widget>[
//                                  Container(
//                                    height: MediaQuery.of(context).size.height *
//                                        0.12,
//                                    child:
//                                        Image.asset('assets/images/paint.png'),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(top: 5),
//                                    child: Text(
//                                      'PAINT',
//                                      style: TextStyle(
//                                          color: Color(0xfffbcc34),
//                                          fontSize: 8),
//                                      textAlign: TextAlign.center,
//                                    ),
//                                  )
//                                ])),
//                              ],
//                            ),
//                          ],
//                        ),

                //end
//                      ),
//                    )
//                  ],
//                ),
              ),

//uncommend
//              SizedBox(
//                height: 5,
//              ),

//uncommend
//              Divider(
//                thickness: 2,
//                color: Color(0xffD4AF37),
//              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 2,
                        color: Color(0xffD4AF37),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'About Us',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Partnership',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'FAQ',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'View Cart',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Warranty',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'My Wishlist',
                              style: TextStyle(
                                  color: Color(0xfffbcc34), fontSize: 5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

//              Flexible(
//                fit: FlexFit.tight,
//                flex: 1,
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Text(
//                        'About Us',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        'Partnership',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        'Sign In',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                  ],
//                ),
//              ),

//              Flexible(
//                fit: FlexFit.tight,
//                flex: 1,
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Text(
//                        'FAQ',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        'Privacy Policy',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        'View Cart',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                  ],
//                ),
//              ),

//              Flexible(
//                fit: FlexFit.tight,
//                flex: 1,
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Text(
//                        'Warranty',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        'Contact Us',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        'My Wishlist',
//                        style: TextStyle(color: Color(0xfffbcc34), fontSize: 5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.12,
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
