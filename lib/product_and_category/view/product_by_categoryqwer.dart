import 'package:bujishu2/home/customer_home/nav_drawer.dart';
import 'package:bujishu2/product_and_category/model/category.dart';
import 'package:bujishu2/product_and_category/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Modelt>> fetchAlbum(String id) async {
  final response = await http.get('https://demo3.bujishu.com/api/category/'+id);

//  if (response.statusCode == 200) {
////    // If the server did return a 200 OK response,
////    // then parse the JSON.
////    return Modelt.fromJson(json.decode(response.body));
////  } else {
////    // If the server did not return a 200 OK response,
////    // then throw an exception.
////    throw Exception('Failed to load album');
////  }

  final responseJson = json.decode(response.body);

  return (responseJson as List)
      .map((e) => Modelt.fromJson((e as Map).map(
            (k, e) => MapEntry(k as String, e),
          )))
      .toList();
}

Future<List<Modelt>> fetchimage() async {
  final response = await http.get('https://demo3.bujishu.com/api/category/2');

//  if (response.statusCode == 200) {
////    // If the server did return a 200 OK response,
////    // then parse the JSON.
////    return Modelt.fromJson(json.decode(response.body));
////  } else {
////    // If the server did not return a 200 OK response,
////    // then throw an exception.
////    throw Exception('Failed to load album');
////  }

  final responseJson = json.decode(response.body);

  return (responseJson as List)
      .map((e) => Modelt.fromJson((e as Map).map(
            (k, e) => MapEntry(k as String, e),
          )))
      .toList();
}

//Future<List<Modelt>> fetchWhichAPI() async {
//  String value;
//  value = 'b';
//  if (value == 'a') {
//    return fetchAlbum();
//  } else {
//    return fetchimage();
//  }
//}

class Modelt {
  final int id;
  final String name;
  final String slug;
  final int parent_category_id;
  final String created_at;
//  final String updated_at;

  Modelt(
      {this.id,
      this.name,
      this.slug,
      this.parent_category_id,
      this.created_at,
//      this.updated_at
      });

  factory Modelt.fromJson(Map<String, dynamic> json) {
    return new Modelt(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      parent_category_id: json['parent_category_id'],
      created_at: json['created_at'],
//      updated_at: json['updated_at'],
    );
  }
}

void main() => runApp(ProductCategory());

enum WidgetMarker { inn, out }

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductCategoryHomeAPI(),
    );
  }
}

class ProductCategoryHomeAPI extends StatefulWidget {
  final Category value;

  ProductCategoryHomeAPI({Key key, this.value}) : super(key: key);

  @override
  _ProductCategoryHomeState createState() => _ProductCategoryHomeState();
}

class _ProductCategoryHomeState extends State<ProductCategoryHomeAPI> {
  List<String> _locations = ['All CAtegories (VVIP)']; // Option 2
  String _selectedLocation; // Option 2

  Future<List<Modelt>> futureAlbum;

  String value;
  int w = 0;

  @override
  void initState() {
    super.initState();




  }

//  @override
//  void initState() {
//    super.initState();
//    catgr = widget.value;
//  }

  double containerHeight;

  @override
  Widget build(BuildContext context) {
//    List<Prodduct> productlist = widget.value.product;
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
                height: 500,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        MaterialButton(
//                          onPressed: () {
//                            setState(() {
//                              productlist.forEach((f) => f.expended = false);
//
//                              //data.expended = !data.expended;
//                            });
//                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffF0F1F1),
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 2,
                                                  color: Colors.grey))),
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: InkWell(
                                              child: Text(
                                                'Home',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.lightBlue),
                                              ),
                                              //onTap: () {}
                                            ),
                                          ),
                                          Text(' / '+ widget.value.name),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    widget.value.name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Featured Categories',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Container(
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return FutureBuilder<List<Modelt>>(
                          future: fetchAlbum(widget.value.APIid),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: getImages(snapshot.data[index]),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        );
                      },
//                        childCount: w,
                      ),
                    ),
                  
                  
