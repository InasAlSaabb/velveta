import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/address_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/change_location/change_location_controller.dart';
import 'package:get/get.dart';

class AddAddressController extends BaseController {
  TextEditingController addressline = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController name = TextEditingController();

  void add() {
    runFullLoadingFutureFunction(
      function: AddressRepository()
          .addAddress(
              address_line: name.text,
              zip_code: zipcode.text,
              city: city.text,
              name: addressline.text,
              state: state.text)
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
              },
            ),
          ),
    );
  }
}
