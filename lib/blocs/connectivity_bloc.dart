import 'dart:async';
import 'package:association_raed/enums/connectivity_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityStateBloc with ChangeNotifier {
  ConnectivityState _connectivityState;
  ConnectivityState get getConnectivityState => _connectivityState;
  set setConnectivityState(ConnectivityState _state) {
    _connectivityState = _state;
    notifyListeners();
  }

  // Create our public controller
  StreamController<ConnectivityState> connectionStatusController =
      StreamController<ConnectivityState>();

  ConnectivityStateBloc() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }
  _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        setConnectivityState = ConnectivityState.online;
        break;

      case ConnectivityResult.wifi:
        setConnectivityState = ConnectivityState.online;
        break;
      case ConnectivityResult.none:
        setConnectivityState = ConnectivityState.offline;
        break;
      default:
        setConnectivityState = ConnectivityState.offline;
        break;
    }
  }
}
