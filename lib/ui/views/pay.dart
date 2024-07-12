import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/pay_key.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

MFCardViewStyle cardViewStyle() {
  MFCardViewStyle cardViewStyle = MFCardViewStyle();
  cardViewStyle.cardHeight = 500;
  cardViewStyle.hideCardIcons = false;
  cardViewStyle.input?.inputMargin = 5;
  cardViewStyle.label?.display = true;
  cardViewStyle.input?.fontFamily = MFFontFamily.Monaco;
  cardViewStyle.label?.fontWeight = MFFontWeight.Heavy;
  return cardViewStyle;
}

class _PayState extends State<Pay> {
  late MFCardPaymentView mfCardView;
  initSession() async {
    MFInitiateSessionRequest initiateSessionRequest =
        MFInitiateSessionRequest();
    customLoader();
    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
        .then((value) => loadEmbeddedPayment(value))
        .catchError((error) => {debugPrint(error.message)});
    BotToast.closeAllLoading();
  }

  loadEmbeddedPayment(MFInitiateSessionResponse session) {
    loadCardView(session);

    // if (Platform.isIOS) applePayPayment(session);
  }

  loadCardView(MFInitiateSessionResponse session) {
    mfCardView.load(session, (bin) {
      debugPrint(bin);
    });
  }

  setUpActionBar() {
    MFSDK.setUpActionBar(
        toolBarTitle: 'Company Payment',
        toolBarTitleColor: '#FFFFFF',
        toolBarBackgroundColor: '#CA0404',
        isShowToolBar: true);
  }

  @override
  void initState() {
    setUpActionBar();
    super.initState();
    MFSDK.init(ApiKeys.apiKey, MFCountry.KUWAIT, MFEnvironment.TEST);
    initSession();
  }

  Widget build(BuildContext context) {
    mfCardView = MFCardPaymentView(cardViewStyle: cardViewStyle());
    return Scaffold(resizeToAvoidBottomInset: false, body: embeddedCardView());
  }

  pay(customerEmail, customerCivilId, customerName, customerMobile,
      invoiceValue) async {
    var executePaymentRequest = MFExecutePaymentRequest(
        customerEmail: customerEmail,
        customerCivilId: customerCivilId,
        customerName: customerName,
        customerMobile: customerMobile,
        invoiceValue: invoiceValue);
    executePaymentRequest.sessionId = UniqueKey().toString();

    await mfCardView.pay(executePaymentRequest, MFLanguage.ENGLISH,
        (invoiceId) {
      debugPrint(invoiceId);
    }).then((value) {
      log(value.invoiceStatus.toString());
      CustomToast.showMessage(message: "Payment completed");
      Get.back();
    }).catchError((error) {
      debugPrint(error.message);
    });
  }

  Widget embeddedCardView() {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        SizedBox(
          height: 600,
          child: mfCardView,
        ),
        ElevatedButton(
            onPressed: () async {
              await pay(
                  "inassaab729@gmail.com", "11", "inas", "0982485621", 20);
            },
            child: Text("Pay"))
      ],
    );
  }
}
