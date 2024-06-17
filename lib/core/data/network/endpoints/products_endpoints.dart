import 'package:flutter_templete/core/data/network/network_config.dart';

class ProductsEndpoints {
  static String getproductsbycategory =
      NetworkConfig.getFullApiRoute5('getById');
  static String getAll = NetworkConfig.getFullApiRoute2('categories');
}
