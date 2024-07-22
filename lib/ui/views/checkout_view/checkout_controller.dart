import 'dart:ffi';

import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/data/models/my_order_pay.dart';
import 'package:flutter_templete/core/data/reposotories/address_repository.dart';
import 'package:flutter_templete/core/data/reposotories/my_order_repository.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:flutter_templete/ui/views/test_pay/test_pay.dart';
import 'package:get/get.dart';

import '../../../core/enums/message_type.dart';
import '../../../core/enums/operation_type.dart';

class CheckoutController extends BaseController {
  Rx<OrderPayModel> orderid = OrderPayModel().obs;
  Rx<String?> selectedName = ''.obs;

  RxList<AddressGetModel> addressList = <AddressGetModel>[].obs;
  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  Cartcontroller cc = Get.put(Cartcontroller());
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
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            addressList.value = r;
            getNameSet(addressList);
          });
        }));
  }

  Set<String> getNameSet(List<AddressGetModel> addressList) {
    final nameSet = <String>{};
    final idList = <String>[];

    for (var address in addressList) {
      nameSet.add(address.name ?? '');
      idList.add(address.id.toString());
    }

    return nameSet;
  }

  List<int> getIdList(List<AddressGetModel> addressList) {
    final idList = <int>[];
    for (var address in addressList) {
      idList.add(address.id!);
    }
    return idList;
  }

  RxInt selectedId = 0.obs; // New line

  // List<String> getIdList(List<AddressGetModel> addressList) {
  //   List<String> idList = [];

  //   for (var address in addressList) {
  //     idList.add(address.id.toString());
  //   }

  //   return idList;
  // }

  void submit({required int basket_id, required int address_id}) {
    runFullLoadingFutureFunction(
      function: MyOrderRepository()
          .submitOrder(basket_id: basket_id, address_id: address_id)
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: "please choose Location first",
                );
              },
              (r) {
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: r,
                );
                Get.to(TestPay(
                  invoiceAmount: cc.cartInfo.value.total!.toDouble(),
                  orderid: storage.getOrderInfo().id!,
                ));
              },
            ),
          ),
    );
  }
}
