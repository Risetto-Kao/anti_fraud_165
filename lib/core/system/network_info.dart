import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoInterface {
  Future<bool> get isConnected;
}

class NetworkInfo implements NetworkInfoInterface {
  final Connectivity connectivity;

  NetworkInfo({required this.connectivity});

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected async {
    var connectivityResult = await connectivity.checkConnectivity();
    switch (connectivityResult) {
      // valid connectivity
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
      case ConnectivityResult.ethernet:
        return true;
      // invalid connectivity
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.none:
        return false;
    }
  }
}
