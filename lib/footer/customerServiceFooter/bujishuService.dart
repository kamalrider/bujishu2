import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:Bujishu/product_and_category/view/product_by_categoryqwer2.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;

class Service {

  int id;
  String name;
  String image;
  int APIid;

  Service({this.id, this.name, this.image, this.APIid});
}


void main() => runApp(BujishuService());

class BujishuService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BujishuServiceHome(),
    );
  }
}

class BujishuServiceHome extends StatefulWidget {

  @override
  _BujishuServiceState createState() => _BujishuServiceState();
}

class _BujishuServiceState extends State<BujishuServiceHome> {


  List<Service> services = [

    Service(
      id: 1,
      name: 'RENOVATION / REPAIRING',
      image: 'assets/images/renovationservice.png',
      APIid: 13,
    ),

    Service(
      id: 2,
      name: 'ELECTRICAL',
      image: 'assets/images/electricalservice.png',
      APIid: 13,
    ),

    Service(
      id: 3,
      name: 'PAINT',
      image: 'assets/images/paintservice.png',
      APIid: 65,
    ),

    Service(
      id: 4,
      name: 'PLASTER CEILING / PARTITION',
      image: 'assets/images/plasterceilingservice.png',
      APIid: 13,
    ),

    Service(
      id: 5,
      name: 'HARDWARE',
      image: 'assets/images/hardwareservice.png',
      APIid: 13,
    ),

    Service(
      id: 6,
      name: 'AIR CONDITIONING',
      image: 'assets/images/airconditioningservice.png',
      APIid: 13,
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

                          Container (
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Constants.gold2,
                                  Colors.white,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('BUJISHU SERVICES', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                          ),

                          SizedBox(height: 20,),

                        ])),

                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, ),
                        delegate: SliverChildListDelegate(services.map((data){
                          return Container(
                            padding: const EdgeInsets.fromLTRB(0,0,0,10),
                            child: MaterialButton(
                              child: Image.asset(data.image),
                              onPressed: (){
                                var childRoute = new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new ProductCategoryHomeAPI(
                                    valueId: data.id,
                                    valueApi: data.APIid,
                                  ),
                                );

                                Navigator.of(context).push(childRoute);
                              },
                            ),
                          );
                        }).toList()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin:EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: Text('@2020 Bujishu. All Rights Reserved', style: TextStyle(color: Constants.black, fontSize: 12),),

                ),
              ),

            ],
          ),
        ),

      ),
    );
  }

}

