import 'package:flutter_templete/core/data/network/network_config.dart';

class ProductsEndpoints {
  static String getproductsbycategory =
      NetworkConfig.getFullApiRoute5('getById');
  static String getproductsbyId = NetworkConfig.getFullApiRoute5('getById');
  static String getAll = NetworkConfig.getFullApiRoute2('categories');
  static String getSlider = NetworkConfig.getFullApiRoute4('sliders');
  static String getPRoduct = NetworkConfig.getFullApiRoute('products/getById');
  static String getColor = NetworkConfig.getFullApiRoute4('products/getColors');
  // static String getAll = NetworkConfig.getFullApiRoute2('');
}
