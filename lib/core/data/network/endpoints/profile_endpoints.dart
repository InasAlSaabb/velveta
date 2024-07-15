import 'package:flutter_templete/core/data/network/network_config.dart';

class ProfileEndpoints {
  static String getinfoP = NetworkConfig.getFullApiRoute4('profile/getProfile');
  static String deletAccount = NetworkConfig.getFullApiRoute4('profile/delete');
  static String editProfile = NetworkConfig.getFullApiRoute4('profile/edit');
}
