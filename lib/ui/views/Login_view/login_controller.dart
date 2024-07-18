import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/data/reposotories/shared_prefernces.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/add_address_view/add_address_view.dart';
import 'package:flutter_templete/ui/views/change_location/change_location_controller.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible2 = false.obs;
  RxBool ischecked = false.obs;
  void hidePassword2({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }

  @override
  void onInit() {
    getDeviceId();
    if (SharedPrefrenceRepostory().getLoggininfo().isNotEmpty) {
      ischecked.value = true;
      emailController.text = SharedPrefrenceRepostory().getLoggininfo()[0];
      passwordController.text = SharedPrefrenceRepostory().getLoggininfo()[1];
    }
    super.onInit();
  }

  Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor!;
    } else {
      throw UnsupportedError('Device type not supported');
    }
  }
  // void getDeviceId() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   RxString deviceId = ''.obs;
  //   RxBool checked = false.obs;
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     deviceId.value = androidInfo.androidId;
  //   } else if (Platform.isIOS) {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     deviceId.value = iosInfo.identifierForVendor!;
  //   }
  //   void rememeberMe() {
  //     if (storage.getLogeedIn() != Null && deviceId != Null) {
  //       username.text = storage.getLogeedIn()[0];
  //       password.text = storage.getLogeedIn()[1];
  //     }
  //   }
  // }

  void login() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .Login(
            email: emailController.text,
            password: passwordController.text,
          )
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: l,
                );
              },
              (r) {
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: "Succed",
                );
                storage.setName(emailController.text);
                // storage.setTokenInfo(r);
                storage.setLgginInfO(
                    [emailController.text, passwordController.text]);
                Get.to(MainView());
              },
            ),
          ),
    );
  }
}
