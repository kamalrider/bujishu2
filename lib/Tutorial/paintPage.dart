import 'package:Bujishu/Pay/payment_method.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:Bujishu/constant.dart' as Constants;

class Colour {
  int colorId;
  Color color;
  bool border;

  Colour({
    this.colorId,
    this.color,
    this.border = false,
  });
}

class PaintProduct {
  String name;
  int colorId;
  List<String> images;

  PaintProduct({
    this.name,
    this.colorId,
    this.images,
  });
}

void main() => runApp(PaintPage());

class PaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaintPageHome(),
    );
  }
}

class PaintPageHome extends StatefulWidget {
  @override
  _PaintPageState createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPageHome> {
  List<PaintProduct> products = [
    PaintProduct(
      name: '',
      colorId: 0,
      images: [
        'assets/images/mamellopic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 1,
      images: [
        'assets/images/namaqualandpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 2,
      images: [
        'assets/images/rickshawpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 3,
      images: [
        'assets/images/mamellopic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 4,
      images: [
        'assets/images/namaqualandpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 5,
      images: [
        'assets/images/rickshawpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 0,
      images: [
        'assets/images/mamellopic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 1,
      images: [
        'assets/images/namaqualandpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 2,
      images: [
        'assets/images/rickshawpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 3,
      images: [
        'assets/images/mamellopic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 4,
      images: [
        'assets/images/namaqualandpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
    PaintProduct(
      name: '',
      colorId: 5,
      images: [
        'assets/images/rickshawpic.jpg',
        'assets/images/exppaint.jpg',
      ],
    ),
  ];

  List<Colour> colours = [
    Colour(
      colorId: 0,
      color: Color(0xff88acf8),
    ),
    Colour(
      colorId: 1,
      color: Color(0xfffce45c),
    ),
    Colour(
      colorId: 2,
      color: Color(0xff83766b),
    ),
    Colour(
      colorId: 3,
      color: Color(0xff88acf8),
    ),
    Colour(
      colorId: 4,
      color: Color(0xfffce45c),
    ),
    Colour(
      colorId: 5,
      color: Color(0xff83766b),
    ),
    Colour(
      colorId: 6,
      color: Color(0xff88acf8),
    ),
    Colour(
      colorId: 7,
      color: Color(0xfffce45c),
    ),
    Colour(
      colorId: 8,
      color: Color(0xff83766b),
    ),
    Colour(
      colorId: 9,
      color: Color(0xff88acf8),
    ),
    Colour(
      colorId: 10,
      color: Color(0xfffce45c),
    ),
    Colour(
      colorId: 11,
      color: Color(0xff83766b),
    ),
  ];

  List<PaintProduct> paint;

  List<String> imageList;

  Color border;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    border = Colors.white;
    setPic(0);
  }

  void setPic(int num) {
    imageList = products[num].images.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 200,
        child: NavDrawer(),
      ),
      appBar: GeneralAppBar(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            color: Colors.black,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.40,
//            padding: EdgeInsets.only(left: 50,right: 50),
                            child: Carousel(
                              boxFit: BoxFit.fitHeight,
                              images:
                                  imageList.map((i) => AssetImage(i)).toList(),
                              animationCurve: Curves.fastOutSlowIn,
                              animationDuration: Duration(milliseconds: 2000),
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

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: colours
                                .map((f) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          colours.forEach((j) => j.border = false);
                                          setPic(f.colorId);
                                          if (f.border == true)
                                            border = Colors.black;
                                          else
                                            border = Colors.white;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(5, 10, 5, 10),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: f.color,
                                          border: Border.all(color: border),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Example',
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
//                              Row(
//                                mainAxisAlignment:
//                                MainAxisAlignment.center,
//                                children: <Widget>[
//                                  FlutterRatingBarIndicator(
//                                    rating:
//                                    (4),
//                                    itemCount: 5,
//                                    itemSize: 15.0,
//                                    emptyColor:
//                                    Colors.amber.withAlpha(50),
//                                  ),
//                                  SizedBox(
//                                    width: 5,
//                                  ),
//                                  Text('490 ratings')
//                                ],
//                              ),
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
                            'RM 120',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            'RM 120',
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
                            'example',
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
//                              Container(
//                                width: MediaQuery.of(context).size.width,
//                                height: 50,
//                                child: Center(
//                                  child: Row(
//                                    mainAxisAlignment:
//                                    MainAxisAlignment.center,
//                                    children:
//                                    apidata.data.variations.map((v) {
//                                      return Padding(
//                                        padding: EdgeInsets.all(8),
//                                        child: RaisedButton(
//                                            color: Colors.white,
//                                            onPressed: () {
//                                              setState(() {});
//                                            },
//                                            shape: RoundedRectangleBorder(
//                                              borderRadius:
//                                              BorderRadius.circular(
//                                                  5),
//                                              side: BorderSide(
//                                                  color: Colors.grey),
//                                            ),
//                                            child: Text(
//                                              v.variationName,
//                                              style: TextStyle(
//                                                  color: Colors.grey),
//                                            )),
//                                      );
//                                    }).toList(),
//                                  ),
//                                ),
//                              ),
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
//                                        _decrementCounter();
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
                                child: Text(
                                  '1',
//                                        _counter.toString(),
                                  textAlign: TextAlign.center,
                                )),
                            MaterialButton(
                              child: Container(
                                child: Icon(Icons.add),
                              ),
                              onPressed: () {
                                setState(() {
//                                        _incrementCounter();
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
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                      color: Colors.yellow,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentMethodHome()));
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
                                        Constants.generalToast(
                                            'Your item have been added to CART');
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
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: Color(0xff717477),
                                        ),
                                      ),
                                      child: Text(
                                        'Description',
                                        style: TextStyle(color: Colors.black),
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
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: Color(0xff717477),
                                        ),
                                      ),
                                      child: Text(
                                        'Material',
                                        style: TextStyle(color: Colors.black),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: Color(0xff717477),
                                        ),
                                      ),
                                      child: Text(
                                        'Size',
                                        style: TextStyle(color: Colors.black),
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
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: Color(0xff717477),
                                        ),
                                      ),
                                      child: Text(
                                        'Consistency',
                                        style: TextStyle(color: Colors.black),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: Color(0xff717477),
                                        ),
                                      ),
                                      child: Text(
                                        'Package',
                                        style: TextStyle(color: Colors.black),
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
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: Color(0xff717477),
                                        ),
                                      ),
                                      child: Text(
                                        'Availability',
                                        style: TextStyle(color: Colors.black),
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
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                child: Text(
                  '@2020 Bujishu. All Rights Reserved',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
