import 'package:flutter_templete/core/data/network/network_config.dart';

class CartEndpoints {
  static String addTocart = NetworkConfig.getFullApiRoute4('basket');
  static String getcart = NetworkConfig.getFullApiRoute4('basket');
  static String editcart = NetworkConfig.getFullApiRoute4('basket');
  static String addAll = NetworkConfig.getFullApiRoute4('basketAddAll');
  static String deleteFromCart = NetworkConfig.getFullApiRoute4('basket');
}
