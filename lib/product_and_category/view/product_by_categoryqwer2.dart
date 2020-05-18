//import 'dart:math';
//
//import 'package:bujishu2/constant.dart';
//import 'package:bujishu2/home/customer_home/nav_drawer.dart';
//import 'package:bujishu2/product_and_category/model/category.dart';
//import 'package:bujishu2/product_and_category/model/product.dart';
//import 'package:bujishu2/product_and_category/view/product_detail.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:bujishu2/constant.dart' as Constants;
//
//Future<List<Modelt>> fetchAlbum() async {
//  final response = await http.get(Constants.web + 'categories');
//
////  if (response.statusCode == 200) {
//////    // If the server did return a 200 OK response,
//////    // then parse the JSON.
//////    return Modelt.fromJson(json.decode(response.body));
//////  } else {
//////    // If the server did not return a 200 OK response,
//////    // then throw an exception.
//////    throw Exception('Failed to load album');
//////  }
//
//  final responseJson = json.decode(response.body);
//
//  return (responseJson as List)
//      .map((e) => Modelt.fromJson((e as Map).map(
//            (k, e) => MapEntry(k as String, e),
//          )))
//      .toList();
//}
//
//Future<APICategory> fetchChild(String value) async {
//  final response =
//      await http.get(Constants.web + 'categories/' + value + '/childs');
//
//  if (response.statusCode == 200) {
//    // If the server did return a 200 OK response,
//    // then parse the JSON.
//    return APICategory.fromJson(json.decode(response.body));
//  } else {
//    // If the server did not return a 200 OK response,
//    // then throw an exception.
//    throw Exception('Failed to load album');
//  }
//}
//
//class Picture {
//  String image;
//
//  Picture({
//    this.image,
//  });
//
//  factory Picture.fromJson(Map<String, dynamic> json) {
//    return Picture(
//      image: json['imageUrl'],
//    );
//  }
//}
//
//class Modelt {
//  final int id;
//  final String name;
//  final int parentCategoryId;
//  final Picture image;
//  bool expended;
//
//  Modelt({
//    this.id,
//    this.name,
//    this.parentCategoryId,
//    this.image,
//    this.expended = false,
//  });
//
//  factory Modelt.fromJson(Map<String, dynamic> json) {
//    return new Modelt(
//      id: json['id'],
//      name: json['name'],
//      parentCategoryId: json['parentCategoryId'],
//      image: Picture.fromJson(json['image']),
//    );
//  }
//}
//
//class APICategory {
//  int id;
//  String name;
//  int parentCategoryId;
//  ProductImage image;
//  List<ChildCat> childCatList;
//
//  APICategory(
//      {this.id,
//      this.name,
//      this.parentCategoryId,
//      this.image,
//      this.childCatList});
//
//  factory APICategory.fromJson(Map<String, dynamic> json) {
//    var list = json['childCategories'] as List;
//    List<ChildCat> childCatList =
//        list.map((f) => ChildCat.fromJson(f)).toList();
//    return APICategory(
//      id: json['id'],
//      name: json['name'],
//      parentCategoryId: json['parentCategoryId'],
//      image: ProductImage.fromJson(json['image']),
//      childCatList: childCatList,
//    );
//  }
//}
//
//class ProductImage {
//  String imageUrl;
//
//  ProductImage({this.imageUrl});
//
//  factory ProductImage.fromJson(Map<String, dynamic> json) {
//    return ProductImage(
//      imageUrl: json['imageUrl'],
//    );
//  }
//}
//
//class ChildCat {
//  int id;
//  String name;
//  int parentCategoryId;
//  ChildCatImage image;
//
//  ChildCat({this.id, this.name, this.parentCategoryId, this.image});
//
//  factory ChildCat.fromJson(Map<String, dynamic> json) {
//    return ChildCat(
//      id: json['id'],
//      name: json['name'],
//      parentCategoryId: json['parentCategoryId'],
//      image: ChildCatImage.fromJson(json['image']),
//    );
//  }
//}
//
//class ChildCatImage {
//  String imageUrl;
//
//  ChildCatImage({this.imageUrl});
//
//  factory ChildCatImage.fromJson(Map<String, dynamic> json) {
//    return ChildCatImage(
//      imageUrl: json['imageUrl'],
//    );
//  }
//}
//
//void main() => runApp(ProductCategory());
//
//enum WidgetMarker { inn, out }
//
//class ProductCategory extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: ProductCategoryHomeAPI(),
//    );
//  }
//}
//
//class ProductCategoryHomeAPI extends StatefulWidget {
//  final Category value;
//
//  ProductCategoryHomeAPI({Key key, this.value}) : super(key: key);
//
//  @override
//  _ProductCategoryHomeState createState() => _ProductCategoryHomeState();
//}
//
//class _ProductCategoryHomeState extends State<ProductCategoryHomeAPI> {
//  List<String> _locations = ['All CAtegories (VVIP)']; // Option 2
//  String _selectedLocation; // Option 2
//
//  Future<List<Modelt>> futureAlbum;
//
//  String value;
//  int w = 0;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
////  @override
////  void initState() {
////    super.initState();
////    catgr = widget.value;
////  }
//
//  double containerHeight;
//
//  @override
//  Widget build(BuildContext context) {
////    List<Prodduct> productlist = widget.value.product;
//    return Scaffold(
//      drawer: Container(
//        width: 200,
//        child: NavDrawer(),
//      ),
//      appBar: AppBar(
//        iconTheme: new IconThemeData(color: Color(0xfffbcc34)),
//        backgroundColor: Colors.black,
//        actions: <Widget>[
//          Container(
//            padding: EdgeInsets.only(left: 50),
//            width: MediaQuery.of(context).size.width,
//            child: Row(
//              children: <Widget>[
//                Flexible(
//                  flex: 3,
//                  child: Align(
//                    alignment: Alignment.topLeft,
//                    child: Image.asset('assets/images/logo.png'),
//                  ),
//                ),
//                Flexible(
//                  flex: 2,
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                        height: 20,
//                        child: Image.asset(
//                          'assets/images/profile.png',
//                          fit: BoxFit.fitHeight,
//                        ),
//                      ),
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
//                          child: Image.asset(
//                            'assets/images/cart.png',
//                            fit: BoxFit.fitHeight,
//                          )),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: [],
//        ),
//      ),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Expanded(
//              flex: 1,
//              child: Container(
//                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                  color: Colors.black,
//                  border: Border(
//                      bottom: BorderSide(width: 2, color: Colors.yellow)),
//                ),
//                child: Column(
//                  children: <Widget>[
//                    SizedBox(
//                      height: MediaQuery.of(context).size.height * 0.02,
//                    ),
//                    Row(
//                      children: <Widget>[
//                        SizedBox(
//                          width: 10,
//                        ),
//                        Container(
//                          width: MediaQuery.of(context).size.width * 0.6,
//                          height: MediaQuery.of(context).size.height * 0.05,
//
//                          //color: Colors.white,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(5),
//                              color: Colors.white),
//                          child: Row(
//                            children: <Widget>[
//                              Container(
//                                padding: EdgeInsets.only(left: 10),
//                                width: MediaQuery.of(context).size.width * 0.5,
//                                child: TextField(),
//                              ),
//                              Container(
//                                width: 2,
//                                color: Color(0xfffbcc34),
//                              ),
//                              Container(
//                                width: 30,
//                                padding: EdgeInsets.fromLTRB(
//                                  8,
//                                  8,
//                                  8,
//                                  8,
//                                ),
//                                child: Image.asset(
//                                  'assets/images/search.png',
//                                  fit: BoxFit.fitWidth,
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                        SizedBox(
//                          width: 2,
//                        ),
//                        Container(
//                          width: 30,
//                          margin: EdgeInsets.only(left: 20),
//                          padding: EdgeInsets.fromLTRB(
//                            0,
//                            0,
//                            0,
//                            0,
//                          ),
//                          child: Image.asset(
//                            'assets/images/camera.png',
//                            fit: BoxFit.fitWidth,
//                          ),
//                        ),
//                        Container(
//                          width: 30,
//                          margin: EdgeInsets.only(left: 20),
//                          padding: EdgeInsets.fromLTRB(
//                            0,
//                            0,
//                            0,
//                            0,
//                          ),
//                          child: Image.asset(
//                            'assets/images/mike.png',
//                            fit: BoxFit.fitWidth,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 8,
//              child: Container(
//                height: 500,
//                child: FutureBuilder<List<Modelt>>(
//                  future: fetchAlbum(),
//                  builder: (context, snapshot) {
//                    Widget sliverData;
//
//                    if (snapshot.hasData) {
//                      sliverData = SliverGrid(
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                            crossAxisCount: 2),
//                        delegate: SliverChildBuilderDelegate(
//                          (BuildContext context, int index) {
//                            return Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: getImages(snapshot.data
//                                  .where((i) =>
//                                      i.parentCategoryId == widget.value.APIid)
//                                  .toList()[index]),
//                            );
//                          },
//                          childCount: snapshot.data
//                              .where((i) =>
//                                  i.parentCategoryId == widget.value.APIid)
//                              .toList()
//                              .length,
//                        ),
//                      );
//                    } else {
//                      sliverData = SliverToBoxAdapter(
//                          child: Center(child: CircularProgressIndicator()));
//                    }
//
//                    return CustomScrollView(
//                      slivers: <Widget>[
//                        SliverList(
//                          delegate: SliverChildListDelegate([
//                            MaterialButton(
////                          onPressed: () {
////                            setState(() {
////                              productlist.forEach((f) => f.expended = false);
////
////                              //data.expended = !data.expended;
////                            });
////                          },
//                              child: Align(
//                                alignment: Alignment.centerLeft,
//                                child: Column(
//                                  children: <Widget>[
//                                    SizedBox(
//                                      height:
//                                          MediaQuery.of(context).size.height *
//                                              0.01,
//                                    ),
//                                    Align(
//                                      alignment: Alignment.center,
//                                      child: Container(
//                                          padding: EdgeInsets.all(10),
//                                          decoration: BoxDecoration(
//                                              color: Color(0xffF0F1F1),
//                                              border: Border(
//                                                  bottom: BorderSide(
//                                                      width: 2,
//                                                      color: Colors.grey))),
//                                          width: MediaQuery.of(context)
//                                                  .size
//                                                  .width *
//                                              0.9,
//                                          child: Row(
//                                            children: <Widget>[
//                                              Container(
//                                                child: InkWell(
//                                                  child: Text(
//                                                    'Home',
//                                                    textAlign: TextAlign.left,
//                                                    style: TextStyle(
//                                                        color:
//                                                            Colors.lightBlue),
//                                                  ),
//                                                  //onTap: () {}
//                                                ),
//                                              ),
//                                              Text(' / ' + widget.value.name),
//                                            ],
//                                          )),
//                                    ),
//                                    SizedBox(
//                                      height:
//                                          MediaQuery.of(context).size.height *
//                                              0.02,
//                                    ),
//                                    Container(
//                                      padding: EdgeInsets.only(left: 20),
//                                      width: MediaQuery.of(context).size.width,
//                                      child: Text(
//                                        widget.value.name,
//                                        textAlign: TextAlign.left,
//                                        style: TextStyle(
//                                          fontSize: 30,
//                                          color: Colors.grey,
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      height:
//                                          MediaQuery.of(context).size.height *
//                                              0.02,
//                                    ),
//                                    Container(
//                                      padding: EdgeInsets.only(left: 20),
//                                      width: MediaQuery.of(context).size.width,
//                                      child: Text(
//                                        'Featured Categories',
//                                        style: TextStyle(
//                                          fontSize: 25,
//                                          color: Colors.black,
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      height:
//                                          MediaQuery.of(context).size.height *
//                                              0.02,
//                                    ),
//                                    Padding(
//                                      padding:
//                                          EdgeInsets.only(left: 10, right: 10),
//                                      child: Container(
//                                        color: Colors.grey,
//                                        height: 1,
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      height:
//                                          MediaQuery.of(context).size.height *
//                                              0.05,
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ]),
//                        ),
//
////                    SliverGrid(
////                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////                        crossAxisCount: 2,
////                      ),
////                      delegate: SliverChildBuilderDelegate(
////                        (BuildContext context, int index) {
////                          return FutureBuilder<List<Modelt>>(
////                            future: fetchAlbum(),
////                            builder: (context, snapshot) {
////                              if (snapshot.connectionState ==
////                                  ConnectionState.waiting) {
////                                return CircularProgressIndicator();
////                              } else {
////                                if (snapshot.hasData) {
////                                  return Padding(
////                                    padding: const EdgeInsets.all(8.0),
////                                    child: getImages(snapshot.data
////                                        .where((i) =>
////                                            i.parentCategoryId ==
////                                            widget.value.APIid)
////                                        .toList()[index]),
////                                  );
////                                } else
////                                  return CircularProgressIndicator();
////                              }
//////                              else {
//////                                return CircularProgressIndicator();
//////                              }
////                            },
////                          );
////                        },
////                        childCount: 4, //saya letak ni
////                      ),
////                    ),
//
//                        sliverData,
//                      ],
//                    );
//                  },
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 0,
//              child: Container(
//                width: MediaQuery.of(context).size.width,
//                color: Colors.black,
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      height: 2,
//                      color: Color(0xffD4AF37),
//                    ),
//                    SizedBox(
//                      height: MediaQuery.of(context).size.height * 0.01,
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(
//                            'About Us',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Partnership',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Sign In',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(
//                            'FAQ',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Privacy Policy',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'View Cart',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(
//                            'Warranty',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Contact Us',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'My Wishlist',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ],
//                    ),
//                    SizedBox(
//                      height: MediaQuery.of(context).size.height * 0.01,
//                    ),
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget getImages(Modelt item) {
//          return GestureDetector(
//            child: Column(
//              children: <Widget>[
//                Expanded(
//                  child: Image.network(
//                    item.image.image,
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.all(4),
//                  child: Text(item.name),
//                ),
//
///*
////                animateContainer,
//                AnimatedContainer(
//                height: containerHeight,
//                duration: Duration(seconds: 1),
//                curve: Curves.fastOutSlowIn,
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 50),
//                      child: Divider(
//                        height: 6,
//                        color: Colors.grey,
//                      ),
//                    ),
//                    InkWell(
//                      child: Text(
//                        item.name,
//                        textAlign: TextAlign.center,
//                        style: TextStyle(fontSize: 12),
//                      ),
//                      onTap: () {
////                    var route = new MaterialPageRoute(
////                      builder: (BuildContext context) =>
////                          new NextPage(value: item.title),
////                    );
////                    Navigator.of(context).push(route);
//                      },
//                    ),
//                  ],
//                ),
//              ) */
//              ],
//            ),
//            onTap: () {
//
//                var route = new MaterialPageRoute(
//                  builder: (BuildContext context) => new ProductDetailHome(
//                    value: item.id,
//                    pageKey: 1,
//                  ),
//                );
//
////                if (childnum == 0)
//                  Navigator.of(context).push(route);
//
////              setState(() {
////                item.expended = true;
////              });
//
//            },
//          );
//  }
//
//  Widget getImagesAnimated(Modelt item) {
//    containerHeight = item.expended ? 60 : 0;
//    int childnum = 0;
////    return MaterialButton(
////      child: Column(
////        children: <Widget>[
////          Expanded(
////            child: Image.network(
////              item.image.image,
////              fit: BoxFit.cover,
////            ),
////          ),
////          Padding(
////            padding: EdgeInsets.all(4),
////            child: Text(item.name),
////          ),
////          Text(childnum.toString()),
////          //animateContainer,
////          /*AnimatedContainer(
////                height: containerHeight,
////                duration: Duration(seconds: 1),
////                curve: Curves.fastOutSlowIn,
////                child: Column(
////                  children: <Widget>[
////                    Padding(
////                      padding: const EdgeInsets.symmetric(horizontal: 50),
////                      child: Divider(
////                        height: 6,
////                        color: Colors.grey,
////                      ),
////                    ),
////                    InkWell(
////                      child: Text(
////                        item.description,
////                        textAlign: TextAlign.center,
////                        style: TextStyle(fontSize: 12),
////                      ),
////                      onTap: () {
//////                    var route = new MaterialPageRoute(
//////                      builder: (BuildContext context) =>
//////                          new NextPage(value: item.title),
//////                    );
//////                    Navigator.of(context).push(route);
////                      },
////                    ),
////                  ],
////                ),
////              )*/
////        ],
////      ),
////      onPressed: () {
////
////        var route = new MaterialPageRoute(
////          builder: (BuildContext context) => new ProductDetailHome(
////            value: item.id,
////            pageKey: 1,
////          ),
////        );
////
//////                if (childnum == 0)
////        Navigator.of(context).push(route);
////
////      },
////    );
//    return GestureDetector(
//      child: FutureBuilder<APICategory>(
//        future: fetchChild(item.id.toString()),
//        builder: (context, apidata) {
//
//          return Container(
//            child: Column(
//              children: <Widget>[
//                Expanded(
//                  child: Image.network(
//                    item.image.image,
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.all(4),
//                  child: Text(item.name),
//                ),
//
////                animateContainer,
//                AnimatedContainer(
//                  height: containerHeight,
//                  duration: Duration(seconds: 1),
//                  curve: Curves.fastOutSlowIn,
//                  child: Column(
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.symmetric(horizontal: 50),
//                        child: Divider(
//                          height: 6,
//                          color: Colors.grey,
//                        ),
//                      ),
//                      InkWell(
//                        child: Text(
//                          item.name,
//                          textAlign: TextAlign.center,
//                          style: TextStyle(fontSize: 12),
//                        ),
//                        onTap: () {
////                    var route = new MaterialPageRoute(
////                      builder: (BuildContext context) =>
////                          new NextPage(value: item.title),
////                    );
////                    Navigator.of(context).push(route);
//                        },
//                      ),
//                    ],
//                  ),
//                )
//              ],
//            ),
////            onTap: () {
////
////              var route = new MaterialPageRoute(
////                builder: (BuildContext context) => new ProductDetailHome(
////                  value: item.id,
////                  pageKey: 1,
////                ),
////              );
////
//////                if (childnum == 0)
////              // Navigator.of(context).push(route);
////
////              setState(() {
////                item.expended = false;
////                item.expended = !item.expended;
////              });
////
////            },
//          );
//        },
//      ),
//      onTap: (){
//        setState(() {
//          setState(() {
//            item.expended = true;
//          });
//        });
//      },
//    );
//  }
//
//
//
//}
//
//
//
//
//
//
//

import 'dart:math';

import 'package:bujishu2/constant.dart';
import 'package:bujishu2/home/customer_home/nav_drawer.dart';
import 'package:bujishu2/product_and_category/model/category.dart';
import 'package:bujishu2/product_and_category/model/product.dart';
import 'package:bujishu2/product_and_category/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;

Future<List<Modelt>> fetchAlbum() async {
  final response = await http.get(Constants.web + 'categories');

//  if (response.statusCode == 200) {
////    // If the server did return a 200 OK response,
////    // then parse the JSON.
////    return Modelt.fromJson(json.decode(response.body));
////  } else {
////    // If the server did not return a 200 OK response,
////    // then throw an exception.
////    throw Exception('Failed to load album');
////  }

  final responseJson = json.decode(response.body);

  return (responseJson as List)
      .map((e) => Modelt.fromJson((e as Map).map(
        (k, e) => MapEntry(k as String, e),
  )))
      .toList();
}

Future<APICategory> fetchChild(String value) async {
  final response =
  await http.get(Constants.web + 'categories/' + value + '/childs');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return APICategory.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Picture {
  String image;

  Picture({
    this.image,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      image: json['imageUrl'],
    );
  }
}

class Modelt {
  final int id;
  final String name;
  final int parentCategoryId;
  final Picture image;
  bool expended;

  Modelt({
    this.id,
    this.name,
    this.parentCategoryId,
    this.image,
    this.expended = false,
  });

  factory Modelt.fromJson(Map<String, dynamic> json) {
    return new Modelt(
      id: json['id'],
      name: json['name'],
      parentCategoryId: json['parentCategoryId'],
      image: Picture.fromJson(json['image']),
    );
  }
}

class APICategory {
  int id;
  String name;
  int parentCategoryId;
  ProductImage image;
  List<ChildCat> childCatList;
  bool expended;

  APICategory({
    this.id,
    this.name,
    this.parentCategoryId,
    this.image,
    this.childCatList,
    this.expended = false,
  });

  factory APICategory.fromJson(Map<String, dynamic> json) {
    var list = json['childCategories'] as List;

    List<ChildCat> childCatList =
    list.map((f) => ChildCat.fromJson(f)).toList();

    return APICategory(
      id: json['id'],
      name: json['name'],
      parentCategoryId: json['parentCategoryId'],
      image: ProductImage.fromJson(json['image']),
      childCatList: childCatList,
    );
  }
}

class ProductImage {
  String imageUrl;

  ProductImage({this.imageUrl});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      imageUrl: json['imageUrl'],
    );
  }
}

