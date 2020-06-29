import 'package:Bujishu/constant.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


import '../constant.dart';
import '../constant.dart';

class ValueRecordOrder {
  String invoice;
  List<String> images;
  String pdfUrl;

  ValueRecordOrder({
    this.invoice,
    this.images,
    this.pdfUrl,
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new ValueRecords2());
  });
}

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
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000038',
      images: image2,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000557',
      images: image3,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000563',
      images: image4,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000994',
      images: image5,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
    ),
  ];

  int _current = 0;


  double vHeight;

  String valOrder;

  List orderType = [
    "All Orders",
    "Open Orders",
    "Order Status",
    "Pending Star Ratings",
  ];

  String _valGender;
  String _valFriends;
  List _listGender = [ "All Orders",
    "Open Orders",
    "Order Status",
    "Pending Star Ratings",
  ];
  List _myFriends = [
    "2020",
    "2019",
    "2018",
    "2017",
  ];

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final ScrollController controller = ScrollController();
  void goTop(int i){
    controller.animateTo(0, duration:Duration(microseconds: 500), curve:Curves.easeInOut);
  }
  String test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vHeight = 400;
    _valFriends = _myFriends[0];
    _valGender = _listGender[2];

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
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Constants.gold2,
                                      Colors.white,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,),
                                ),
                                child: DropdownButton(
                                  hint: Text("Select The Year"),
                                  value: _valFriends,
                                  items: _myFriends.map((value) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(value),
                                      ),
                                      value: value,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _valFriends = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Constants.gold2,
                                      Colors.white,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,),
                                ),
                                child: DropdownButton(
                                  hint: Text("Select The Order"),
                                  value: _valGender,
                                  items: _listGender.map((value) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(value),
                                      ),
                                      value: value,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _valGender = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ])),
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.05,
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            onTap();
          });

        },
        child: Icon(Icons.navigation),
        backgroundColor: gold2,
      ),
    );
  }

  void onTap(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ValueRecords2Home()));
  }

  Widget getCorosel1(ValueRecordOrder data) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
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
                  Text('PURCHASE #:',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(data.invoice,
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 20,),

                ],
              ),
            ),



            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap:(){
                      generalToast('Go to cart page');
                    },
                      child: Icon(Icons.shopping_cart, color: gold2,)),
                  Container(height: 2, width: 30, color: gold2,),
                  InkWell(
                      onTap:(){
                        generalToast('Go to ship page');
                      },
                      child: Icon(Icons.local_shipping,  color: Colors.grey,)),
                  Container(height: 2, width: 30, color: Colors.grey,),
                  InkWell(
                      onTap:(){
                        generalToast('Go to receive page');
                      },
                      child: Icon(Icons.archive,  color: Colors.grey,)),
                  Container(height: 2, width: 30, color: Colors.grey,),
                  InkWell(
                      onTap:(){
                        generalToast('Go to complete page');
                      },
                      child: Icon(Icons.check_circle,  color: Colors.grey,))
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
//                                color: Colors.black,
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.28,
//            padding: EdgeInsets.only(left: 50,right: 50),
                child: CarouselSlider(
//            boxFit: BoxFit.fitHeight,

                  items: data.images.map((
                      i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                generalToast('go to Product Page $i');
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

                      test = data.images[index];
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

                  aspectRatio: 16/9,
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
                    padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _launchURL(data.pdfUrl);
                        });
                      },
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Text('Invoice',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                    child: GestureDetector(
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Text('Receipt',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                    child: GestureDetector(
                      onTap: (){
                        generalToast('go to page $test');
                      },
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                            color: Constants.gold2,
                          ),
                          child: Center(child: Text('Buy It Again',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,))),
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
