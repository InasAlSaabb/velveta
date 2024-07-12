import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/contact_us_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';

import 'package:get/get.dart';

class ContactUsViewController extends BaseController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  void insertContact() {
    runFullLoadingFutureFunction(
      function: ContactUsRepository()
          .insertContact(
            email: emailController.value.text,
            message: messageController.value.text,
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
                  message: "${r.toString()}",
                );
              },
            ),
          ),
    );
  }
}
