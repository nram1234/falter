import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class OnlineNetWorkController extends GetxController {
  var connectionStatus = false;
  final Connectivity _connectivity = Connectivity();
 // StreamSubscription<ConnectivityResult>? _connectivitysubscription;

  @override
  void onInit() {
    super.onInit();

    initConnctivity();
 //   _connectivitysubscription =
        _connectivity.onConnectivityChanged.listen((_updateConnectionStatus));
  }

  Future<void> initConnctivity() async {
    ConnectivityResult result;
    try {
      _connectivity.checkConnectivity().then((value) {
        _updateConnectionStatus(value);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _updateConnectionStatus(ConnectivityResult value) {
    switch (value) {
      case ConnectivityResult.wifi:
        connectionStatus = true;
        break;
      case ConnectivityResult.mobile:
        connectionStatus = true;
        break;
      case ConnectivityResult.none:
        connectionStatus = false;
        break;
    }
 update(); }
}