class ChildCat {
  int id;
  String name;
  int parentCategoryId;
  ChildCatImage image;

  ChildCat({this.id, this.name, this.parentCategoryId, this.image});

  factory ChildCat.fromJson(Map<String, dynamic> json) {
    return ChildCat(
      id: json['id'],
      name: json['name'],
      parentCategoryId: json['parentCategoryId'],
      image: ChildCatImage.fromJson(json['image']),
    );
  }
}

class ChildCatImage {
  String imageUrl;

  ChildCatImage({this.imageUrl});

  factory ChildCatImage.fromJson(Map<String, dynamic> json) {
    return ChildCatImage(
      imageUrl: json['imageUrl'],
    );
  }
}

void main() => runApp(ProductCategory());

enum WidgetMarker { inn, out }

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductCategoryHomeAPI(),
    );
  }
}

class ProductCategoryHomeAPI extends StatefulWidget {
  final Category value;

  ProductCategoryHomeAPI({Key key, this.value}) : super(key: key);

  @override
  _ProductCategoryHomeState createState() => _ProductCategoryHomeState();
}

class _ProductCategoryHomeState extends State<ProductCategoryHomeAPI> {
  List<String> _locations = ['All CAtegories (VVIP)']; // Option 2
  String _selectedLocation; // Option 2

