import 'package:bujishu2/product_and_category/view/product_buy.dart';
import 'package:bujishu2/product_and_category/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;

Future<List<DetailCategory>> fetchList() async {
  final response = await http.get(Constants.web + 'categories?products=true');

  final responseJson = json.decode(response.body);

  return (responseJson as List)
      .map((e) => DetailCategory.fromJson((e as Map).map(
            (k, e) => MapEntry(k as String, e),
          )))
      .toList();
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

  ProductDetailHome({Key key, this.value = 7}) : super(key: key);

  @override
  ProductDetailState createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetailHome> {
  qualityMarker selectedMarker = qualityMarker.premium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Featured Deals / "),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
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
                child: FutureBuilder<List<DetailCategory>>(
                  future: fetchList(),
                  builder: (context, snapshot) {
                    List<DetailProduct> klist;
                    List<DetailProduct> productList;
                    List<DetailProduct> resultList;
                    List<DetailCategory> catList;
                    Widget sliverData;

                    if (snapshot.hasData) {
//                      if (selectedMarker == qualityMarker.standard)
//                        klist = snapshot.data[1].detailProduct
//                            .where((i) => i.quality == 'Standard')
//                            .toList();
//                      else if (selectedMarker == qualityMarker.moderate)
//                        klist = snapshot.data[1].detailProduct
//                            .where((i) => i.quality == 'Moderate')
//                            .toList();
//                      else if (selectedMarker == qualityMarker.premium)
//                        klist = snapshot.data[1].detailProduct
//                            .where((i) => i.quality == 'Premium')
//                            .toList();

//                      catList = snapshot.data
//                          .where((i) => i.parentCategoryId == widget.value)
//                          .toList();
                      for (int j = 0; j < snapshot.data.length; j++) {
                        klist.addAll(snapshot.data[j].detailProduct);
                      }
//

//                      if (selectedMarker == qualityMarker.standard) {
//                        resultList =
//                            klist.where((i) => i.quality == 'Standard');
//                      } else if (selectedMarker == qualityMarker.standard) {
//                        resultList =
//                            klist.where((i) => i.quality == 'Moderate');
//                      } else if (selectedMarker == qualityMarker.standard) {
//                        resultList = klist.where((i) => i.quality == 'Premium');
//                      }

//                    catList = snapshot.data.toList();

                      sliverData = SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return getText(klist[index]);
//                            return text(snapshot.data[index]);
                          },
                          childCount: snapshot.data.length,
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
              builder: (BuildContext context) => new ProductBuyHome(
                value: product,
                apiValue: widget.value.toString(),
              ),
            );
            Navigator.of(context).push(route);
          },
        ));
  }

  Widget text(DetailCategory cat) {
    return Text(cat.name);
  }
}
