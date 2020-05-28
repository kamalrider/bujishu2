import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;
import 'package:shared_preferences/shared_preferences.dart';

import 'Register/customer_register.dart';
import 'home/customer_home/customer_home_view.dart';

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
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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

  bool _isLoading = false;

  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonResponse = null;
    var response =
        await http.post("https://demo3.bujishu.com/api/auth/login", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => CustomerHome1()),
            (Route<dynamic> route) => false);
      }
    } else {
      jsonResponse = json.decode(response.body);

      setState(() {
        _isLoading = false;
      });
      print(response.body);
      Fluttertoast.showToast(
          msg: 'unauthorized',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              width: double.infinity,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/bujishu_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Image.asset(
                                    "assets/images/bujishu_logo.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset(
                                              'assets/images/grey_profile_icon.png',
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: TextFormField(
                                              controller: emailController,
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                                  hintText: 'Email'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            child: Image.asset(
                                              'assets/images/grey_lock_icon.png',
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: TextFormField(
                                              controller: passwordController,
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                                  hintText: 'Password'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
//                    Container(
//                      padding: EdgeInsets.all(10),
//                      margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
//                      child: TextFormField(
//                        style: TextStyle(color: Colors.black),
////                    controller: nameController,
//                        validator: (value) {
//                          if (value.isEmpty) {
//                            return 'Please Enter your email';
//                          }
//                          return null;
//                        },
//                        decoration: InputDecoration(
//                          errorStyle: TextStyle(color: Colors.white),
//                          errorBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20),
//                            borderSide:
//                                BorderSide(color: Colors.yellow, width: 2.0),
//                          ),
//                          focusedErrorBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20),
//                            borderSide:
//                                BorderSide(color: Colors.yellow, width: 2.0),
//                          ),
//                          fillColor: Colors.white60,
//                          filled: true,
//                          prefixStyle: new TextStyle(color: Colors.white),
//                          focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20),
//                            borderSide:
//                                BorderSide(color: Colors.yellow, width: 2.0),
//                          ),
//                          enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20),
//                              borderSide:
//                                  BorderSide(color: Colors.yellow, width: 2.0)),
//                          labelText: 'email address',
//                        ),
//                      ),
//                    ),
//
//                    Container(
//                      padding: EdgeInsets.all(10),
//                      margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
//                      child: TextFormField(
////                    controller: nameController,
//                        style: TextStyle(color: Colors.black),
//                        obscureText: true,
//                        validator: (value) {
//                          if (value.isEmpty) {
//                            return 'Please enter your password';
//                          }
//                          return null;
//                        },
//                        decoration: InputDecoration(
//                          errorStyle: TextStyle(color: Colors.white),
//                          errorBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20),
//                            borderSide:
//                                BorderSide(color: Colors.yellow, width: 2.0),
//                          ),
//                          focusedErrorBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20),
//                            borderSide:
//                                BorderSide(color: Colors.yellow, width: 2.0),
//                          ),
//                          fillColor: Colors.white60,
//                          filled: true,
//                          focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20),
//                            borderSide:
//                                BorderSide(color: Colors.yellow, width: 2.0),
//                          ),
//                          enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20),
//                              borderSide:
//                                  BorderSide(color: Colors.yellow, width: 2.0)),
//                          labelText: 'password',
//                        ),
//                      ),
//                    ),

                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Container(
//                        elevation: 5.0,
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
//                        color: Color(0xfffbcc34),

                                    child: MaterialButton(
//                                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      onPressed: emailController.text == "" ||
                                              passwordController.text == ""
                                          ? null
                                          : () {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              signIn(emailController.text,
                                                  passwordController.text);
                                            },
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(color: Colors.black),
                                        textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                          child: Text(
                                        'Forget Password?',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      InkWell(
                                          child: Text(
                                            'New here? Sign up',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterCustomerHome()));
                                          }),
                                    ],
                                  ),
                                ),

//                Container(
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 0,
                            child: Center(
                                child: Column(
                              children: <Widget>[
                                Text(
                                  '©2020 Bujishu. All Rights Reserved.',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            )))
                      ],
                    ),
            ),
          ),
        ));
  }
}
