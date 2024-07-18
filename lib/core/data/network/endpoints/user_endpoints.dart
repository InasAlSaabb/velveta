// import 'package:flutter_templete/core/data/network/network_config.dart';

import 'package:flutter_templete/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiRoute4('login');
  static String register = NetworkConfig.getFullApiRoute4('register');
  static String send_otp = NetworkConfig.getFullApiRoute4('send-otp');
  static String verfiy = NetworkConfig.getFullApiRoute4('verify-otp');
  static String reset = NetworkConfig.getFullApiRoute4('reset-password');
}
