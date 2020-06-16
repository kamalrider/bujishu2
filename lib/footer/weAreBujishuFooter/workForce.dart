import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;

void main() => runApp(WorkForce());

class WorkForce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkForceHome(),
    );
  }
}

class WorkForceHome extends StatefulWidget {
  @override
  _WorkForceState createState() => _WorkForceState();
}

class _WorkForceState extends State<WorkForceHome> {
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
//            image: new DecorationImage(
//              image: new AssetImage("assets/images/bujishu_background.jpg"),
//              fit: BoxFit.cover,
//            ),
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
                              'We are looking for',
                              style: TextStyle(
                                  color: Constants.black, fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 16, 8),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Front-End Web Designer',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Roles & Responsibilities',
                                        style: TextStyle(
                                            color: Constants.gold2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Very strong in HTML, CSS, JavaScript, Media queries, Bootstrap, Object Oriented JavaScript, Responsive Web Design.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Able to create web templates/themes using pure HTML, CSS and JavaScript from scratch based on mock-up designs from Graphic Designer team',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Job Requirements',
                                        style: TextStyle(
                                            color: Constants.gold2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              '3 to 4 years of experience developing web front-end pages providing cutting-edge UI / UX experience to users.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Experience with Web 2.0 standards, HTML5, CSS3, JavaScript/JQuery.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Working knowledge on Laravel/PHP Web API and/or other HTTP Web Service frameworks.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Constants.gold2,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 16, 8),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Google Flutter Developer',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Roles & Responsibilities',
                                        style: TextStyle(
                                            color: Constants.gold2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                              flex: 9,
                                              child: Text(
                                                'Hands-on developing new projects (iOS and Android) from bottom-up using latest Google Flutter and Dart.',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                              flex: 9,
                                              child: Text(
                                                'Design and implement UI+UX based on the requirements.',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                              flex: 9,
                                              child: Text(
                                                'Develop design flows and experiences that are incredibly simple and elegant.',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                              flex: 9,
                                              child: Text(
                                                'Monitor the performance of the live apps and continuously improve them on both code and experience level.',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Job Requirements',
                                        style: TextStyle(
                                            color: Constants.gold2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                              flex: 9,
                                              child: Text(
                                                'Candidate must possess at least a Diploma, Advanced/Higher/Graduate Diploma, Computer Science/Information Technology or equivalent.',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                              flex: 9,
                                              child: Text(
                                                'Experience in Flutter mobile development (projects, personal projects, self R&D).',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                              flex: 9,
                                              child: Text(
                                                'Experience in Native or Hybrid mobile development.',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Constants.gold2,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 16, 8),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'UI/UX Designer',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Roles & Responsibilities',
                                        style: TextStyle(
                                            color: Constants.gold2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'To envision how people experience our platform and bring that vision to life in a way that feels inspired and refined.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Take on complex tasks and transform them into intuitive, accessible and easy-to-use solutions.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Job Requirements',
                                        style: TextStyle(
                                            color: Constants.gold2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Candidate must possess at least a Diploma, Advanced/Higher/Graduate Diploma, Computer Science/Information Technology or equivalent.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Experience in designing web/ mobile products.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '•',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              )),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              'Highly proficient with industry standard design tools such as Adobe XD, Sketch & InVision, wire framing and prototyping techniques.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Constants.gold2,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                                text: 'Please email your resume to ',
                                style: TextStyle(
                                    color: Constants.black, fontSize: 12),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'career@delhubdigital.com',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: ' if you are interested.')
                                ]),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

//                        Text('Please email your resume to career@delhubdigital.com if you are interested.'),
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
                    style: TextStyle(color: Constants.black, fontSize: 12),
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
