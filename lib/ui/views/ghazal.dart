// import 'package:flutter/material.dart';
// import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
// import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

// class Ghazal extends StatefulWidget {
//   const Ghazal({super.key});

//   @override
//   State<Ghazal> createState() => _GhazalState();
// }

// // late MFApplePayButton mfApplePayButton;
//   late MFCardPaymentView mfCardView;
// class _GhazalState extends State<Ghazal> {
//   @override
//   void initState() {
//     MFSDK.init(
//         "FTnOftGkNunVGm4-W-49HKttLjYSS4jEvuStOmqz1omrGYmP8Pv1WQzrUYMNqjDJZSWxw57-MXJmIPES4CFW35hIJ2pprEU_O2rmQw6p2ApNQphE_zRAZILoQk2MEm3LVwdfoGfAUs0Ct5pjREVSx6bwBMRQd9dcK8LHaFrkvG70y5y-XFspqcR2c_BlbvWpmZ1cdZ1EaRE9lAgpK63DudYJfA2O3cxdzYieD1paEgXJD2pwE6ejDUkJa69UeRmv_GaJ2MmY72XENuRm8_ToY_ag8ZavNrljBDjrYBABx4N1KDMxEfHNhPngATQUE1KFYqRjHgiAeZghlGlmJChbaaZi8soaPqqFjVvqBpDbQyOQc9qLOjsQMux1RqKXmBRHWMsxeRZN-vc1Sx8lOlvk2GwPGxY5TsxNlpM7wz1tr3SKBQJI5SxSuXaW6qyByhT3Ea_hDNBZ9a--ZEcGKOtl7zRHVQ4hDQVtN1z_CC4j18MCtji8VpFtjpfyVbaK1KJB7VGPVISiJ31aFOb4hTlq-b0ah7JqatWS8zo6SMwEaysLpLHBt_5gTqWU5ysY3zW-NHIAdruv_Ni1fioCewOy4QroGnuaAHZui4fpayAPEpIR3svE_bqiD21l2RnfwMH_oPZm14jaL4xkRwCUFcNRRPLyxLWyv7HRxhIHh286HhTY7Pgl",
//         MFCountry.KUWAIT,
//         MFEnvironment.TEST);
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     applePayPayment;
//     mfApplePayButton = MFApplePayButton(applePayStyle: MFApplePayStyle());
//     return applePayView();
//   }

//   applePayPayment(MFInitiateSessionResponse session) async {
//     MFExecutePaymentRequest executePaymentRequest =
//         MFExecutePaymentRequest(invoiceValue: 10);
//     executePaymentRequest.displayCurrencyIso = MFCurrencyISO.KUWAIT_KWD;

//     await mfApplePayButton
//         .displayApplePayButton(
//             session, executePaymentRequest, MFLanguage.ENGLISH)
//         .then((value) => {
//               mfApplePayButton
//                   .executeApplePayButton(
//                       null, (invoiceId) => {debugPrint(invoiceId)})
//                   .then((value) => {debugPrint(value.toString())})
//                   .catchError((error) => {debugPrint(error.message)})
//             })
//         .catchError((error) => {debugPrint(error.message)});
//   }

//   executeDirectPayment() async {
//     var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 10);
//     executePaymentRequest.paymentMethodId = 20;

//     var mfCardRequest = MFCard(
//       cardHolderName: 'myFatoorah',
//       number: '5454545454545454',
//       expiryMonth: '10',
//       expiryYear: '23',
//       securityCode: '000',
//     );

