import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/varification_view/verification_view.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  TextEditingController email = TextEditingController();
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

  void register() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .register(
              first_name: firstname.text,
              last_name: secondname.text,
              email: email.text,
              password: password.text)
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
                Get.off(() => VerfificationView(
                      email: email.text,
                    ));
              },
            ),
          ),
    );
  }
}
