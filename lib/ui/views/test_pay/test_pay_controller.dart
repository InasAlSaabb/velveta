import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/Payment_reposirory.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class TestPayController extends BaseController {
  void verfiyPay(
      {required String payment_id,
      required String payment_status,
      required String order_id}) {
    runFullLoadingFutureFunction(
      function: PaymentReposirory()
          .Pay(
              payment_id: payment_id,
              payment_status: payment_status,
              order_id: order_id)
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
                sendFeedBack2(widget: Text("Hi"));
              },
            ),
          ),
    );
  }

  void FailedPay(
      {required String payment_id,
      required String payment_status,
      required String order_id}) {
    runFullLoadingFutureFunction(
      function: PaymentReposirory()
          .PayFailed(
              payment_id: payment_id,
              payment_status: payment_status,
              order_id: order_id)
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
              },
            ),
          ),
    );
  }
}
