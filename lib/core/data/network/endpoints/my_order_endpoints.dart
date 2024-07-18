import 'package:flutter_templete/core/data/network/network_config.dart';

class MyOrderEndpoints {
  static String getOrder = NetworkConfig.getFullApiRoute4('profile/MyOrders');
  static String getOrderyId =
      NetworkConfig.getFullApiRoute4('profile/MyOrdersById');
  static String reOrder = NetworkConfig.getFullApiRoute4('order/reorder');
  static String submitOrder = NetworkConfig.getFullApiRoute4('order');
}
