abstract class CheckNetworkConnectionService {
  Future<void> init();

  Future<bool> checkInternetConnection();

  Future<void> dispose();
}
