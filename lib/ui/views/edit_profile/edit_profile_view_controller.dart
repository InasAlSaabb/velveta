import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/profile_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfileViewController extends BaseController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController larstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString selectedCountryCode = ''.obs;
  Rx<String> initialCountry = '=963'.obs;
  Rx<PhoneNumber> number = PhoneNumber(dialCode: "+963").obs;
  //  int countryCode = int.parse(number.value.isoCode?? '0');
  Future<void> deletAccount() async {
    runLoadingFutureFunction(
        type: OperationType.PROFILE,
        function: ProfileRepository().deletAccount().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: r, messageType: MessageType.SUCCESS);

            print(r);
          });
        }));
  }

  Future<void> editProfile() async {
    runLoadingFutureFunction(
        type: OperationType.PROFILE,
        function: ProfileRepository()
            .editProfile(
                country_code: selectedCountryCode.toString(),
                email: emailController.text,
                last_name: larstNameController.text,
                first_name: firstNameController.text,
                phone: phoneController.text)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: r, messageType: MessageType.SUCCESS);

            print(r);
          });
        }));
  }
}
