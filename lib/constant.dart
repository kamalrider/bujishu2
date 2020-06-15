
library constants;

import 'dart:ui';

import 'package:Bujishu/home/customer_home/customer_home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String SUCCESS_MESSAGE=" You will be contacted by us very soon.";

String web = 'https://demo3.bujishu.com/api/';

Color gold = Color(0xffD4AF37);
Color black =  Colors.black;

void generalToast(String toastTxt){
  Fluttertoast.showToast(
      msg: toastTxt,
      toastLength:
      Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1);
}