  String value;
  int w = 0;

  @override
  void initState() {
    getFetchDataApi();

    super.initState();
  }

  var listChild = List<APICategory>();




  getFetchDataApi() async {
    final listChildLocal = List<APICategory>();
    final filterData = await getListFilter();
    var count = 0;

    filterData.forEach((f) async {
      count++;

      final data = await fetchChild(f.id.toString());

      listChildLocal.add(data..expended = f.expended);

      if (count == filterData.length) {
        setState(() {
          listChild = listChildLocal;
          listChild.sort((a,b) => a.id.compareTo(b.id));
        });
      }
    });
  }

  Future<List<Modelt>> getListFilter() async {
    final list = await fetchAlbum();

    List<Modelt> filter =
    list.where((i) => i.parentCategoryId == widget.value.APIid).toList();

    return filter;
  }

  double containerHeight;

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.yellow)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.05,

                          //color: Colors.white,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
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
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 30,
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            0,
                          ),
                          child: Image.asset(
                            'assets/images/camera.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          width: 30,
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            0,
                          ),
                          child: Image.asset(
                            'assets/images/mike.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: MaterialButton(
                height: 500,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        MaterialButton(
//                          onPressed: () {
//                            setState(() {
//                              productlist.forEach((f) => f.expended = false);
//
//                              //data.expended = !data.expended;
//                            });
//                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.01,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffF0F1F1),
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 2,
                                                  color: Colors.grey))),
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: InkWell(
                                              child: Text(
                                                'Home',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.lightBlue),
                                              ),
                                              //onTap: () {}
                                            ),
                                          ),
                                          Text(' / ' + widget.value.name),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    widget.value.name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Featured Categories',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Container(
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),

