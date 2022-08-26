import 'package:effectivem_test/feature/core/platform/network.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionImpl extends NetworkConnection {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkConnectionImpl(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
