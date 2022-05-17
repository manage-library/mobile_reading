import '../configs/evn_config.dart';

class APIConst {
  static String _baseUrl = "";

  static String get baseUrl => _baseUrl;

  static void setBaseUrl(Enviroment env) {
    switch(env) {
      case Enviroment.LOCAL:
        _baseUrl = EnvConfig.baseUrlLocal;
        break;
      case Enviroment.PRODUCTION:
        _baseUrl = EnvConfig.baseUrlProduction;
        break;
      case Enviroment.REAL_DEVICE:
        _baseUrl = EnvConfig.baseUrlRealDevice;
        break;
      default:
        _baseUrl = EnvConfig.baseUrlLocal;
        break;
    }
  }
}
enum Enviroment {LOCAL, PRODUCTION, REAL_DEVICE}