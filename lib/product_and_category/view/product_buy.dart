import 'package:bujishu2/home/customer_home/nav_drawer.dart';
import 'package:bujishu2/product_and_category/view/product_detail.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;

Future<ProductBuyModel> getProductBuy(String id, String panelAccountId) async {
  final response =
      await http.get(Constants.web + 'products/' + id + '/' + panelAccountId);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ProductBuyModel.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ProductBuyModel {
  int id;
  String code;
  String name;
  String details;
  String description;
  String quality;
  int rating;
  int panelAccountId;
  String material;
  String consistency;
  String package;
  int price;
  int memberPrice;
  int deliveryFee;
  int installationFee;
  List<ProductBuyImage> images;
  List<Variation> variations;

  ProductBuyModel({
    this.id,
    this.code,
    this.name,
    this.details,
    this.description,
    this.quality,
    this.rating,
    this.panelAccountId,
    this.material,
    this.consistency,
    this.package,
    this.price,
    this.memberPrice,
    this.deliveryFee,
    this.installationFee,
    this.images,
    this.variations,
  });

  factory ProductBuyModel.fromJson(Map<String, dynamic> json) {
    var list1 = json['images'] as List;
    var list2 = json['variations'] as List;

    List<ProductBuyImage> imagelist =
        list1.map((i) => ProductBuyImage.fromJson(i)).toList();
    List<Variation> variationList =
        list2.map((j) => Variation.fromJson(j)).toList();

    return ProductBuyModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      details: json['details'],
      description: json['description'],
      quality: json['quality'],
      rating: json['rating'],
      panelAccountId: json['panelAccountId'],
      material: json['material'],
      consistency: json['consistency'],
      package: json['package'],
      price: json['price'],
      memberPrice: json['memberPrice'],
      deliveryFee: json['deliveryFee'],
      installationFee: json['installationFee'],
      images: imagelist,
      variations: variationList,
    );
  }
}

class ProductBuyImage {
  String imageUrl;

  ProductBuyImage({
    this.imageUrl,
  });

  factory ProductBuyImage.fromJson(Map<String, dynamic> json) {
    return ProductBuyImage(
      imageUrl: json['imageUrl'],
    );
  }
}

class Variation {
  int id;
  String variationType;
  String variationName;

  Variation({this.id, this.variationType, this.variationName});

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      id: json['id'],
      variationType: json['variationType'],
      variationName: json['variationName'],
    );
  }
}

void main() => runApp(ProductBuy());

class ProductBuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductBuyHome(),
    );
  }
}

class ProductBuyHome extends StatefulWidget {
  DetailProduct value;
  String apiValue;

  ProductBuyHome({Key key, this.value, this.apiValue}) : super(key: key);

  @override
  ProductBuyState createState() => ProductBuyState();
}

class ProductBuyState extends State<ProductBuyHome> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: FutureBuilder<ProductBuyModel>(
        future: getProductBuy('1', '1918000101'),
        builder: (context, apidata) {
          List<ProductBuyImage> imageList;
          double price;
          double memberPrice;
          if (apidata.hasData) {
            imageList = apidata.data.images.toList();

            price = apidata.data.price.toDouble() / 100;
            memberPrice = apidata.data.memberPrice.toDouble() / 100;
          }

          return Container(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
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
                  child: Container(
                      width: double.infinity,
                      child: FutureBuilder<DetailCategory>(
                          future: fetchData('7'),
                          builder: (context, snapshot) {
                            List<DetailProduct> klist;
                            Widget sliverData;

                            if (snapshot.hasData) {
                              klist = snapshot.data.detailProduct.toList();

                              sliverData = SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return getText(klist[index]);
                                  },
                                  childCount: klist.length,
                                ),
                              );
                            } else {
                              sliverData = SliverToBoxAdapter(
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            }
                            return CustomScrollView(
                              slivers: <Widget>[
                                SliverList(
                                  delegate: SliverChildListDelegate([
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        color: Colors.black,
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.40,
//            padding: EdgeInsets.only(left: 50,right: 50),
                                        child: Carousel(
                                          boxFit: BoxFit.fitHeight,
                                          images: imageList
                                              .map((i) =>
                                                  NetworkImage(i.imageUrl))
                                              .toList(),
                                          animationCurve: Curves.fastOutSlowIn,
                                          animationDuration:
                                              Duration(milliseconds: 2000),
                                          dotBgColor: Colors.transparent,
                                          indicatorBgPadding: 5.0,
                                          //moveIndicatorFromBottom: -15,
                                          dotSize: 4.0,
                                          dotSpacing: 15.0,
                                          dotColor: Color(0xff000000),
                                          autoplay: false,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        apidata.data.name,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        'Sold By - Bujishu Sdn Bhd',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        FlutterRatingBarIndicator(
                                          rating:
                                              (apidata.data.rating.toDouble()),
                                          itemCount: 5,
                                          itemSize: 15.0,
                                          emptyColor:
                                              Colors.amber.withAlpha(50),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('490 ratings')
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        'Fixed Price',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        'RM ' + price.toStringAsFixed(2),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        'DC Customer Price',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        'RM ' + memberPrice.toStringAsFixed(2),
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Color(0xff94C507)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        apidata.data.description,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Color Temperature',
                                      style:
                                          TextStyle(color: Color(0xff717477)),
                                      //   side: BorderSide( color: Color(0xff717477),),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children:
                                              apidata.data.variations.map((v) {
                                            return Padding(
                                              padding: EdgeInsets.all(8),
                                              child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  child: Text(
                                                    v.variationName,
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('Quantity',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.grey)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        MaterialButton(
                                          child: Container(
                                            child: Icon(Icons.remove),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _decrementCounter();
                                            });
                                          },
                                        ),
                                        Container(
                                            width: 60,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Colors.black,
                                            )),
                                            child: Text(_counter.toString())),
                                        MaterialButton(
                                          child: Container(
                                            child: Icon(Icons.add),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _incrementCounter();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.yellow,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  child: Text('Buy Now')),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.yellow,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  child: Text('Add To Cart')),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        color: Color(0xffD6D7D8), height: 2),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Product Details',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 8, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                      color: Color(0xff717477),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Description',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                      color: Color(0xff717477),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Material',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 8, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                      color: Color(0xff717477),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Size',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                      color: Color(0xff717477),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Consistency',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 8, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                      color: Color(0xff717477),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Package',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                      color: Color(0xff717477),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Availability',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 2,
                                      color: Color(0xffD6D7D8),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Similar Items',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                                ),
                                sliverData,
                              ],
                            );
                          })),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getText(DetailProduct product) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Image.network(
//                  'https://demo3.bujishu.com/storage/uploads/images/products/bedsheet-premium/bedsheet-premium_1.jpg',
                  product.images.toList()[0].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(product.name),
              Text('RM ' + product.soldBy[0].price.toString()),
            ],
          ),
        ));
  }
}
