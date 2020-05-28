//import 'package:flutter/widgets.dart';
import 'package:bujishu2/home/customer_home/customer_home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;
import 'package:shared_preferences/shared_preferences.dart';

enum RegisterMarker { first, second }

void main() => runApp(RegisterCustomer());

class RegisterCustomer extends StatelessWidget {
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
      home: RegisterCustomerHome(title: 'Flutter Login'),
    );
  }
}

class RegisterCustomerHome extends StatefulWidget {
  RegisterCustomerHome({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _RegisterCustomerState createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomerHome> {
  RegisterMarker numberSelected = RegisterMarker.first;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  bool rememberMe = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController confirmPasswordController = new TextEditingController();
  final TextEditingController fullNameController = new TextEditingController();
  final TextEditingController ICController = new TextEditingController();
  final TextEditingController address1Controller = new TextEditingController();
  final TextEditingController address2Controller = new TextEditingController();
  final TextEditingController address3Controller = new TextEditingController();
  final TextEditingController postcodeController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController stateController = new TextEditingController();
  final TextEditingController homeContactController = new TextEditingController();
  final TextEditingController mobileContactController = new TextEditingController();

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

//  final loginButton = Material(
//    elevation: 5.0,
//    borderRadius: BorderRadius.circular(15.0),
//    color: Color(0xfffbcc34),
//    child: MaterialButton(
//      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//      onPressed: () {},
//      child: Text(
//        "Login",
//        textAlign: TextAlign.center,
////          style: style.copyWith(
////              color: Colors.black87, fontWeight: FontWeight.bold)
//      ),
//    ),
//  );
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  int selectedRadio;


  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget firstRegister() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    //email
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: emailController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'Email'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //create password
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: passwordController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'Create your password'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //confirm password
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'Re-enter your password'),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.08,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Container(
//                        elevation: 5.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
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
                          child: Text(
                            "NEXT",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                          ),
                          onPressed: (){
                            setState(() {
                              numberSelected = RegisterMarker.second;
                            });

                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

//                Container(
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget secondRegister() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 900,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    //fullname
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: fullNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'Full Name (as per NRIC)'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //ic number
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: ICController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'NRIC Number'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //Adress Line 1
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: address1Controller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'Address Line 1'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //Address Line 2
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: address2Controller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'Address Line 2'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //Address Line 3
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: address3Controller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'Address Line 3'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //poscodecity
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Row(
                        children: <Widget>[
                          //postcode
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white70),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: TextFormField(
                                    controller: postcodeController,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                        hintText: 'Postcode'),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.015,
                          ),

                          //city
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white70),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: TextFormField(
                                    controller: cityController,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                        hintText: 'City'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //State
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white70),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: stateController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                hintText: 'State'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //contact number
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Row(
                        children: <Widget>[
                          //Home
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white70),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: TextFormField(
                                    controller: homeContactController,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                        hintText: 'Tel (Home)'),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.015,
                          ),

                          //Mobile
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white70),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: TextFormField(
                                    controller: mobileContactController,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
                                        hintText: 'Mobile'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //text
                    Text(
                      'Are you an existing Destiny Code customer?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
//                      height: MediaQuery.of(context).size.height * 0.015,
//                      height: MediaQuery.of(context).size.height * 0.001,
                        ),

                    //radiobutton
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //yes
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Colors.white,
                              onChanged: (val) {
                                setSelectedRadio(val);
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),

                        //no
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: Colors.white,
                              onChanged: (val) {
                                setSelectedRadio(val);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    //Button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Container(
//                        elevation: 5.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
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
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerHome1()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

//                Container(
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget getRegisterContainer() {
      switch (numberSelected) {
        case RegisterMarker.first:
          return firstRegister();
        case RegisterMarker.second:
          return secondRegister();
      }
      return firstRegister();
    }

    return Form(
        key: _formKey,
        child: Scaffold(
          body: Center(
            child: Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image:
                        new AssetImage("assets/images/bujishu_background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: <Widget>[
                          //space
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),

                          //logo
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset(
                              "assets/images/bujishu_logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),

                          //space
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                    child: Container(
//                        elevation: 5.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
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
                                        child: Text(
                                          "Registration",
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                                        ),
                                        onPressed: (){
                                          setState(() {
                                            numberSelected = RegisterMarker.first;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.height * 0.02,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                    child: Container(
//                        elevation: 5.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
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
                                        child: Text(
                                          "Information",
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                                        ),
                                        onPressed: (){
                                          setState(() {
                                            numberSelected = RegisterMarker.second;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),



                          Container(
                            height: MediaQuery.of(context).size.height * 0.49,
                            child: CustomScrollView(
                              slivers: <Widget>[
                                SliverList(
                                  delegate: SliverChildListDelegate(
                                      [getRegisterContainer()]),
                                )
                              ],
                            ),
                          ),

                          //footer
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
                      )),
          ),
        ));
  }
}
