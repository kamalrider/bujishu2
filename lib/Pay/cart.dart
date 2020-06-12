import 'package:Bujishu/Pay/payment_method.dart';
import 'package:Bujishu/home/HomeScreen.dart';
import 'package:Bujishu/home/customer_home/customer_home_view.dart';
import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:Bujishu/product_and_category/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class CartPageState extends State<CartPageHome> {
  bool _value1 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              flex: 6,
              child: Container(
                child: FutureBuilder<DetailCategory>(
                  future: fetchAPI('36', 1),
                  builder: (context, snapshot) {
                    List<DetailProduct> klist;
                    Widget sliverData;

                    if (snapshot.hasData) {
                      klist = snapshot.data.detailProduct.toList();

                      sliverData = SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 2.3),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return getContainer(klist[index]);
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
                            Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  'Shopping Cart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ))
                          ]),
                        ),
                        sliverData,
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffCDCECE),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Order Summary'),
                                    ),
                                    Container(
                                      height: 1,
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      color: Color(0xffCDCECE),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Center(
                                                child:
                                                    Text('Subtotal ( Items)'))),
                                        Expanded(
                                            child:
                                                Center(child: Text('RM 0.00'))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Center(
                                                child: Text('Shipping Fee'))),
                                        Expanded(
                                            child:
                                                Center(child: Text('RM 0.00'))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Center(
                                                child:
                                                    Text('Installation Fee'))),
                                        Expanded(
                                            child:
                                                Center(child: Text('RM 0.00'))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child:
                                                Center(child: Text('Total'))),
                                        Expanded(
                                            child:
                                                Center(child: Text('RM 0.00'))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.orange,
                                                Color(0xfffbcc34),
                                                Colors.yellowAccent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            )),
                                        child: MaterialButton(
                                          onPressed : (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod()));
                                          },
                                          child: Text('PROCEED TO CHECKOUT', style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin:EdgeInsets.fromLTRB(0, 2, 0, 2),
                child: Text('@2020 Bujishu. All Rights Reserved', style: TextStyle(color: Colors.black, fontSize: 12),),

              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getContainer(DetailProduct product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(border: Border.all(color: Color(0xffDCDDDD))),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(value: _value1, onChanged: _value1Changed),
                  Container(
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Color(0xffCDCECE),
              height: 1,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: 80,
                            width: 80,
                            child: Image.network(
                              'https://demo3.bujishu.com/storage/uploads/images/categories/table-lights/table-lights.jpg',
                              fit: BoxFit.fitHeight,
                            )),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Table Light',
                                    style: TextStyle(fontSize: 15),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Cool White',
                                    style: TextStyle(fontSize: 11),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'RM 1599.00',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xfff2c334)),
                              ),
                              Container(
                                  height: 20,
                                  child: InkWell(
                                      child: Image.asset(
                                    'assets/images/bin_icon.png',
                                    fit: BoxFit.fitHeight,
                                  )))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: InkWell(
                                      child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  )),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Color(0xffCDCECE),
                                    )),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '0',
                                          textAlign: TextAlign.center,
                                        ))),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: InkWell(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
