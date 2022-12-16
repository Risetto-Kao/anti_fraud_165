class Config {
  static final Config _instance = Config._();
  DevMode _mode = DevMode.Debug;
  Config._();

  static Config get instance => _instance;

  DevMode get mode => _mode;
  void setMode(DevMode m) {
    _mode = m;
  }
}

enum DevMode { Debug, Release, SimulateNetworkDisconneted }
