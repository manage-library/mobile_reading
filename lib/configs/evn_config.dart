class ComputerIP {
  //use real device ro connect with local database.
  ///conditions: real device and your computer is the same network and real device is connected
  ///with your computer by charging cable
  ///Find your computerIP on Windown:
  ///windown + R => type "cmd" => Enter => type "ipconfig" => Find ipv4 address in "Wireless LAN adapter wifi"
  static const String computerIP = '192.168.43.132'; // ip address computer when mobile phone share network
}

class EnvConfig {
  static const String baseUrlLocal = "http://52.40.241.203:3000/api";
  static const String baseUrlProduction = "";
  static const String baseUrlRealDevice =
      "http://" + ComputerIP.computerIP + ":3000/api";
}
