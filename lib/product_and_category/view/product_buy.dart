import 'package:bujishu2/home/customer_home/nav_drawer.dart';
import 'package:bujishu2/product_and_category/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
              child: Container(
                  width: double.infinity,
                  child: FutureBuilder<DetailCategory>(
                      future: fetchData(widget.apiValue),
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
                              child:
                                  Center(child: CircularProgressIndicator()));
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
                                    height: MediaQuery.of(context).size.height *
                                        0.40,
//            padding: EdgeInsets.only(left: 50,right: 50),
                                    child: Image.network(
                                      widget.value.images[0].imageUrl,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text(
                                    widget.value.name,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlutterRatingBarIndicator(
                                      rating: (widget.value.rating.toDouble()),
                                      itemCount: 5,
                                      itemSize: 15.0,
                                      emptyColor: Colors.amber.withAlpha(50),
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
                                    'RM ' +
                                        widget.value.soldBy[0].price.toString(),
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    'RM ' +
                                        widget.value.soldBy[0].price.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xff94C507)),
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
                                    widget.value.description,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Color Temperature',
                                  style: TextStyle(color: Color(0xff717477)),
                                  //   side: BorderSide( color: Color(0xff717477),),
                                  textAlign: TextAlign.center,
                                ),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        RaisedButton(
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            child: Text(
                                              'Cool White',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        RaisedButton(
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            child: Text(
                                              'Warm White',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        RaisedButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          child: Text(
                                            'Yellow',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        MediaQuery.of(context).size.width * 0.8,
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
                                Container(color: Color(0xffD6D7D8), height: 2),
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
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                                    BorderRadius.circular(5),
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
                                                    BorderRadius.circular(5),
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
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                                    BorderRadius.circular(5),
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
                                                    BorderRadius.circular(5),
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
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                                    BorderRadius.circular(5),
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
                                                    BorderRadius.circular(5),
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
