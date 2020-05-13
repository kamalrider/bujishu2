import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;

Future<User> postLogin({Map body})async{
  return http.post(Constants.web + 'auth/login',body: body).then((http.Response response){
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return User.fromJson(json.decode(response.body));

  });
}

class User{
  String email;
  String password;

  User({this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      email: json['email'],
      password: json['password'],
    );
  }
}

class Token{
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json){
    return Token(
      token: json['token']
    );
  }
}

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

//  Future navigateToHomePage(context) async {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp()));
//  }

  final loginButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(15.0),
    color: Color(0xfffbcc34),
    child: MaterialButton(
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {},
      child: Text(
        "Login",
        textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
      ),
    ),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
//    final emailField = TextField(
//      obscureText: false,
//      style: style,
//      decoration: InputDecoration(
//          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//          hintText: "Emailt",
//          border:
//              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//    );
//    final passwordField = TextField(
//      obscureText: true,
//      style: style,
//      decoration: InputDecoration(
//          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//          hintText: "Password",
//          border:
//              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//    );

    return Form(
        key: _formKey,
        child: Scaffold(
          body: Center(
            child: Container(
              width: double.infinity,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/bujishu_main_page.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                      child: TextFormField(

                        style: TextStyle(color: Colors.black),
//                    controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2.0),
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: Colors.yellow, width: 2.0),
                          ),
                          fillColor: Colors.white60,
                          filled: true,
                          prefixStyle: new TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 2.0)),
                         labelText: 'email address',
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
                      child: TextFormField(
//                    controller: nameController,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: Colors.yellow, width: 2.0),
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: Colors.yellow, width: 2.0),
                          ),
                          fillColor: Colors.white60,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 2.0)),
                          labelText: 'password',
                        ),
                      ),
                    ),
                    Container(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                      child: Container(
//                        elevation: 5.0,
//                        borderRadius: BorderRadius.circular(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange,
                                Color(0xfffbcc34),
                                Colors.yellowAccent,

                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )),
//                        color: Color(0xfffbcc34),

                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
//                              navigateToHomePage(context);
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ))
//                Container(
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