//                    SliverGrid(
//                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                        crossAxisCount: 2,
//                      ),
//                      delegate: SliverChildBuilderDelegate(
//                        (BuildContext context, int index) {
//                          return FutureBuilder<List<Modelt>>(
//                            future: fetchAlbum(),
//                            builder: (context, snapshot) {
//                              if (snapshot.connectionState ==
//                                  ConnectionState.waiting) {
//                                return CircularProgressIndicator();
//                              } else {
//                                if (snapshot.hasData) {
//                                  return Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: getImages(snapshot.data
//                                        .where((i) =>
//                                            i.parentCategoryId ==
//                                            widget.value.APIid)
//                                        .toList()[index]),
//                                  );
//                                } else
//                                  return CircularProgressIndicator();
//                              }
////                              else {
////                                return CircularProgressIndicator();
////                              }
//                            },
//                          );
//                        },
//                        childCount: 4, //saya letak ni
//                      ),
//                    ),

                    listChild.length > 0
                        ? SliverGrid(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: listChild[index]
                                  .childCatList
                                  .length >
                                  1
                                  ? getImagesAnimated(listChild[index])
                                  : getImages(listChild[index]));
                        },
                        childCount: listChild.length,
                      ),
                    )
                        : SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()))
                  ],
                ),
                onPressed: () {
                  setState(() {
                    setState(() {
                      listChild.forEach((f) {
                        f.expended = false;
                      });

                    });
                  });
                },

