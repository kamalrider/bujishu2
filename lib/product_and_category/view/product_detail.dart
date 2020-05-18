import 'package:bujishu2/product_and_category/view/product_buy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;

Future<DetailCategory> fetchData(String value) async {
  final response =
  await http.get(Constants.web + 'categories/' + value + '?products=true');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return DetailCategory.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<DetailCategory> fetchProduct(String value) async {
  final response = await http
      .get(Constants.web + 'categories/' + value + '/childs?products=true');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return DetailCategory.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<DetailCategory> fetchAPI(String value, int pageKey) async {
  if (pageKey == 0)
    return fetchProduct(value);
  else if (pageKey == 1)
    return fetchData(value);
}

class DetailCategory {
  int id;
  String name;
  int parentCategoryId;
  List<DetailProduct> detailProduct;

  DetailCategory({
    this.id,
    this.name,
    this.parentCategoryId,
    this.detailProduct,
  });

  factory DetailCategory.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    print(list.runtimeType);
    List<DetailProduct> detailCatList =
    list.map((i) => DetailProduct.fromJson(i)).toList();

    return new DetailCategory(
      id: json['id'],
      name: json['name'],
      parentCategoryId: json['parentCategoryId'],
      detailProduct: detailCatList,
    );
  }
}

class DetailProduct {
  int id;
  String code;
  String name;
  String details;
  String description;
  String quality;

  int rating;
  List<Images> images;

  List<SoldBy> soldBy;

  DetailProduct({this.id,
    this.code,
    this.name,
    this.details,
    this.description,
    this.quality,
    this.rating,
    this.images,
    this.soldBy});

  factory DetailProduct.fromJson(Map<String, dynamic> json) {
    var list1 = json['images'] as List;
    var list2 = json['soldBy'] as List;
//
    List<Images> imageList = list1.map((i) => Images.fromJson(i)).toList();
    List<SoldBy> soldByList = list2.map((j) => SoldBy.fromJson(j)).toList();
    return new DetailProduct(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      details: json['details'],
      description: json['description'],
      quality: json['quality'],
      rating: json['rating'],
      images: imageList,
      soldBy: soldByList,
    );
  }
}

class Images {
  String imageUrl;

  Images({this.imageUrl});

  factory Images.fromJson(Map<String, dynamic> json) {
    return new Images(
      imageUrl: json['imageUrl'],
    );
  }
}

class SoldBy {
  int id;
  int panelAccountId;
  String description;
  String material;
  String consistency;
  String package;
  int price;
  int memberPrice;
  int deliveryFee;
  int installationFee;
  int rating;

  SoldBy({this.id,
    this.panelAccountId,
    this.description,
    this.material,
    this.consistency,
    this.package,
    this.price,
    this.memberPrice,
    this.deliveryFee,
    this.installationFee,
    this.rating});

  factory SoldBy.fromJson(Map<String, dynamic> json) {
    return new SoldBy(
        id: json['id'],
        panelAccountId: json['panelAccountId'],
        description: json['description'],
        material: json['material'],
        consistency: json['consistency'],
        package: json['package'],
        price: json['price'],
        memberPrice: json['memberPrice'],
        deliveryFee: json['deliveryFee'],
        installationFee: json['installationFee'],
        rating: json['rating']);
  }
}

enum qualityMarker { standard, moderate, premium }

void main() => runApp(ProductDetail());

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailHome(),
    );
  }
}

class ProductDetailHome extends StatefulWidget {
  final int value;
  final int pageKey;
  final String APIId;

  ProductDetailHome({Key key, this.value, this.pageKey, this.APIId}) : super(key: key);

  @override
  ProductDetailState createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetailHome> {
  qualityMarker selectedMarker = qualityMarker.premium;

  @override
  Widget build(BuildContext context) {
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
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          selectedMarker = qualityMarker.standard;
                        });
                      },
                      child: Text(
                        "Standard",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          selectedMarker = qualityMarker.moderate;
                        });
                      },
                      child: Text(
                        "Moderate",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          selectedMarker = qualityMarker.premium;
                        });
                      },
                      child: Text(
                        "Premium",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                child: FutureBuilder<DetailCategory>(
                  future: fetchAPI(widget.value.toString(), widget.pageKey),
                  builder: (context, snapshot) {
                    List<DetailProduct> klist;
                    Widget sliverData;

                    if (snapshot.hasData) {
                      if (selectedMarker == qualityMarker.standard)
                        klist = snapshot.data.detailProduct
                            .where((i) => i.quality == 'Standard')
                            .toList();
                      else if (selectedMarker == qualityMarker.moderate)
                        klist = snapshot.data.detailProduct
                            .where((i) => i.quality == 'Moderate')
                            .toList();
                      else if (selectedMarker == qualityMarker.premium)
                        klist = snapshot.data.detailProduct
                            .where((i) => i.quality == 'Premium')
                            .toList();

                      sliverData = SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          child: Center(child: CircularProgressIndicator()));
                    }

                    return CustomScrollView(
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildListDelegate([
                            SizedBox(
                              height: 50,
                            )
                          ]),
                        ),
                        sliverData,
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: Colors.black,
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
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getText(DetailProduct product) {
    String showPrice;
    int number = product.soldBy
        .toList()
        .length;


    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
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
          onPressed: () {
            var route = new MaterialPageRoute(
              builder: (BuildContext context) =>
              new ProductBuyHome(
                value: product,
                apiValue: widget.value.toString(),

              ),
            );


            if (number == 1) {
              Navigator.of(context).push(route);
            } else if (number > 1) {
              showDialog(
                  context: context,
                  builder: (BuildContext buildContext) {
                    return Popup();
                  });
            }
          },
        ));
  }

  Widget Popup() {
    return AlertDialog(
//                title: Text("Alert Dialog"),
      backgroundColor: Colors.black,

      content: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.69,
                child: Text(
                  'Panels Selling - ' + 'item.title',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.69,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width:
                        MediaQuery
                            .of(context)
                            .size
                            .width * 0.67,
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Bujishu Sdn Bhd', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '120.00',

                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => ProductDetail()));
                                  }
                                  ,
                                  child: Text('Panel Rating', style: TextStyle(
                                      fontWeight: FontWeight.bold),)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: FlutterRatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemSize: 10.0,
                                emptyColor:
                                Colors.amber.withAlpha(50),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Customer Rating', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: FlutterRatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemSize: 10.0,
                                emptyColor:
                                Colors.amber.withAlpha(50),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Area of Service', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'KL, Seremban',

                              ),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Commitment', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'With 15 years experience in manufacturing and serving our customers,' +
                                      'we can guarantee that this product will meet your needs and 100% satisfy you'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width:
                        MediaQuery
                            .of(context)
                            .size
                            .width * 0.67,
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Bujishu Sdn Bhd', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '120.00',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Panel Rating', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: FlutterRatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemSize: 10.0,
                                emptyColor:
                                Colors.amber.withAlpha(50),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Customer Rating', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: FlutterRatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemSize: 10.0,
                                emptyColor:
                                Colors.amber.withAlpha(50),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Area of Service', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'KL, Seremban',

                              ),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Commitment', style: TextStyle(
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'With 15 years experience in manufacturing and serving our customers,' +
                                      'we can guarantee that this product will meet your needs and 100% satisfy you'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}