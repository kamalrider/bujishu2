import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;

void main() => runApp(AboutUs());

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutUsHome(),
    );
  }
}

class AboutUsHome extends StatefulWidget {



  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUsHome> {
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
              image: new AssetImage("assets/images/aboutusbg.jpg"),
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
                          margin : EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text('ABOUT US', style: TextStyle(color: Constants.gold, fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('The establishment of BUJISHU in 2020 was inspired by a group of experts who committed to '
                              'providing quality home living style, enabling customers to access professional, accurate, time-saving, '
                              'and value-for-money products and services while improving the conditions of their home or office environment.',
                          style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('The founding members of BUJISHU have 11 years of comprehensive experience in raising the '
                              'standards of home living. Using practical and effective architecture knowledge, and with a team of '
                              'well-trained consultant, had since accumulated tens of thousands of home design experiences. The '
                              'ingenious setting which incorporates both artistic, innovative & flourishing designs has received '
                              'a lot of customer appreciation and testimonials. Customers who fully commit to the best layout will'
                              ' enjoy lasting benefits.',
                            style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('However, in the course of achieving the right living design, customers still find it '
                              'difficult to obtain the right items even after investing countless resources, making needless '
                              'errors and delaying the crucial time to improve the living environment and missing the benefits of '
                              'early perfection.',
                            style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('We are making your VOICE heard! We know Customers wanted to do it RIGHT at the First time. '
                              'In Moving towards future cyber world, we first launched an innovative e-commerce hub, riding on '
                              'the conveniences of networking technology to showcase the best products or services that meet the '
                              'artistic and thriving living designs, so that consumers can easily satisfy their home or office '
                              'design needs and thereby reap the benefits of a good environment that lead towards a happy, '
                              'healthy, productive and affluent life.',
                            style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                      ]),
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
              )

            ],
          ),
        ),
      ),
    );
  }

}

