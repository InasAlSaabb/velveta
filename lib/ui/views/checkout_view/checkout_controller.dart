import 'package:flutter_templete/core/data/models/my_order_pay.dart';
import 'package:flutter_templete/core/data/reposotories/my_order_repository.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/test_pay/test_pay.dart';
import 'package:get/get.dart';

import '../../../core/enums/message_type.dart';
import '../../../core/enums/operation_type.dart';

class CheckoutController extends BaseController {
  Rx<OrderPayModel> orderid = OrderPayModel().obs;

  void submit({required basket_id, required address_id}) {
    runFullLoadingFutureFunction(
      function: MyOrderRepository()
          .submitOrder(basket_id: basket_id, address_id: address_id)
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
                  message: r,
                );
                Get.to(TestPay(
                  invoiceAmount: 200,
                  orderid: storage.getOrderInfo().id!,
                ));
              },
            ),
          ),
    );
  }
}
