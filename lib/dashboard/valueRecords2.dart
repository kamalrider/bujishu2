import 'package:Bujishu/constant.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;

import '../constant.dart';
import '../constant.dart';

class ValueRecordOrder {
  String invoice;
  List<String> images;

  ValueRecordOrder({
    this.invoice,
    this.images,
  });
}

void main() => runApp(ValueRecords2());

class ValueRecords2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValueRecords2Home(),
    );
  }
}

class ValueRecords2Home extends StatefulWidget {
  @override
  _ValueRecords2State createState() => _ValueRecords2State();
}

class _ValueRecords2State extends State<ValueRecords2Home> {
  static List<String> image1 = [
    'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/cupboards/cupboards.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/tables-and-chairs/tables-and-chairs.jpg'
  ];

  static List<String> image2 = [
    'https://demo3.bujishu.com/storage/uploads/images/categories/carpets/carpets.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/curtains/curtains.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/tiles/tiles.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/lightings/lightings.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/roofs/roofs.jpg',
  ];

  static List<String> image3 = [
    'https://demo3.bujishu.com/storage/uploads/images/categories/carpets/carpets.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/curtains/curtains.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/tiles/tiles.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/lightings/lightings.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/roofs/roofs.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/cupboards/cupboards.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/tables-and-chairs/tables-and-chairs.jpg'
  ];

  static List<String> image4 = [
    'https://demo3.bujishu.com/storage/uploads/images/categories/cupboards/cupboards.jpg',
  ];

  static List<String> image5 = [
    'https://demo3.bujishu.com/storage/uploads/images/categories/carpets/carpets.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/curtains/curtains.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/tiles/tiles.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/lightings/lightings.jpg',
    'https://demo3.bujishu.com/storage/uploads/images/categories/roofs/roofs.jpg',
  ];

  static List<String> image6 = [
    'assets/images/eyeball.png',
    'assets/images/eyeball.png',
    'assets/images/eyeball.png',
    'assets/images/eyeball.png',
    'assets/images/eyeball.png',
  ];

  List<ValueRecordOrder> order = [
    ValueRecordOrder(
      invoice: 'BJN20200000036',
      images: image1,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000038',
      images: image2,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000557',
      images: image3,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000563',
      images: image4,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000994',
      images: image5,
    ),
  ];

  int _current = 0;

  double vHeight ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vHeight = 400;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Container(
        width: 200,
        child: NavDrawer(),
      ),
      appBar: GeneralAppBar(context),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Constants.gold2,
                                Colors.white,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'VALUE RECORDS',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ])),
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.1,
                        ),
                        delegate: SliverChildListDelegate(order.map((data) {
                          return getCorosel2(data);
                        }).toList()),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 0,
                child: Container(
                  child: Text(
                    '@2020 Bujishu. All Rights Reserved',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCorosel1(ValueRecordOrder data) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: FractionallySizedBox(
//                                color: Colors.black,
//          width: 400,
//          height: 400,
            heightFactor: 100,
            widthFactor: 100,

//            padding: EdgeInsets.only(left: 50,right: 50),
            child: Carousel(
              boxFit: BoxFit.fitHeight,
              images: data.images.map((String i) => NetworkImage(i)).toList(),
              animationCurve: Curves.easeInToLinear,
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
      ),
    );
  }

  Widget getCorosel2(ValueRecordOrder data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text('PURCHASE #:', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(data.invoice, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
//                                color: Colors.black,
                width: double.infinity,
                height: MediaQuery.of(context).size.height *0.28,
//            padding: EdgeInsets.only(left: 50,right: 50),
                child: CarouselSlider(
//            boxFit: BoxFit.fitHeight,

                  items: data.images.map((String i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                generalToast('go to Product Page');
                              },
                              child: Image.network(
                                i,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),


//            data.images.map((String i) => NetworkImage(i)).toList(),
//            animationCurve: Curves.easeInToLinear,
//            animationDuration: Duration(milliseconds: 2000),
//            dotBgColor: Colors.transparent,
//            indicatorBgPadding: 5.0,
                  //moveIndicatorFromBottom: -15,
//            dotSize: 4.0,
//            dotSpacing: 15.0,
//            dotColor: Color(0xff000000),
//            autoplay: false,
//            height: 400,

                  initialPage: _current,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
//                vHeight = 600;
//                return Transform.scale(
//                  scale: index == _current ? 1 : 0.8,
//                  child: Container(
//                    height: 700,
//                    width: 700,
//                    color: Colors.red,
//                    child: Center(
//                      child: Text(
//                        "$index",
//                        style: TextStyle(fontSize: 30),
//                      ),
//                    ),
//                  ),
//                );
                    });
                  },

                  aspectRatio: 16 / 9,
                  viewportFraction: 0.7,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
//            enlargeStrategy: CenterPageEnlargeStrategy.height,
//            onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4,8,4,8),
                    child: GestureDetector(
                      child: Container(
                        height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Text('Invoice', style: TextStyle(fontSize: 15),textAlign: TextAlign.center,))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4,8,4,8),
                    child: GestureDetector(
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Text('Receipt', style: TextStyle(fontSize: 15),textAlign: TextAlign.center,))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4,8,4,8),
                    child: GestureDetector(
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                            color: Constants.gold2,
                          ),
                          child: Center(child: Text('Buy It Again', style: TextStyle(fontSize: 15),textAlign: TextAlign.center,))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
