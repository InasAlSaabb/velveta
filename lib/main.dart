import 'package:flutter/material.dart';
import 'package:flutter_templete/app/my_app.dart';
import 'package:flutter_templete/app/my_app_controller.dart';
import 'package:flutter_templete/core/data/reposotories/shared_prefernces.dart';
import 'package:flutter_templete/core/services/cart_service.dart';
import 'package:flutter_templete/core/services/cart_services.dart';
import 'package:flutter_templete/core/services/connectivity_service.dart';
import 'package:flutter_templete/core/services/location_service.dart';
import 'package:flutter_templete/core/services/pay_key.dart';
import 'package:get/get.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MFSDK.init("Add Your API Key", MFCountry.KUWAIT, MFEnvironment.TEST);
  //MFSDK.init(ApiKeys.apiKey, MFCountry.KUWAIT, MFEnvironment.TEST);

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Get.put(SharedPrefrenceRepostory());
  Get.put(CartService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());
  Get.put(LocationService());
  runApp(MyApp());
}

extension emptypadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        height: toDouble(),
      );
}

extension ExtendedNavigator on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushReplace(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  void pop(Widget page, [result]) async {
    return Navigator.of(this).pop(result);
  }
}