//     var directPaymentRequest = MFDirectPaymentRequest(
//         executePaymentRequest: executePaymentRequest,
//         token:
//             'FTnOftGkNunVGm4-W-49HKttLjYSS4jEvuStOmqz1omrGYmP8Pv1WQzrUYMNqjDJZSWxw57-MXJmIPES4CFW35hIJ2pprEU_O2rmQw6p2ApNQphE_zRAZILoQk2MEm3LVwdfoGfAUs0Ct5pjREVSx6bwBMRQd9dcK8LHaFrkvG70y5y-XFspqcR2c_BlbvWpmZ1cdZ1EaRE9lAgpK63DudYJfA2O3cxdzYieD1paEgXJD2pwE6ejDUkJa69UeRmv_GaJ2MmY72XENuRm8_ToY_ag8ZavNrljBDjrYBABx4N1KDMxEfHNhPngATQUE1KFYqRjHgiAeZghlGlmJChbaaZi8soaPqqFjVvqBpDbQyOQc9qLOjsQMux1RqKXmBRHWMsxeRZN-vc1Sx8lOlvk2GwPGxY5TsxNlpM7wz1tr3SKBQJI5SxSuXaW6qyByhT3Ea_hDNBZ9a--ZEcGKOtl7zRHVQ4hDQVtN1z_CC4j18MCtji8VpFtjpfyVbaK1KJB7VGPVISiJ31aFOb4hTlq-b0ah7JqatWS8zo6SMwEaysLpLHBt_5gTqWU5ysY3zW-NHIAdruv_Ni1fioCewOy4QroGnuaAHZui4fpayAPEpIR3svE_bqiD21l2RnfwMH_oPZm14jaL4xkRwCUFcNRRPLyxLWyv7HRxhIHh286HhTY7Pgl',
//         card: mfCardRequest);

//     await MFSDK
//         .executeDirectPayment(directPaymentRequest, MFLanguage.ENGLISH,
//             (invoiceId) {
//           debugPrint(invoiceId);
//         })
//         .then((value) => debugPrint(value.toString()))
//         .catchError((error) => {debugPrint(error.message)});
//   }

//   Widget applePayView() {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             SizedBox(
//               height: 50,
//               child: CustomButton(
//                   text: "pAY",
//                   onPressed: () {
//                     executeDirectPayment();
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   // return SafeArea(
//   // child:
//   // Column(
//   //   children: [
//   //     CustomButton(
//   //         text: "pay",
//   //         onPressed: () {
//   //           executeDirectPayment() async {
//   //             var executePaymentRequest =
//   //                 MFExecutePaymentRequest(invoiceValue: 10);
//   //             executePaymentRequest.paymentMethodId = 20;

//   //             var mfCardRequest = MFCard(
//   //               cardHolderName: 'myFatoorah',
//   //               number: '5454545454545454',
//   //               expiryMonth: '10',
//   //               expiryYear: '23',
//   //               securityCode: '000',
//   //             );

//   //             var directPaymentRequest = MFDirectPaymentRequest(
//   //                 executePaymentRequest: executePaymentRequest,
//   //                 token:
//   //                     'FTnOftGkNunVGm4-W-49HKttLjYSS4jEvuStOmqz1omrGYmP8Pv1WQzrUYMNqjDJZSWxw57-MXJmIPES4CFW35hIJ2pprEU_O2rmQw6p2ApNQphE_zRAZILoQk2MEm3LVwdfoGfAUs0Ct5pjREVSx6bwBMRQd9dcK8LHaFrkvG70y5y-XFspqcR2c_BlbvWpmZ1cdZ1EaRE9lAgpK63DudYJfA2O3cxdzYieD1paEgXJD2pwE6ejDUkJa69UeRmv_GaJ2MmY72XENuRm8_ToY_ag8ZavNrljBDjrYBABx4N1KDMxEfHNhPngATQUE1KFYqRjHgiAeZghlGlmJChbaaZi8soaPqqFjVvqBpDbQyOQc9qLOjsQMux1RqKXmBRHWMsxeRZN-vc1Sx8lOlvk2GwPGxY5TsxNlpM7wz1tr3SKBQJI5SxSuXaW6qyByhT3Ea_hDNBZ9a--ZEcGKOtl7zRHVQ4hDQVtN1z_CC4j18MCtji8VpFtjpfyVbaK1KJB7VGPVISiJ31aFOb4hTlq-b0ah7JqatWS8zo6SMwEaysLpLHBt_5gTqWU5ysY3zW-NHIAdruv_Ni1fioCewOy4QroGnuaAHZui4fpayAPEpIR3svE_bqiD21l2RnfwMH_oPZm14jaL4xkRwCUFcNRRPLyxLWyv7HRxhIHh286HhTY7Pgl',
//   //                 card: mfCardRequest);