//                FutureBuilder<List<APICategory>>(
//                  future: getFetchDataApi(),
//                  builder: (context, snapshot) {
//                    Widget sliverData;
//
//                    if (snapshot.hasData) {
//
//                      sliverData = SliverGrid(
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                            crossAxisCount: 2),
//                        delegate: SliverChildBuilderDelegate(
//                              (BuildContext context, int index) {
//                            return Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: getImages(snapshot.data[index]),
//                            );
//                          },
//                          childCount: snapshot.data.length,
//                        ),
//                      );
//
//                    } else {
//                      sliverData = SliverToBoxAdapter(
//                          child: Center(child: CircularProgressIndicator()));
//                    }
//
//                    return ;
//                  },
//                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 2,
                      color: Color(0xffD4AF37),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImages(APICategory item) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              item.image.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Text(item.name),
          ),

/*
//                animateContainer,
                AnimatedContainer(
                height: containerHeight,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(
                        height: 6,
                        color: Colors.grey,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {
//                    var route = new MaterialPageRoute(
//                      builder: (BuildContext context) =>
//                          new NextPage(value: item.title),
//                    );
//                    Navigator.of(context).push(route);
                      },
                    ),
                  ],
                ),
              ) */
        ],
      ),
      onTap: () {
        listChild.forEach((f) {
          f.expended = false;
        });
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new ProductDetailHome(
            value: item.id,
            pageKey: 1,
            APIId: widget.value.APIid.toString(),
          ),
        );

