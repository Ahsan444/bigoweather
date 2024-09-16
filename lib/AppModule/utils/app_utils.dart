import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';

class AppUtils {
  static dynamic showLoading(context) {
    return const Center(child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(color: AppColors.bgcolor,strokeWidth: 2,)),);
  }

  showToast( String msg, {Color? color}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: color?? Colors.black45,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}