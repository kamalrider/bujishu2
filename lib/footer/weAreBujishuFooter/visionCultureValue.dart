import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;

void main() => runApp(VisionCultureValue());

class VisionCultureValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VisionCultureValueHome(),
    );
  }
}

class VisionCultureValueHome extends StatefulWidget {
  @override
  _VisionCultureValueState createState() => _VisionCultureValueState();
}

class _VisionCultureValueState extends State<VisionCultureValueHome> {
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
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/ourvisionbg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text(
                              'Our Vision, Culture, Value',
                              style: TextStyle(
                                  color: Constants.gold, fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('WHO WE ARE', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text(
                              'We aspire to create a DREAM HOME for all. We strive to do our part to '
                                  'make life better. We provide high-quality merchandise, great value, '
                                  'and exceptional customer service',
                            style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text(
                              'At Bujishu, our mission is to build Quality & Sustainable HOME LIVING STYLE :',
                            style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('Setting high standards on home living design',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                flex:9,
                                child: Text('Optimized quality of home living products',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('Create Prosperous Family Business',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,child: Text('Promote Happy Family relationship',
                                style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('HOW WE WORK', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text(
                              'As a Company, we strive to lead by our guiding principles and cultures:',
                            style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(   flex:9,child: Text('Commits to our craft',
                                style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(   flex:9,child: Text('Pursue Growth & Learning',
                                style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(   flex:9,child: Text('Drive Change & Technology Innovation',
                                style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(   flex:9,child: Text('Build Positive Team & Family Spirit',
                                style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(   flex:9,child: Text('Warmth Relationship with Community',
                                style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(   flex:9,child: Text('Promote Literature & Arts',
                                style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('WHAT WE VALUE', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                flex:9,
                                child: Text(
                                    'Providing customers with an easy, enjoyable and secure online experience to complete their home living design in shortest time possible',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,5,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                flex:9,
                                child: Text(
                                    'Highest standards of home living products to enhance the quality of home lifestyles',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,5,15,15),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                flex:9,
                                child: Text(
                                    'Provide value-added high quality merchandise to our customers.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                      ]),
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
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
