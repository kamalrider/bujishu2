import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<DetailCategory> fetchData(String value) async {
  final response = await http
      .get('https://demo3.bujishu.com/api/categories/' +value+'?products=true');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return DetailCategory.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }

//  final responseJson = json.decode(response.body);
//
//  return (responseJson as List)
//      .map((e) =>
//      DetailCategory.fromJson((e as Map).map(
//            (k, e) => MapEntry(k as String, e),
//      )))
//      .toList();
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

//  double rating;
  List<Images> images;
//  List<SoldBy> soldBy;

  DetailProduct({
    this.id,
    this.code,
    this.name,
    this.details,
    this.description,
    this.quality,
//    this.rating,
    this.images,
//    this.soldBy
  });

  factory DetailProduct.fromJson(Map<String, dynamic> json) {
    var list1 = json['images'] as List;
//    var list2 = json['soldBy'] as List;
//
    List<Images> imageList = list1.map((i) => Images.fromJson(i)).toList();
//    List<SoldBy> soldByList = list2.map((j) => SoldBy.fromJson(j)).toList();
    return new DetailProduct(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      details: json['details'],
      description: json['description'],
      quality: json['quality'],
//      rating: json['rating'],
      images: imageList,
//      soldBy: soldByList,
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
  double rating;

  SoldBy(
      {this.id,
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

  ProductDetailHome({Key key, this.value}) : super(key: key);
  @override
  ProductDetailState createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetailHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Featured Deals / "),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 500,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Standard",
                      ),
                    ),
                    OutlineButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Moderate",
                      ),
                    ),
                    OutlineButton(
                      onPressed: () {
                        /*...*/
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
                  future: fetchData(widget.value.toString()),
                  builder: (context, snapshot) {
                    List<DetailProduct> klist;
                    Widget sliverData;

                    if (snapshot.hasData) {
                      klist = snapshot.data.detailProduct.toList();

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
            )
          ],
        ),
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
              child:  Image.network(
//                  'https://demo3.bujishu.com/storage/uploads/images/products/bedsheet-premium/bedsheet-premium_1.jpg',
                  product.images.toList()[0].imageUrl,
                  fit: BoxFit.cover,
                ),

            ),
          ],
        ),
      )
    );
  }
}
