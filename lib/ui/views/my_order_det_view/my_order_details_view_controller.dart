import 'package:flutter_templete/core/data/models/my_order_model.dart';
import 'package:flutter_templete/core/data/models/order_by_id_all_info_model.dart';
import 'package:flutter_templete/core/data/models/order_by_id_model.dart';
import 'package:flutter_templete/core/data/reposotories/my_order_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class OrderDetailsViewController extends BaseController {
  OrderDetailsViewController(mealmodel) {
    model = mealmodel;
  }
  MyOrderModel model = MyOrderModel();
  void onInit() {
    getOrdersById(order_id: model.orderId!);
    getOrdersByIdInfo(order_id: model.orderId!);
    super.onInit();
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  RxList<OrderByIdModel> orderListById = <OrderByIdModel>[].obs;
  Rx<OrderByIdAllInfoModel> orderByIdModel = OrderByIdAllInfoModel().obs;
  Future<void> getOrdersById({required int order_id}) async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function:
            MyOrderRepository().getOrderById(order_id: order_id).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            orderListById.value = r;
          });
        }));
  }

  Future<void> getOrdersByIdInfo({required int order_id}) async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function: MyOrderRepository()
            .getOrderByIdInfo(order_id: order_id)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            orderByIdModel.value = r;
          });
        }));
  }

  Future<void> reOrder({required int order_id}) async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function: MyOrderRepository().reOrder(order_id: order_id).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: r, messageType: MessageType.SUCCESS);
          });
        }));
  }
}
