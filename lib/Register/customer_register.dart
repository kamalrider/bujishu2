//import 'package:flutter/widgets.dart';
import 'package:bujishu2/home/customer_home/customer_home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bujishu2/constant.dart' as Constants;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

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

  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final TextEditingController fullNameController = new TextEditingController();
  final TextEditingController ICController = new TextEditingController();
  final TextEditingController address1Controller = new TextEditingController();
  final TextEditingController address2Controller = new TextEditingController();
  final TextEditingController address3Controller = new TextEditingController();
  final TextEditingController postcodeController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController stateController = new TextEditingController();
  final TextEditingController homeContactController =
      new TextEditingController();
  final TextEditingController mobileContactController =
      new TextEditingController();

  String email;
  String password;
  String confirmPassword;
  String fullName;
  String ICNo;
  String address1;
  String address2;
  String address3;
  String postcode;
  String city;
  String state;
  String homeContact;
  String mobileContact;

  bool _isLoading = false;

  signUp(
      String email,
      String password,
      String fullname,
      String ICNo,
      String address1,
      String address2,
      String address3,
      String postcode,
      String city,
      String state,
      String contactHome,
      String contactMobile,
      String existingCust) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
      'fullName': fullname,
      'nric': ICNo,
      'address1': address1,
      'address2': address2,
      'address3': address3,
      'postcode': postcode,
      'city': city,
      'state': state,
      'contactMobile': contactMobile,
      'contactHome': contactHome,
      'existingCustomer': existingCust,
    };

    var jsonResponse = null;
    var response = await http.post(web + "auth/customer/register", body: data);
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
      Constants.generalToast('email has been used');
    }
  }

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

  int selectedRadio;
  bool invisible = true;
  bool status = false;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void _informationPart() {
    setState(() {
      if (emailController.text.isEmpty) {
        Constants.generalToast('email cannot be empty');
      } else if (passwordController.text.isEmpty) {
        Constants.generalToast('password cannot be empty');
      } else if (confirmPasswordController.text.isEmpty) {
        Constants.generalToast('re-enter password cannot be empty');
      } else if (passwordController.text.length < 8)
        Constants.generalToast('The password must be at least 8 characters.');
      else if (passwordController.text != confirmPasswordController.text) {
        Constants.generalToast('both password field must be same');
      } else if (!emailController.text.contains('@'))
        Constants.generalToast('The email must be a valid email address');
      else
        numberSelected = RegisterMarker.second;
    });
  }

  void clickSignUp() {
    setState(() {
      if (fullNameController.text.isEmpty)
        Constants.generalToast('Fullname cannot be empty');
      else if (ICController.text.isEmpty)
        Constants.generalToast('IC must be filled');
      else if (ICController.text.length != 12)
        Constants.generalToast('The nric must be at least 12 characters.');
      else if (address1Controller.text.isEmpty)
        Constants.generalToast('Address Line 1 cannot ne empty');
      else if (address2Controller.text.isEmpty)
        Constants.generalToast('Address Line 2 cannot be empty');
      else if (address3Controller.text.isEmpty)
        Constants.generalToast('Address Line 3 cannot be empty');
      else if (postcodeController.text.isEmpty)
        Constants.generalToast('Postcode cannot be empty');
      else if (postcodeController.text.length != 5)
        Constants.generalToast('Postcode only 5 characters');
      else if (cityController.text.isEmpty)
        Constants.generalToast('City cannot be empty');
      else if (stateController.text.isEmpty)
        Constants.generalToast('State cannot be empty');
      else if (mobileContactController.text.isEmpty)
        Constants.generalToast('Mobile cannot be empty');
      else if (mobileContactController.text.length < 10)
        Constants.generalToast(
            'The mobile contact must be at least 10 characters.');
      else if (selectedRadio.toString().isEmpty)
        Constants.generalToast(
            'Please choose you are existing customer or not');
      else

        signUp(
            emailController.text,
            passwordController.text,
            fullNameController.text,
            ICController.text,
            address1Controller.text,
            address2Controller.text,
            address3Controller.text,
            postcodeController.text,
            cityController.text,
            "4",
            mobileContactController.text,
            homeContactController.text,
            selectedRadio.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = '';
    password = '';
    confirmPassword = '';
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      email = emailController.text;
      password = passwordController.text;
      confirmPassword = confirmPasswordController.text;
      fullName = fullNameController.text;
      ICNo = ICController.text;
      address1 = address1Controller.text;
      address2 = address2Controller.text;
      address3 = address3Controller.text;
      postcode = postcodeController.text;
      city = cityController.text;
      state = stateController.text;
      homeContact = homeContactController.text;
      mobileContact = mobileContactController.text;
    });

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
                            keyboardType: TextInputType.emailAddress,
                            maxLines: null,
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
                            keyboardType: TextInputType.text,
                            obscureText: invisible,
                            maxLines: 1,
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
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            controller: confirmPasswordController,
                            cursorColor: Colors.black,
                            obscureText: invisible,
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
                          onPressed: () {
                            _informationPart();
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
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
                            keyboardType: TextInputType.number,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
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
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
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
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                    Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                          disabledColor: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                                title: Text('Yes' , style: TextStyle(color: Colors.white,),),
                                onTap: () => setState(() => selectedRadio = 0),
                                leading: Radio(
                                  value: 0,
                                  groupValue: selectedRadio,
                                  onChanged: (v) => setState(() => selectedRadio = v),
                                  activeColor: Colors.white,
                                )
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                                title: Text('No' , style: TextStyle(color: Colors.white, ),),
                                onTap: () => setState(() => selectedRadio = 0),
                                leading: Radio(
                                  value: 1,
                                  groupValue: selectedRadio,
                                  onChanged: (v) => setState(() => selectedRadio = v),
                                  activeColor: Colors.white,
                                )
                            ),
                          ),

                        ],
                      ),
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
                          onPressed: () {
                  clickSignUp();

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
          resizeToAvoidBottomInset: false,
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
                                        child: Text(
                                          "Registration",
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            numberSelected =
                                                RegisterMarker.first;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.02,
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
                                        child: Text(
                                          "Information",
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center,
//          style: style.copyWith(
//              color: Colors.black87, fontWeight: FontWeight.bold)
                                        ),
                                        onPressed: () {
                                          _informationPart();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
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
