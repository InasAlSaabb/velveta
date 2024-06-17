import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/data/reposotories/address_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class ChangeLocation extends BaseController {
  RxList<AddressGetModel> addressList = <AddressGetModel>[].obs;
  RxInt collegeId = 0.obs;
  @override
  void onInit() {
    getAllAddress();
    super.onInit();
  }

  Future<void> getAllAddress() async {
    runLoadingFutureFunction(
        type: OperationType.ADDRESS,
        function: AddressRepository().getAllAddress().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            addressList.value = r;
          });
          storage.setAddressList(addressList);
        }));
  }

  void deleteTask({
    required int id,
  }) {
    runFullLoadingFutureFunction(
      type: OperationType.ADDRESS,
      function: AddressRepository().delete(id: id).then((value) {
        value.fold((l) {
          CustomToast.showMessage(message: l, messageType: MessageType.INFO);
        }, (r) {
          CustomToast.showMessage(
              message: "deleted successfully ",
              messageType: MessageType.SUCCESS);
          Get.back(closeOverlays: true);
          update();
        });
      }),
    );
  }

  void deleteAddress(int i) {}
}
