import 'package:flutter_templete/core/data/models/my_order_model.dart';
import 'package:flutter_templete/core/data/reposotories/my_order_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class MyOrderViewController extends BaseController {
  RxList<MyOrderModel> OrderList = <MyOrderModel>[].obs;
  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  void onInit() {
    getOrders();
    super.onInit();
  }

  Future<void> getOrders() async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function: MyOrderRepository().getOrder().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: "add to you order first",
                messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            OrderList.value = r;
          });
        }));
  }
}
