import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:Bujishu/product_and_category/view/product_by_categoryqwer2.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;

class Record {
  int id;
  String name;
  String image;

//  int APIid;

  Record({
    this.id,
    this.name,
    this.image,
  });
}

void main() => runApp(ValueRecords());

class ValueRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValueRecordsHome(),
    );
  }
}

class ValueRecordsHome extends StatefulWidget {
  @override
  _ValueRecordsState createState() => _ValueRecordsState();
}

class _ValueRecordsState extends State<ValueRecordsHome> {
  List<Record> records = [
    Record(
      id: 1,
      name: 'RENOVATION / REPAIRING',
      image:
          'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    ),
    Record(
      id: 2,
      name: 'ELECTRICAL',
      image:
          'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    ),
    Record(
      id: 3,
      name: 'PAINT',
      image:
          'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    ),
    Record(
      id: 4,
      name: 'PLASTER CEILING / PARTITION',
      image:
          'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    ),
    Record(
      id: 5,
      name: 'HARDWARE',
      image:
          'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    ),
    Record(
      id: 6,
      name: 'AIR CONDITIONING',
      image:
          'https://demo3.bujishu.com/storage/uploads/images/categories/bedsheets-and-mattresses/bedsheets-and-mattresses.jpg',
    ),
  ];

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
                            'Value Records',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ])),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.9,
                        ),
                        delegate: SliverChildListDelegate(records.map((data) {
                          return getContainer(data);
                        }).toList()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: Text(
                    '@2020 Bujishu. All Rights Reserved',
                    style: TextStyle(color: Constants.black, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getContainer(Record item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 2, child: Text('Order #:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),)),
                        Expanded(flex: 5, child: Text('PO202006-000019', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 5, child: Text('Order Date:', style: TextStyle(fontSize: 12),)),
                        Expanded(flex: 6, child: Text('13/06/2020', style: TextStyle(fontSize: 12),)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Image.network(item.image, fit: BoxFit.fitWidth,),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 2,),
                        Text('Libreria', style: TextStyle(fontSize: 12),textAlign: TextAlign.start,),
                        SizedBox(height: 2,),
                        Text('Sold By: Bujishu Sdn Bhd', style: TextStyle(fontSize: 12),),
                        SizedBox(height: 2,),
                        Text('Quantity:1', style: TextStyle(fontSize: 12),),
                        SizedBox(height: 2,),
                        Text('Estimate Delivery Date: Pending', style: TextStyle(fontSize: 12),),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('View 4 more products', style: TextStyle(fontSize: 12),),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  Expanded(child: Text('Total item : 5', style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
                ],
              ),

//              Row(
//                children: <Widget>[
//                  Expanded(
//                    flex: 5,
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            child: MaterialButton(
//                              child: Container(
//                                decoration: BoxDecoration(
//                                  border: Border.all(color: Colors.black),
//                                  borderRadius: BorderRadius.circular(5)
//                                ),
//                                padding: EdgeInsets.all(5),
//                                child: Text('Invoice', style: TextStyle(fontSize: 12),),
//                              ),
//                            ),
//                          ),
//                        ),
//                        Expanded(
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: MaterialButton(
//                              child: Container(
//                                child: Text('Receipt'),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//
//                  Expanded(
//                    flex: 4,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: MaterialButton(
//                        child: Container(
//                          child: Text('But It Again'),
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4,8,4,8),
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                          child: Text('Invoice', style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4,8,4,8),
                    child: GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('Receipt', style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4,8,4,8),
                    child: GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                            color: Constants.gold2,
                          ),
                          child: Text('Buy It Again', style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
                    ),
                  ),
                ),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
