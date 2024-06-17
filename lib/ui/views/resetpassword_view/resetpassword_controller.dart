import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class ResetPasswordController extends BaseController {
  String? email;
  ResetPasswordController({
    required this.email,
  });
  TextEditingController password = TextEditingController();

  TextEditingController confirmpassword = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool passwordVisible2 = false.obs;

  void hidePassword({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }

  void hidePassword2({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }

  void reset() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .resetPassword(
              email: email!,
              otp: storage.getToken().toString(),
              password: password.text,
              password_confirmation: confirmpassword.text)
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
                // Get.to(MainView());
                sendFeedBack(widget: Text('Password changes successfully'));
              },
            ),
          ),
    );
  }
}
