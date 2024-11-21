import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/contact_model.dart';
import 'package:flutter_templete/core/data/reposotories/contact_us_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';

import 'package:get/get.dart';

class ContactUsViewController extends BaseController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  Rx<ContactModel> contact = ContactModel().obs;
  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  @override
  void onInit() {
    getcontactinfo();
    super.onInit();
  }

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
                // CustomToast.showMessage(
                //   messageType: MessageType.SUCCESS,
                //   message: "${r.toString()}",
                // );
              },
            ),
          ),
    );
  }

  Future<void> getcontactinfo() async {
    runLoadingFutureFunction(
        type: OperationType.PROFILE,
        function: ContactUsRepository().Contact().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            contact.value = r;
            print(r);
          });
        }));
  }
}
