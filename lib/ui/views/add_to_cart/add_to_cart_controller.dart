import 'package:flutter_templete/core/data/models/cart_model.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/product_model.dart';
import 'package:flutter_templete/core/data/reposotories/cart_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

import '../../../core/utils/general_utils.dart';

class AddToCartController extends BaseController {
  RxList<ProductFearuresModel> cartProductList = <ProductFearuresModel>[].obs;

  List<CartModel> get cartList => cartService.cartList;
  @override
  void onInit() {
    // TODO: implement onInit
    getCart();
    super.onInit();
  }

  void changeCount(bool incress, CartModel model) {
    cartService.changeCount(
      incress: incress,
      model: model,
    );
  }

  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void checkout() {
    runFullLoadingFutureFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
      // Get.off(CheckoutView());
    }));
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
}
