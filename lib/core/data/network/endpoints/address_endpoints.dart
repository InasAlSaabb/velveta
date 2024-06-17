import 'package:flutter_templete/core/data/network/network_config.dart';

class AddressEndpoints {
  static String addAddress = NetworkConfig.getFullApiRoute3('add');
  static String getAllAdress = NetworkConfig.getFullApiRoute3('get_all');
  static String deleteAddress = NetworkConfig.getFullApiRoute3('delete');
}
