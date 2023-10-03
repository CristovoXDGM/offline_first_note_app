import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheckService {
  final Connectivity _connectivity;

  ConnectivityCheckService(this._connectivity);

  void init() {
    _connectivity.onConnectivityChanged.listen((event) => _connectionChange);
  }

  void dispose() {}

  void _connectionChange(ConnectivityResult result) {}
}
