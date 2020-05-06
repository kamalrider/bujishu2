
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';




enum rankMarker { all, sta, mod, pre }

class NextPage extends StatefulWidget {
  final String value;

  NextPage({Key key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class LigthingDetail {
  String title;
  String image;
  String description;
  bool expended;
  String rank;
  double score;
  int rating;
  double customerScore;
  List<String> areaService;
  String commitment;

  LigthingDetail(
      {this.title,
        this.image,
        this.description,
        this.rank,
        this.score,
        this.rating,
        this.expended = false});
}

class _NextPageState extends State<NextPage> {
  rankMarker selectedrank = rankMarker.all;

  List<LigthingDetail> ligthingData = [
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'STANDARD',
      score: 3,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Eyeball\nDownlight',
      image: 'assets/images/officelamp.jpg',
      rank: 'STANDARD',
      score: 3,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'MODERATE',
      score: 3.5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Eyeball\nDownlight',
      image: 'assets/images/officelamp.jpg',
      rank: 'MODERATE',
      score: 3.5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'PREMIUM',
      score: 5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/officelamp.jpg',
      rank: 'PREMIUM',
      score: 5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'STANDARD',
      score: 3,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Eyeball\nDownlight',
      image: 'assets/images/officelamp.jpg',
      rank: 'STANDARD',
      score: 3,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'MODERATE',
      score: 3.5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Eyeball\nDownlight',
      image: 'assets/images/officelamp.jpg',
      rank: 'MODERATE',
      score: 3.5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'PREMIUM',
      score: 5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/officelamp.jpg',
      rank: 'PREMIUM',
      score: 5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'STANDARD',
      score: 3,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Eyeball\nDownlight',
      image: 'assets/images/officelamp.jpg',
      rank: 'STANDARD',
      score: 3,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'MODERATE',
      score: 3.5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Eyeball\nDownlight',
      image: 'assets/images/officelamp.jpg',
      rank: 'MODERATE',
      score: 3.5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'LED',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/eyeball.png',
      rank: 'PREMIUM',
      score: 5,
      rating: 120,
    ),
    LigthingDetail(
      title: 'PEN',
      description: 'Single Round Eyeball White Casing With GU 10001',
      image: 'assets/images/officelamp.jpg',
      rank: 'PREMIUM',
      score: 5,
      rating: 120,
    ),
  ];

  List<LigthingDetail> datas;

  List<LigthingDetail> datassta;

  List<LigthingDetail> datasmod;

  List<LigthingDetail> dataspre;

  double containerHeight;
  String dTitle = "";

  Color dColor(String rank) {
    if (rank == 'STANDARD') {
      return Colors.red;
    } else if (rank == 'MODERATE') {
      return Colors.blue;
    } else if (rank == 'PREMIUM') {
      return Colors.yellow;
    } else
      return Colors.red;
  }

  @override
  void initState() {
    super.initState();
    dTitle = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    if (selectedrank == rankMarker.all)
      datas = ligthingData.where((i) => i.title == dTitle).toList();
    else if (selectedrank == rankMarker.sta)
      datassta = datas.where((i) => i.rank == 'STANDARD').toList();
    else if (selectedrank == rankMarker.mod)
      datasmod = datas.where((i) => i.rank == 'MODERATE').toList();
    else if (selectedrank == rankMarker.pre)
      dataspre = datas.where((i) => i.rank == 'PREMIUM').toList();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Featured Deals / " + dTitle),
        backgroundColor: Colors.black,
      ),
//      body: new Text("${widget.value}"),

      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 50,
                    ),
                  ]),
                ),
                getRank(),
              ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: 2, top: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Colors.grey,
                ),
                child: MaterialButton(
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedrank = rankMarker.all;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 2, top: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Colors.red,
                ),
                child: MaterialButton(
                  child: Text(
                    'Standard',
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedrank = rankMarker.sta;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 2, top: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Colors.blue,
                ),
                child: MaterialButton(
                  child: Text(
                    'Moderate',
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedrank = rankMarker.mod;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 2, top: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Colors.yellow,
                ),
                child: MaterialButton(
                  child: Text(
                    'Premium',
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedrank = rankMarker.pre;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getRank() {
    if (selectedrank == rankMarker.all)
      return Sliver(datas);
    else if (selectedrank == rankMarker.sta)
      return Sliver(datassta);
    else if (selectedrank == rankMarker.mod)
      return Sliver(datasmod);
    else if (selectedrank == rankMarker.pre)
      return Sliver(dataspre);
    else
      return Sliver(datas);
  }

  Widget Sliver(List<LigthingDetail> datalist) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.8),
      delegate: SliverChildListDelegate(datalist.map((data) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 500,
            child: getImages(data),
          ),
        );
      }).toList()),
    );
  }

  Widget getImages(LigthingDetail item) {
    return Container(
      color: Color(0xffF0F1F1),
      child: Banner(
        message: item.rank,
        textStyle: TextStyle(color: Colors.black, fontSize: 10),
        location: BannerLocation.topEnd,
        color: dColor(item.rank),
        child: MaterialButton(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: FittedBox(
                  child: Image.asset(item.image),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  item.description,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              FlutterRatingBarIndicator(
                rating: item.score,
                itemCount: 5,
                itemSize: 15.0,
                emptyColor: Colors.amber.withAlpha(50),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text((item.rating).toString() + ' ratings'),
              ),
            ],
          ),
//          onPressed: () {
//            showDialog(
//                context: context,
//                builder: (BuildContext context) {
//                  return AlertDialog(
////                title: Text("Alert Dialog"),
//                    backgroundColor: Colors.black,
//
//                    content: Container(
//                        child: Column(
//                          children: <Widget>[
//                            Container(
//                              width: MediaQuery.of(context).size.width * 0.69,
//                              child: Text(
//                                'Panels Selling - '+ item.title,
//                                style: TextStyle(color: Colors.white),
//                              ),
//                            ),
//                            SizedBox(
//                              height: 10,
//                            ),
//                            Container(
//                              height: MediaQuery.of(context).size.height * 0.69,
//                              child: SingleChildScrollView(
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(
//                                      width:
//                                      MediaQuery.of(context).size.width * 0.67,
//                                      padding: EdgeInsets.all(10),
//                                      color: Colors.white,
//                                      child: Column(
//                                        children: <Widget>[
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Bujishu Sdn Bhd', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text(
//                                              '120.00',
//
//                                            ),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: InkWell(
////                                                onTap: (){
////                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail()));
////                                                }
////                                                ,
//                                                child: Text('Panel Rating', style: TextStyle(
//                                                    fontWeight: FontWeight.bold),)),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: FlutterRatingBarIndicator(
//                                              rating: 5,
//                                              itemCount: 5,
//                                              itemSize: 10.0,
//                                              emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                            ),
//                                          ),
//                                          SizedBox(
//                                            height: 8,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Customer Rating', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: FlutterRatingBarIndicator(
//                                              rating: 5,
//                                              itemCount: 5,
//                                              itemSize: 10.0,
//                                              emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                            ),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Area of Service', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text(
//                                              'KL, Seremban',
//
//                                            ),
//                                          ),
//                                          SizedBox(height: 8),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Commitment', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text(
//                                                'With 15 years experience in manufacturing and serving our customers,' +
//                                                    'we can guarantee that this product will meet your needs and 100% satisfy you'),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      height: 20,
//                                    ),
//                                    Container(
//                                      width:
//                                      MediaQuery.of(context).size.width * 0.67,
//                                      padding: EdgeInsets.all(10),
//                                      color: Colors.white,
//                                      child: Column(
//                                        children: <Widget>[
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Bujishu Sdn Bhd', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text(
//                                              '120.00',
//                                            ),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Panel Rating', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: FlutterRatingBarIndicator(
//                                              rating: 5,
//                                              itemCount: 5,
//                                              itemSize: 10.0,
//                                              emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                            ),
//                                          ),
//                                          SizedBox(
//                                            height: 8,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Customer Rating', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: FlutterRatingBarIndicator(
//                                              rating: 5,
//                                              itemCount: 5,
//                                              itemSize: 10.0,
//                                              emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                            ),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Area of Service', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text(
//                                              'KL, Seremban',
//
//                                            ),
//                                          ),
//                                          SizedBox(height: 8),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text('Commitment', style: TextStyle(
//                                                fontWeight: FontWeight.bold),),
//                                          ),
//                                          SizedBox(
//                                            height: 5,
//                                          ),
//                                          Align(
//                                            alignment: Alignment.topLeft,
//                                            child: Text(
//                                                'With 15 years experience in manufacturing and serving our customers,' +
//                                                    'we can guarantee that this product will meet your needs and 100% satisfy you'),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        )),
//                  );
//                });
//          },
        ),
      ),
    );
  }
}
