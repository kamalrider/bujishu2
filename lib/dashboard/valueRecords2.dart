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
  List<TestImage> img;

  ValueRecordOrder({
    this.invoice,
    this.images,
    this.pdfUrl,
    this.img,
  });
}

class TestImage {
  String img;
  bool frameimg;

  TestImage({
    this.img,
    this.frameimg = false,
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
    'https://staging.bujishu.com/storage/uploads/images/categories/39/table-lamps.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/43/main-doors.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/45/back-doors.jpg',
  ];

  static List<String> image2 = [
    'https://staging.bujishu.com/storage/uploads/images/categories/47/wooden-doors.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/52/single-hung.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/51/door-handles.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/54/arched.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/55/awning.jpg'
  ];

  static List<String> image3 = [
    'https://staging.bujishu.com/storage/uploads/images/categories/39/table-lamps.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/43/main-doors.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/45/back-doors.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/47/wooden-doors.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/52/single-hung.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/51/door-handles.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/54/arched.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/55/awning.jpg'
  ];

  static List<String> image4 = [
    'https://staging.bujishu.com/storage/uploads/images/categories/54/arched.jpg',
  ];

  static List<String> image5 = [
    'https://staging.bujishu.com/storage/uploads/images/categories/45/back-doors.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/47/wooden-doors.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/52/single-hung.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/51/door-handles.jpg',
    'https://staging.bujishu.com/storage/uploads/images/categories/54/arched.jpg',
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
      img: imgs,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000038',
      images: image2,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
      img: imgs,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000557',
      images: image3,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
      img: imgs,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000563',
      images: image4,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
      img: imgs,
    ),
    ValueRecordOrder(
      invoice: 'BJN20200000994',
      images: image5,
      pdfUrl: "https://demo3.bujishu.com/storage/documents/invoice/BJN20200001267/BJN20200001267.pdf",
      img: imgs,
    ),
  ];

  static List<TestImage> imgs = [
    TestImage(
      img: 'https://staging.bujishu.com/storage/uploads/images/categories/45/back-doors.jpg',
    ),

    TestImage(
      img: 'https://staging.bujishu.com/storage/uploads/images/categories/47/wooden-doors.jpg',
    ),

    TestImage(
      img: 'https://staging.bujishu.com/storage/uploads/images/categories/55/awning.jpg',
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

  String _valOrder;
  String _valYear;
  List _listOrder = [ "All Orders",
    "Open Orders",
    "Order Status",
    "Pending Star Ratings",
  ];
  List _listYear = [
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

  void goTop(int i) {
    controller.animateTo(
        0, duration: Duration(microseconds: 500), curve: Curves.easeInOut);
  }

  String test;
  bool frame = false;
  Color frameBorder;

  void centreFunction(int index) {
    setState(() {
      if (index == 0) {

      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vHeight = 400;
    _valYear = _listYear[0];
    _valOrder = _listOrder[2];
    frameBorder = Colors.white;
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
                                    Colors.white, Colors.white,
                                    Colors.white,
                                    Constants.gold2,

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
                              Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: gold2,

                                ),
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffded9d6),
                                        Color(0xff8b878d),
                                        Color(0xfff3f4f4),
                                        Color(0xff807b80),
                                        Color(0xffa7a9ac),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,),
                                  ),
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
//                                          Colors.white,
                                          Color(0xffFFE700),
                                          Constants.gold2,
                                          Constants.gold2,
                                          Constants.gold2,
                                          Color(0xffFFE700),

//                                          Colors.white,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,),
                                    ),
                                    child: DropdownButton(
                                      hint: Text("Select The Year"),
                                      value: _valYear,
                                      items: _listYear.map((value) {
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
                                          _valYear = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                               Theme(
                                 data: ThemeData(
                                   canvasColor: Colors.transparent,
                                 ),
                                 child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffded9d6),
                                          Color(0xff8b878d),
                                          Color(0xfff3f4f4),
                                          Color(0xff807b80),
                                          Color(0xffa7a9ac),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,),
                                    ),
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xffFFE700),
                                            Constants.gold2,
                                            Constants.gold2,
                                            Constants.gold2,
                                            Color(0xffFFE700),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,),
                                      ),
                                      child: DropdownButton(
                                        hint: Text("Select The Order"),
                                        value: _valOrder,
                                        items: _listOrder.map((value) {

                                          Widget droplist(){

                                            if (value == _listOrder[0]){
                                              return Container(
                                                width: 150,
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: gold2,
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    topRight: Radius.circular(20),
                                                  ),
                                                ),
                                                child: Text(value, style: TextStyle(fontSize: 12),),
                                              );
                                            }
                                            else if (value == _listOrder.last){
                                              return Container(
                                                padding: EdgeInsets.all(8),
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: gold2,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                  ),
                                                ),
                                                child: Text(value, style: TextStyle(fontSize: 12),),
                                              );
                                            }
                                            else {
                                              return Container(
                                                padding: EdgeInsets.all(8),
                                                width: 150,

                                                color: gold2,
                                                child: Text(value, style: TextStyle(fontSize: 12),),
                                              );
                                            }

                                          }


                                          return DropdownMenuItem(
                                              child: droplist(),
                                            value: value,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _valOrder = value;
                                          });
                                        },
                                      ),
                                    ),
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
        onPressed: () {
          setState(() {
            onTap();
          });
        },
        child: Icon(Icons.navigation),
        backgroundColor: gold2,
      ),
    );
  }

  void onTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ValueRecords2Home()));
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
                      onTap: () {
                        generalToast('Go to cart page');
                      },
                      child: Icon(Icons.shopping_cart, color: gold2,)),
                  Container(height: 2, width: 30, color: gold2,),
                  InkWell(
                      onTap: () {
                        generalToast('Go to ship page');
                      },
                      child: Icon(Icons.local_shipping, color: Colors.grey,)),
                  Container(height: 2, width: 30, color: Colors.grey,),
                  InkWell(
                      onTap: () {
                        generalToast('Go to receive page');
                      },
                      child: Icon(Icons.archive, color: Colors.grey,)),
                  Container(height: 2, width: 30, color: Colors.grey,),
                  InkWell(
                      onTap: () {
                        generalToast('Go to complete page');
                      },
                      child: Icon(Icons.check_circle, color: Colors.grey,))
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

                  items: data.img.map((i) {
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
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: frameBorder, width: 2),
                                ),
                                child: Image.network(
                                  i.img,
                                  fit: BoxFit.fitHeight,
                                ),
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
                    frameBorder = data.img[index].frameimg ? gold2 : Colors.white;
                    setState(() {
                      test = data.img[index].img;


                      data.img.forEach((f) => f.frameimg = false);

                      data.img[index].frameimg = !data.img[index].frameimg;
                      frameBorder = data.img[index].frameimg ? gold2 : Colors.white;

//                      if (index == 0)
//                        frame = true;



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
                      onTap: () {
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