//                    FutureBuilder<List<Modelt>>(
//                      future: fetchWhichAPI(),
//                      builder: (context, snapshot) {
//                        if (snapshot.hasData) {
//                          return SliverGrid(
//                            gridDelegate:
//                                SliverGridDelegateWithFixedCrossAxisCount(
//                              crossAxisCount: 2,
//                            ),
//                            delegate: SliverChildBuilderDelegate(
//                              (BuildContext context, int index) {
//                                return Text(snapshot.data[index].name);
//                              },
//                              childCount: snapshot.data.length,
//                            ),
//                          );
//                        } else
//                          return CircularProgressIndicator();
//                      },
//                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 2,
                                color: Color(0xffD4AF37),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'About Us',
                                      style: TextStyle(
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Partnership',
                                      style: TextStyle(
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
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
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Privacy Policy',
                                      style: TextStyle(
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'View Cart',
                                      style: TextStyle(
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
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
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Contact Us',
                                      style: TextStyle(
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'My Wishlist',
                                      style: TextStyle(
                                          color: Color(0xfffbcc34),
                                          fontSize: 5),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child:   Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 2,
                      color: Color(0xffD4AF37),
                    ),
                    SizedBox(
                      height:
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'About Us',
                            style: TextStyle(
                                color: Color(0xfffbcc34),
                                fontSize: 5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Partnership',
                            style: TextStyle(
                                color: Color(0xfffbcc34),
                                fontSize: 5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Color(0xfffbcc34),
                                fontSize: 5),
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
                                color: Color(0xfffbcc34),
                                fontSize: 5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Color(0xfffbcc34),
                                fontSize: 5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'View Cart',
                            style: TextStyle(
                                color: Color(0xfffbcc34),
                                fontSize: 5),
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
                                color: Color(0xfffbcc34),
                                fontSize: 5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                                color: Color(0xfffbcc34),
                                fontSize: 5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'My Wishlist',
                            style: TextStyle(
                                color: Color(0xfffbcc34),
                                fontSize: 5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImages(Modelt item) {
   // containerHeight = item.expended ? 60 : 0;

    return Container(
      child: Column(




        children: <Widget>[
          Expanded(
            child: Image.network(
              'https://bujishu.com/storage/uploads/images/products/ales-anti-mosq/ales-anti-mosq_1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Text(item.name),
          ),
          /*AnimatedContainer(
            height: containerHeight,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Divider(
                    height: 6,
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  child: Text(
                    item.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
//                    var route = new MaterialPageRoute(
//                      builder: (BuildContext context) =>
//                          new NextPage(value: item.title),
//                    );
//                    Navigator.of(context).push(route);
                  },
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }
}

//enum rankMarker { all, sta, mod, pre }
//
//class NextPage extends StatefulWidget {
//  final String value;
//
//  NextPage({Key key, this.value}) : super(key: key);
//
//  @override
//  _NextPageState createState() => new _NextPageState();
//}
//
//class LigthingDetail {
//  String title;
//  String image;
//  String description;
//  bool expended;
//  String rank;
//  double score;
//  int rating;
//  double customerScore;
//  List<String> areaService;
//  String commitment;
//
//  LigthingDetail(
//      {this.title,
//      this.image,
//      this.description,
//      this.rank,
//      this.score,
//      this.rating,
//      this.expended = false});
//}
//
//class _NextPageState extends State<NextPage> {
//  rankMarker selectedrank = rankMarker.all;
//
//  List<LigthingDetail> ligthingData = [
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'STANDARD',
//      score: 3,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Eyeball\nDownlight',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'STANDARD',
//      score: 3,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'MODERATE',
//      score: 3.5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Eyeball\nDownlight',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'MODERATE',
//      score: 3.5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'PREMIUM',
//      score: 5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'PREMIUM',
//      score: 5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'STANDARD',
//      score: 3,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Eyeball\nDownlight',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'STANDARD',
//      score: 3,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'MODERATE',
//      score: 3.5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Eyeball\nDownlight',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'MODERATE',
//      score: 3.5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'PREMIUM',
//      score: 5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'PREMIUM',
//      score: 5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'STANDARD',
//      score: 3,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Eyeball\nDownlight',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'STANDARD',
//      score: 3,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'MODERATE',
//      score: 3.5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Eyeball\nDownlight',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'MODERATE',
//      score: 3.5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'LED',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/eyeball.png',
//      rank: 'PREMIUM',
//      score: 5,
//      rating: 120,
//    ),
//    LigthingDetail(
//      title: 'PEN',
//      description: 'Single Round Eyeball White Casing With GU 10001',
//      image: 'assets/images/officelamp.jpg',
//      rank: 'PREMIUM',
//      score: 5,
//      rating: 120,
//    ),
//  ];
//
//  List<LigthingDetail> datas;
//
//  List<LigthingDetail> datassta;
//
//  List<LigthingDetail> datasmod;
//
//  List<LigthingDetail> dataspre;
//
//  WidgetMarker selectedWidgetMarker = WidgetMarker.inn;
//
//  double containerHeight;
//  String dTitle = "";
//
//  Color dColor(String rank) {
//    if (rank == 'STANDARD') {
//      return Colors.red;
//    } else if (rank == 'MODERATE') {
//      return Colors.blue;
//    } else if (rank == 'PREMIUM') {
//      return Colors.yellow;
//    } else
//      return Colors.red;
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    dTitle = widget.value;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (selectedrank == rankMarker.all)
//      datas = ligthingData.where((i) => i.title == dTitle).toList();
//    else if (selectedrank == rankMarker.sta)
//      datassta = datas.where((i) => i.rank == 'STANDARD').toList();
//    else if (selectedrank == rankMarker.mod)
//      datasmod = datas.where((i) => i.rank == 'MODERATE').toList();
//    else if (selectedrank == rankMarker.pre)
//      dataspre = datas.where((i) => i.rank == 'PREMIUM').toList();
//
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Featured Deals / " + dTitle),
//        backgroundColor: Colors.black,
//      ),
////      body: new Text("${widget.value}"),
//
//      body: Column(
//        children: <Widget>[
//          Expanded(
//            child: CustomScrollView(
//              slivers: <Widget>[
//                SliverList(
//                  delegate: SliverChildListDelegate([
//                    SizedBox(
//                      height: 50,
//                    ),
//                  ]),
//                ),
//                getRank(),
//              ],
//            ),
//          ),
//          Expanded(
//            flex: 0,
//            child: Container(
//              child: Container(
//                width: MediaQuery.of(context).size.width,
//                color: Colors.black,
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      height: 2,
//                      color: Color(0xffD4AF37),
//                    ),
//                    SizedBox(
//                      height: MediaQuery.of(context).size.height * 0.01,
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(
//                            'About Us',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Partnership',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Sign In',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(
//                            'FAQ',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Privacy Policy',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'View Cart',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(
//                            'Warranty',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'Contact Us',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                        Expanded(
//                          child: Text(
//                            'My Wishlist',
//                            style: TextStyle(
//                                color: Color(0xfffbcc34), fontSize: 5),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ],
//                    ),
//                    SizedBox(
//                      height: MediaQuery.of(context).size.height * 0.01,
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          )
//        ],
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
//      floatingActionButton: Container(
//        margin: EdgeInsets.only(top: 50),
//        width: MediaQuery.of(context).size.width * 0.9,
//        child: Row(
//          children: <Widget>[
//            Expanded(
//              flex: 2,
//              child: Container(
//                margin: EdgeInsets.only(right: 2, top: 2),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(2)),
//                  color: Colors.grey,
//                ),
//                child: MaterialButton(
//                  child: Text(
//                    'All',
//                    style: TextStyle(fontSize: 12),
//                  ),
//                  onPressed: () {
//                    setState(() {
//                      selectedrank = rankMarker.all;
//                    });
//                  },
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 3,
//              child: Container(
//                margin: EdgeInsets.only(right: 2, top: 2),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(2)),
//                  color: Colors.red,
//                ),
//                child: MaterialButton(
//                  child: Text(
//                    'Standard',
//                    style: TextStyle(fontSize: 12),
//                  ),
//                  onPressed: () {
//                    setState(() {
//                      selectedrank = rankMarker.sta;
//                    });
//                  },
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 3,
//              child: Container(
//                margin: EdgeInsets.only(right: 2, top: 2),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(2)),
//                  color: Colors.blue,
//                ),
//                child: MaterialButton(
//                  child: Text(
//                    'Moderate',
//                    style: TextStyle(fontSize: 12),
//                  ),
//                  onPressed: () {
//                    setState(() {
//                      selectedrank = rankMarker.mod;
//                    });
//                  },
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 3,
//              child: Container(
//                margin: EdgeInsets.only(right: 2, top: 2),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(2)),
//                  color: Colors.yellow,
//                ),
//                child: MaterialButton(
//                  child: Text(
//                    'Premium',
//                    style: TextStyle(fontSize: 12),
//                  ),
//                  onPressed: () {
//                    setState(() {
//                      selectedrank = rankMarker.pre;
//                    });
//                  },
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget getRank() {
//    if (selectedrank == rankMarker.all)
//      return Sliver(datas);
//    else if (selectedrank == rankMarker.sta)
//      return Sliver(datassta);
//    else if (selectedrank == rankMarker.mod)
//      return Sliver(datasmod);
//    else if (selectedrank == rankMarker.pre)
//      return Sliver(dataspre);
//    else
//      return Sliver(datas);
//  }
//
//  Widget Sliver(List<LigthingDetail> datalist) {
//    return SliverGrid(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 2, childAspectRatio: 0.8),
//      delegate: SliverChildListDelegate(datalist.map((data) {
//        return Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Container(
//            height: 500,
//            child: getImages(data),
//          ),
//        );
//      }).toList()),
//    );
//  }
//
//  Widget getImages(LigthingDetail item) {
//    return Container(
//      color: Color(0xffF0F1F1),
//      child: Banner(
//        message: item.rank,
//        textStyle: TextStyle(color: Colors.black, fontSize: 10),
//        location: BannerLocation.topEnd,
//        color: dColor(item.rank),
//        child: MaterialButton(
//          child: Column(
//            children: <Widget>[
//              Container(
//                height: 100,
//                child: FittedBox(
//                  child: Image.asset(item.image),
//                  fit: BoxFit.cover,
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.all(4),
//                child: Text(
//                  item.description,
//                  style: TextStyle(fontSize: 12),
//                ),
//              ),
//              FlutterRatingBarIndicator(
//                rating: item.score,
//                itemCount: 5,
//                itemSize: 15.0,
//                emptyColor: Colors.amber.withAlpha(50),
//              ),
//              Padding(
//                padding: EdgeInsets.all(4),
//                child: Text((item.rating).toString() + ' ratings'),
//              ),
//            ],
//          ),
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
//                      children: <Widget>[
//                        Container(
//                          width: MediaQuery.of(context).size.width * 0.69,
//                          child: Text(
//                            'Panels Selling - ' + item.title,
//                            style: TextStyle(color: Colors.white),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 10,
//                        ),
//                        Container(
//                          height: MediaQuery.of(context).size.height * 0.69,
//                          child: SingleChildScrollView(
//                            child: Column(
//                              children: <Widget>[
//                                Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.67,
//                                  padding: EdgeInsets.all(10),
//                                  color: Colors.white,
//                                  child: Column(
//                                    children: <Widget>[
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Bujishu Sdn Bhd',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          '120.00',
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: InkWell(
////                                            onTap: () {
////                                              Navigator.push(
////                                                  context,
////                                                  MaterialPageRoute(
////                                                      builder: (context) =>
////                                                          ProductDetail()));
////                                            },
//                                            child: Text(
//                                              'Panel Rating',
//                                              style: TextStyle(
//                                                  fontWeight: FontWeight.bold),
//                                            )),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: FlutterRatingBarIndicator(
//                                          rating: 5,
//                                          itemCount: 5,
//                                          itemSize: 10.0,
//                                          emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 8,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Customer Rating',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: FlutterRatingBarIndicator(
//                                          rating: 5,
//                                          itemCount: 5,
//                                          itemSize: 10.0,
//                                          emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Area of Service',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'KL, Seremban',
//                                        ),
//                                      ),
//                                      SizedBox(height: 8),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Commitment',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                            'With 15 years experience in manufacturing and serving our customers,' +
//                                                'we can guarantee that this product will meet your needs and 100% satisfy you'),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 20,
//                                ),
//                                Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.67,
//                                  padding: EdgeInsets.all(10),
//                                  color: Colors.white,
//                                  child: Column(
//                                    children: <Widget>[
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Bujishu Sdn Bhd',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          '120.00',
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Panel Rating',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: FlutterRatingBarIndicator(
//                                          rating: 5,
//                                          itemCount: 5,
//                                          itemSize: 10.0,
//                                          emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 8,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Customer Rating',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: FlutterRatingBarIndicator(
//                                          rating: 5,
//                                          itemCount: 5,
//                                          itemSize: 10.0,
//                                          emptyColor:
//                                              Colors.amber.withAlpha(50),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Area of Service',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'KL, Seremban',
//                                        ),
//                                      ),
//                                      SizedBox(height: 8),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          'Commitment',
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 5,
//                                      ),
//                                      Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                            'With 15 years experience in manufacturing and serving our customers,' +
//                                                'we can guarantee that this product will meet your needs and 100% satisfy you'),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    )),
//                  );
//                });
//          },
//        ),
//      ),
//    );
//  }
//}
