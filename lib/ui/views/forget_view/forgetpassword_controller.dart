import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/varification_view/verification_view.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends BaseController {
  TextEditingController email = TextEditingController();

  void sendOtp() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .sendotp(
            email: email.text,
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
                Get.to(VerfificationView(
                  email: email.text,
                ));
              },
            ),
          ),
    );
  }
}
