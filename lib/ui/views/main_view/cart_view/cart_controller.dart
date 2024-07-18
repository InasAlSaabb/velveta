import 'package:flutter_templete/core/data/models/cart_all_model.dart';
import 'package:flutter_templete/core/data/models/cartproductmodel.dart';
import 'package:flutter_templete/core/data/reposotories/cart_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class Cartcontroller extends BaseController {
  RxList<CartProductModel> cartProductList = <CartProductModel>[].obs;
  Rx<CartAllModel> cartInfo = CartAllModel().obs;

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;

  @override
  void onInit() {
    getCart();
    getCartInfo();
    super.onInit();
  }

  Future<void> getCart() async {
    runLoadingFutureFunction(
        type: OperationType.CARTPRODUCTS,
        function: CartRepository().getCartProducts().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            cartProductList.value = r;
          });
        }));
  }

  Future<void> getCartInfo() async {
    runLoadingFutureFunction(
        type: OperationType.CARTINFO,
        function: CartRepository().getCartInfo().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            cartInfo.value = r;
          });
        }));
  }
}