//                if (childnum == 0)
        Navigator.of(context).push(route);

//              setState(() {
//                item.expended = true;
//              });
      },
    );
  }

  Widget getImagesAnimated(APICategory item) {
    containerHeight = item.expended ? 60 : 0;
    int childnum = 0;
//    return MaterialButton(
//      child: Column(
//        children: <Widget>[
//          Expanded(
//            child: Image.network(
//              item.image.image,
//              fit: BoxFit.cover,
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.all(4),
//            child: Text(item.name),
//          ),
//          Text(childnum.toString()),
//          //animateContainer,
//          /*AnimatedContainer(
//                height: containerHeight,
//                duration: Duration(seconds: 1),
//                curve: Curves.fastOutSlowIn,
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 50),
//                      child: Divider(
//                        height: 6,
//                        color: Colors.grey,
//                      ),
//                    ),
//                    InkWell(
//                      child: Text(
//                        item.description,
//                        textAlign: TextAlign.center,
//                        style: TextStyle(fontSize: 12),
//                      ),
//                      onTap: () {
////                    var route = new MaterialPageRoute(
////                      builder: (BuildContext context) =>
////                          new NextPage(value: item.title),
////                    );
////                    Navigator.of(context).push(route);
//                      },
//                    ),
//                  ],
//                ),
//              )*/
//        ],
//      ),
//      onPressed: () {
//
//        var route = new MaterialPageRoute(
//          builder: (BuildContext context) => new ProductDetailHome(
//            value: item.id,
//            pageKey: 1,
//          ),
//        );
//
////                if (childnum == 0)
//        Navigator.of(context).push(route);
//
//      },
//    );
    return GestureDetector(
      child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  item.image.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(item.name),
              ),

//                animateContainer,
              AnimatedContainer(
                height: containerHeight,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(
                        height: 6,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      children: item.childCatList.map((list) {
                        return InkWell(
                          child: Text(
                            list.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                          onTap: () {
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) => new ProductDetailHome(
                                value: list.id,
                                pageKey: 1,
                                APIId: widget.value.APIid.toString(),
                              ),
                            );

//                if (childnum == 0)
                            Navigator.of(context).push(route);

                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              )
            ],
          )),
      onTap: () {
        setState(() {
          setState(() {
            listChild.forEach((f) {
              f.expended = false;
            });
            item.expended = !item.expended;
          });
        });
      },
    );
  }
}
