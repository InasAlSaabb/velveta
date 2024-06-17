import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_view.dart';
import 'package:flutter_templete/ui/views/resetpassword_view/resetpassword_view.dart';
import 'package:get/get.dart';

class VerficationController extends BaseController {
  String? email;
  VerficationController({
    required this.email,
  });

  TextEditingController controller = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  OnChangedCode(String value) {
    if (value == controllerCode.text) {
      print("Verification successful");
    } else {
      print("Verification failed");
    }

    print(value);
  }

  void verfiy() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .verfiy(
            otp: controllerCode.text,
            email: email!,
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
                  message: "succed",
                );

                Get.to(ResetPasswordView(
                  email: email!,
                ));
              },
            ),
          ),
    );
  }

  void sendOtp() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .sendotp(
            email: email!,
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
                  message: "succed",
                );
              },
            ),
          ),
    );
  }
}
