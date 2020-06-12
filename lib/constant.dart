
library constants;

import 'package:Bujishu/home/customer_home/customer_home_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String SUCCESS_MESSAGE=" You will be contacted by us very soon.";

String web = 'https://demo3.bujishu.com/api/';

void generalToast(String toastTxt){
  Fluttertoast.showToast(
      msg: toastTxt,
      toastLength:
      Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1);
}