//   //             await MFSDK
//   //                 .executeDirectPayment(
//   //                     directPaymentRequest, MFLanguage.ENGLISH,
//   //                     (invoiceId) {
//   //                   debugPrint(invoiceId);
//   //                 })
//   //                 .then((value) => debugPrint(value.toString()))
//   //                 .catchError((error) => {debugPrint(error.message)});
//   //           }
//   //         })
//   //   ],
//   // ),

//   // );
//   // }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

class Ghazal extends StatefulWidget {
  const Ghazal({super.key});

  @override
  State<Ghazal> createState() => _GhazalState();
}

MFCardViewStyle cardViewStyle() {
  MFCardViewStyle cardViewStyle = MFCardViewStyle();
  cardViewStyle.cardHeight = 500;
  cardViewStyle.hideCardIcons = true;
  cardViewStyle.input?.inputMargin = 5;
  cardViewStyle.label?.display = true;
  cardViewStyle.input?.fontFamily = MFFontFamily.Monaco;
  cardViewStyle.label?.fontWeight = MFFontWeight.Heavy;
  return cardViewStyle;
}

class _GhazalState extends State<Ghazal> {
  late MFCardPaymentView mfCardView;
  initSession() async {
    MFInitiateSessionRequest initiateSessionRequest =
        MFInitiateSessionRequest();

    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
        .then((value) => loadEmbeddedPayment(value))
        .catchError((error) => {debugPrint(error.message)});
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
        toolBarTitleColor: '#FFEB3B',
        toolBarBackgroundColor: '#CA0404',
        isShowToolBar: true);
  }

  @override
  void initState() {
    super.initState();
    MFSDK.init(
        "FTnOftGkNunVGm4-W-49HKttLjYSS4jEvuStOmqz1omrGYmP8Pv1WQzrUYMNqjDJZSWxw57-MXJmIPES4CFW35hIJ2pprEU_O2rmQw6p2ApNQphE_zRAZILoQk2MEm3LVwdfoGfAUs0Ct5pjREVSx6bwBMRQd9dcK8LHaFrkvG70y5y-XFspqcR2c_BlbvWpmZ1cdZ1EaRE9lAgpK63DudYJfA2O3cxdzYieD1paEgXJD2pwE6ejDUkJa69UeRmv_GaJ2MmY72XENuRm8_ToY_ag8ZavNrljBDjrYBABx4N1KDMxEfHNhPngATQUE1KFYqRjHgiAeZghlGlmJChbaaZi8soaPqqFjVvqBpDbQyOQc9qLOjsQMux1RqKXmBRHWMsxeRZN-vc1Sx8lOlvk2GwPGxY5TsxNlpM7wz1tr3SKBQJI5SxSuXaW6qyByhT3Ea_hDNBZ9a--ZEcGKOtl7zRHVQ4hDQVtN1z_CC4j18MCtji8VpFtjpfyVbaK1KJB7VGPVISiJ31aFOb4hTlq-b0ah7JqatWS8zo6SMwEaysLpLHBt_5gTqWU5ysY3zW-NHIAdruv_Ni1fioCewOy4QroGnuaAHZui4fpayAPEpIR3svE_bqiD21l2RnfwMH_oPZm14jaL4xkRwCUFcNRRPLyxLWyv7HRxhIHh286HhTY7Pgl",
        MFCountry.KUWAIT,
        MFEnvironment.TEST);
    initSession();
  }

  Widget build(BuildContext context) {
    mfCardView = MFCardPaymentView(cardViewStyle: cardViewStyle());
    return embeddedCardView();
  }

  pay() async {
    var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 2);
    executePaymentRequest.sessionId = "12332212";

    await mfCardView
        .pay(executePaymentRequest, MFLanguage.ENGLISH, (invoiceId) {
          debugPrint(invoiceId);
        })
        .then((value) => {debugPrint(value.toString())})
        .catchError((error) => {debugPrint(error.message)});
  }

  Widget embeddedCardView() {
    return Column(
      children: [
        SizedBox(
          height: 800,
          child: mfCardView,
        ),
        CustomButton(text: "pay", onPressed: () => pay())
      ],
    );
  }
}
