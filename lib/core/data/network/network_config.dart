import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';

//ملف الاعدادادتى لكامل ال api
class NetworkConfig {
  static String BASE_API = '';
  static String BASE_API2 = '/en/api/';
  static String BASE_API3 = '/en/api/address/';
  static String BASE_API4 = 'api/';
  static String BASE_API5 = '/en/api/products/';

  static String getFullApiRoute(String apiroute) {
    return BASE_API + apiroute;
  }

  static String getFullApiRoute2(String apiroute) {
    return BASE_API2 + apiroute;
  }

  static String getFullApiRoute3(String apiroute) {
    return BASE_API3 + apiroute;
  }

  static String getFullApiRoute4(String apiroute) {
    return BASE_API4 + apiroute;
  }

  static String getFullApiRoute5(String apiroute) {
    return BASE_API5 + apiroute;
  }

  static Map<String, String>? getHeaders(
      {bool needAuth = true,
      RequestType? type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth)
        "Authorization": "Bearer ${storage.getTokenInfo()?.token ?? ''}",
      // ${storage.getTokenInfo()?.token ?? ''
      // }",
      if (type != RequestType.GET)
        "Content-Type": type == RequestType.MULTIPART
            ? "multipart/form-data"
            : "application/json",
      ...extraHeaders ?? {}
    };
  }
}
