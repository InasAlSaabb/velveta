import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/address_get_model.dart';
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
  List<AddressGetModel> addressList = [
    AddressGetModel(
      id: 1,
      name: 'Location',
      zipCode: '12345',
      city: 'San Francisco',
      state: 'CA',
      addressLine: '123 Main St',
    ),
  ];
  void hidePassword2({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }

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
                storage.setTokenInfo(r);
                Get.to(MainView());
              },
            ),
          ),
    );
  }
}
