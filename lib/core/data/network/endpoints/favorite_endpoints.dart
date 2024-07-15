import 'package:flutter_templete/core/data/network/network_config.dart';

class FavoriteEndpoints {
  static String getfavorites = NetworkConfig.getFullApiRoute4('favorites');
  static String addfavorite = NetworkConfig.getFullApiRoute4('favorites/add');
  static String deletfavorite =
      NetworkConfig.getFullApiRoute4('favorites/remove');
}
