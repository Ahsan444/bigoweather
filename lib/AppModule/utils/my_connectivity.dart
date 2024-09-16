
import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyConnectivity {
  final _connectivity = Connectivity();

  bool isOnline = false;

  Future<List<ConnectivityResult>> getConnectivity() async {
    return await _connectivity.checkConnectivity();
  }

  Future<String> getConnectivityType() async {
    final List<ConnectivityResult> result = await getConnectivity();
    debugPrint('Connectivity');
    if (result.contains(ConnectivityResult.mobile)) {
      return 'Mobile';
    } else if (result.contains(ConnectivityResult.wifi)) {
      return 'Wifi';
    } else if (result.contains(ConnectivityResult.ethernet)) {
      return 'Ethernet';
    } else if (result.contains(ConnectivityResult.vpn)) {
      return 'VPN';
    } else if (result.contains(ConnectivityResult.bluetooth)) {
      return 'Bluetooth';
    } else if (result.contains(ConnectivityResult.other)) {
      return 'Other';
    } else if (result.contains(ConnectivityResult.none)) {
      return 'None';
    } else {
      return 'Offline';
    }
  }

  Future<bool> checkStatus() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      debugPrint('online');
    } on SocketException catch (_) {
      isOnline = false;
      debugPrint('offline');
    }
    return isOnline;
  }
}