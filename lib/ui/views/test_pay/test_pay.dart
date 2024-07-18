import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/pay_key.dart';
import 'package:flutter_templete/ui/views/test_pay/test_pay_controller.dart';
import 'package:get/get.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class TestPay extends StatefulWidget {
  final double invoiceAmount;
  final int orderid;
  const TestPay(
      {super.key, required this.invoiceAmount, required this.orderid});

  @override
  State<TestPay> createState() => _TestPayState();
}

String getFirstTwoWords(String text) {
  List<String> words = text.split('.');
  if (words.length >= 2) {
    return '${words[1]}';
  } else {
    return text;
  }
}

class _TestPayState extends State<TestPay> {
  TestPayController controller = Get.put(TestPayController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('my_fatoorah Demo'),
        ),
        body: MyFatoorah(
          directPayment: (callBack) {
            log("message");
            return Container();
          },
          afterPaymentBehaviour: AfterPaymentBehaviour.AfterCallbackExecution,
          onResult: (response) {
            response.status;
            response.paymentId;
            print(response.status);
            response.status.toString();
            getFirstTwoWords(response.status.toString()) == "Success"
                ? controller.verfiyPay(
                    order_id: widget.orderid.toString(),
                    payment_id: response.paymentId.toString(),
                    payment_status:
                        getFirstTwoWords(response.status.toString()))
                : controller.FailedPay(
                    order_id: widget.orderid.toString(),
                    payment_id: response.paymentId.toString(),
                    payment_status:
                        getFirstTwoWords(response.status.toString()));
            log(response.toString());
            Get.back();
          },
          request: MyfatoorahRequest.test(
              customerCivilId: widget.orderid.toString(),
              currencyIso: Country.Kuwait,
              successUrl:
                  'https://velveta.org/api/payment/paySuccess/${widget.orderid}',
              errorUrl:
                  'https://velveta.org//api/payment/payFailed${widget.orderid}',
              invoiceAmount: widget.invoiceAmount,
              language: ApiLanguage.English,
              token: ApiKeys.apiKey),
        ));
  }
}
