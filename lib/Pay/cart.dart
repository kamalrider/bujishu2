import 'package:bujishu2/product_and_category/view/product_detail.dart';
import 'package:flutter/material.dart';

void main() => runApp(CartPage());

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPageHome(),
    );
  }
}

class CartPageHome extends StatefulWidget {
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPageHome>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Featured Deals / "),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            Expanded(),

            Expanded(
              flex: 7,
              child: Container(
                child: FutureBuilder<DetailCategory>(
                  future: fetchAPI('36', 1),
                  builder: (context, snapshot) {
                    List<DetailProduct> klist;
                    Widget sliverData;

                    if (snapshot.hasData) {
                        klist = snapshot.data.detailProduct
                            .toList();

                      sliverData = SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
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

  Widget getText(DetailProduct category){
    return Container(
      child: Column(
        children: <Widget>[
          Text(category.name),
          Container(
            height: 100,
            color: Colors.red,
          ),
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Container(
            height: 100,
            color: Colors.yellow,
          ),
          Container(
            height: 100,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

