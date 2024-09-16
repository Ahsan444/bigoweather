
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/AppModule/api/model/weather_model.dart';
import 'package:weather_app/AppModule/utils/app_text.dart';
import 'package:weather_app/AppModule/utils/app_utils.dart';

class HomeProvider  extends ChangeNotifier {
  String latLong = '';
  WeatherModel weatherModel = WeatherModel();
  Dio dio = Dio();


  Future<String> getCurrentLatLng() async {

    try {
      Position? position;
      if (latLong.isEmpty) {
        position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      } else {
        position = await Geolocator.getLastKnownPosition();
        position ??= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      }
      double lat = position.latitude;
      double long = position.longitude;
      latLong  = '$lat,$long';
      debugPrint('current cords:----> \n$latLong');
      return latLong;
    } catch (e) {
      debugPrint('Error getting location: $e');
      return 'Error getting location';
    }
  }

  Future<void> getWeatherData(String location,BuildContext ctx) async {
    String url = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$location?unitGroup=metric&include=hours%2Cdays%2Ccurrent&key=6Q3TDVDTV52LCDNZRKPP5QV4M&contentType=json';
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        weatherModel = WeatherModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (e,stackTrace) {
      // add socket exception
      if(e is DioException){
        if(e.error is SocketException){
          if(ctx.mounted){
            ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
              content: AppText(text: 'Please check your internet connection',),
              behavior: SnackBarBehavior.floating,
            ));
          }
        }
      }
      AppUtils().showToast('Error getting weather data\nPlease try again');
      debugPrint('Error getting weather data: $e \n $stackTrace');
    }
  }
  String getCurrentDayDateMonth() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM').format(now);
    return formattedDate;
  }

}