import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/pay_key.dart';
import 'package:get/get.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class TestPay extends StatefulWidget {
  const TestPay({super.key});

  @override
  State<TestPay> createState() => _TestPayState();
}

class _TestPayState extends State<TestPay> {
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
            log(response.status.toString());
            Get.back();
          },
          request: MyfatoorahRequest.test(
            currencyIso: Country.Kuwait,
            successUrl:
                'https://openjournalsystems.com/file/2017/07/payment-success.png',
            errorUrl: 'https://www.google.com',
            invoiceAmount: 100,
            language: ApiLanguage.English,
            token: ApiKeys.apiKey,
          ),
        ));
  }
}
