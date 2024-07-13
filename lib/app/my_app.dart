import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/connectivity_status.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/views/pay.dart';
import 'package:flutter_templete/ui/views/resetpassword_view/resetpassword_view.dart';
import 'package:flutter_templete/ui/views/splash_screen/spalsh_screen_view.dart';
import 'package:flutter_templete/ui/views/varification_view/verification_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';

import '../ui/views/about_us_view/about_us_view.dart';
import '../ui/views/add_address_view/add_address_view.dart';
import '../ui/views/change_location/change_location.dart';
import '../ui/views/checkout_view/checkout_view.dart';
import '../ui/views/contact_us_view/contact_us_view.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //stream provider +type
    return StreamProvider<ConnectivityStatus>(
        //start value onilne
        initialData: ConnectivityStatus.ONLINE,
        //create stream
        create: (context) =>
            //object
            //prodcust app
            //for any thing stream
            connectivityService.connectivityStatusController.stream,
        child: GetMaterialApp(
            defaultTransition: Transition.circularReveal,
            transitionDuration: Duration(milliseconds: 12),
            title: 'Flutter Demo',
            builder: BotToastInit(),
            locale: getlocal(),
            fallbackLocale: getlocal(),
            translations: AppTranslation(), //1. call BotToastInit
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashSceenView()));
  }
}

Locale getlocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else if (storage.getAppLanguage() == 'tr') {
    return Locale('tr', 'TR');
  } else {
    return Locale('en', 'US');
  }
}
