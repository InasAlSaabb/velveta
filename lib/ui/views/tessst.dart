// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

// // class Tesst extends StatefulWidget {
// //   const Tesst({super.key});

// //   @override
// //   State<Tesst> createState() => _TesstState();
// // }

// // class _TesstState extends State<Tesst> {
// //   late MFCardPaymentView mfCardView;

// //   @override
// //   void initState() {
// //     super.initState();
// //     MFSDK.init("your_api_key", MFCountry.KUWAIT, MFEnvironment.TEST);
// //   }

// //   initiatePayment() async {
// //     MFInitiatePaymentRequest request = MFInitiatePaymentRequest(
// //         invoiceAmount: 10, currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);
// //     await MFSDK
// //         .initiatePayment(request, MFLanguage.ENGLISH)
// //         .then((value) => debugPrint(value.toString()))
// //         .catchError((error) => {debugPrint(error.message)});
// //   }

// //   executePayment() async {
// //     MFExecutePaymentRequest request = MFExecutePaymentRequest(invoiceValue: 10);
// //     request.paymentMethodId = 1;

// //     await MFSDK
// //         .executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
// //           debugPrint(invoiceId);
// //         })
// //         .then((value) => debugPrint(value.toString()))
// //         .catchError((error) => {debugPrint(error.message)});
// //   }

// //   sendPayment() async {
// //     MFSendPaymentRequest request = MFSendPaymentRequest();
// //     request.customerName = "TEESST";
// //     request.invoiceValue = 10;
// //     request.notificationOption = MFNotificationOption.EMAIL;

// //     await MFSDK
// //         .sendPayment(request, MFLanguage.ENGLISH)
// //         .then((value) => debugPrint(value.toString()))
// //         .catchError((error) => {debugPrint(error.message)});
// //   }

// //   getPaymentStatus() async {
// //     MFGetPaymentStatusRequest request =
// //         MFGetPaymentStatusRequest(key: '2593740', keyType: MFKeyType.INVOICEID);
// //     await MFSDK
// //         .getPaymentStatus(request, MFLanguage.ENGLISH)
// //         .then((value) => debugPrint(value.toString()))
// //         .catchError((error) => {debugPrint(error.message)});
// //   }

// //   MFCardViewStyle cardViewStyle() {
// //     MFCardViewStyle cardViewStyle = MFCardViewStyle();
// //     cardViewStyle.cardHeight = 200;
// //     cardViewStyle.hideCardIcons = false;
// //     cardViewStyle.input?.inputMargin = 5;
// //     cardViewStyle.label?.display = true;
// //     cardViewStyle.input?.fontFamily = MFFontFamily.Monaco;
// //     cardViewStyle.label?.fontWeight = MFFontWeight.Heavy;
// //     return cardViewStyle;
// //   }

// //   initSession() async {
// //     /*
// //       If you want to use saved card option with embedded payment, send the parameter
// //       "customerIdentifier" with a unique value for each customer. This value cannot be used
// //       for more than one Customer.
// //      */
// //     // var request = MFInitiateSessionRequest("12332212");
// //     /*
// //       If not, then send null like this.
// //      */
// //     MFInitiateSessionRequest initiateSessionRequest =
// //         MFInitiateSessionRequest();

// //     await MFSDK
// //         .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
// //         .then((value) => loadEmbeddedPayment(value))
// //         .catchError((error) => {debugPrint(error.message)});
// //   }

// //   loadEmbeddedPayment(MFInitiateSessionResponse session) {
// //     loadCardView(session);
// //     // if (Platform.isIOS) applePayPayment(session);
// //   }

// //   loadCardView(MFInitiateSessionResponse session) {
// //     // mfCardView.load(session, (bin) {debugPrint(bin)});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     mfCardView = MFCardPaymentView(cardViewStyle: cardViewStyle());
// //     return embeddedCardView();
// //   }

// //   pay() async {
// //     var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 10);
// //     executePaymentRequest.sessionId = "2";

// //     await mfCardView
// //         .pay(executePaymentRequest, MFLanguage.ENGLISH, (invoiceId) {
// //           debugPrint(invoiceId);
// //         })
// //         .then((value) => {debugPrint(value.toString())})
// //         .catchError((error) => {debugPrint(error.message)});
// //   }

// //   executeDirectPayment() async {
// //     var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 10);
// //     executePaymentRequest.paymentMethodId = 20;

// //     var mfCardRequest = MFCard(
// // cardHolderName: 'myFatoorah',
// // number: '5454545454545454',
// // expiryMonth: '10',
// // expiryYear: '23',
// // securityCode: '000',
// //     );

// //     var directPaymentRequest = MFDirectPaymentRequest(
// //         executePaymentRequest: executePaymentRequest,
// //         token: null,
// //         card: mfCardRequest);

// //     await MFSDK
// //         .executeDirectPayment(directPaymentRequest, MFLanguage.ENGLISH,
// //             (invoiceId) {
// //           debugPrint(invoiceId);
// //         })
// //         .then((value) => debugPrint(value.toString()))
// //         .catchError((error) => {debugPrint(error.message)});
// //   }

// //   Widget embeddedCardView() {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           SizedBox(
// //             height: 200,
// //             child: mfCardView,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

class Tesst extends StatefulWidget {
  const Tesst({super.key});

  @override
  State<Tesst> createState() => _TesstState();
}

class _TesstState extends State<Tesst> {
  late MFCardPaymentView mfCardView;

  @override
  void initState() {
    super.initState();
    MFSDK.init("your_api_key", MFCountry.KUWAIT, MFEnvironment.TEST);
  }

  initiatePayment() async {
    MFInitiatePaymentRequest request = MFInitiatePaymentRequest(
        invoiceAmount: 10, currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);
    await MFSDK
        .initiatePayment(request, MFLanguage.ENGLISH)
        .then((value) => debugPrint(value.toString()))
        .catchError((error) => {debugPrint(error.message)});
  }

  executePayment() async {
    MFExecutePaymentRequest request = MFExecutePaymentRequest(invoiceValue: 10);
    request.paymentMethodId = 1;

    await MFSDK
        .executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
          debugPrint(invoiceId);
        })
        .then((value) => debugPrint(value.toString()))
        .catchError((error) => {debugPrint(error.message)});
  }

  sendPayment() async {
    MFSendPaymentRequest request = MFSendPaymentRequest();
    request.customerName = "TEESST";
    request.invoiceValue = 10;
    request.notificationOption = MFNotificationOption.EMAIL;

    await MFSDK
        .sendPayment(request, MFLanguage.ENGLISH)
        .then((value) => debugPrint(value.toString()))
        .catchError((error) => {debugPrint(error.message)});
  }

  getPaymentStatus() async {
    MFGetPaymentStatusRequest request =
        MFGetPaymentStatusRequest(key: '2593740', keyType: MFKeyType.INVOICEID);
    await MFSDK
        .getPaymentStatus(request, MFLanguage.ENGLISH)
        .then((value) => debugPrint(value.toString()))
        .catchError((error) => {debugPrint(error.message)});
  }

  MFCardViewStyle cardViewStyle() {
    MFCardViewStyle cardViewStyle = MFCardViewStyle();
    cardViewStyle.cardHeight = 200;
    cardViewStyle.hideCardIcons = false;
    cardViewStyle.input?.inputMargin = 5;
    cardViewStyle.label?.display = true;
    cardViewStyle.input?.fontFamily = MFFontFamily.Monaco;
    cardViewStyle.label?.fontWeight = MFFontWeight.Heavy;
    return cardViewStyle;
  }

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
    // mfCardView.load(session, (bin) {debugPrint(bin)});
  }

  @override
  Widget build(BuildContext context) {
    mfCardView = MFCardPaymentView(cardViewStyle: cardViewStyle());
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: mfCardView,
          ),
          ElevatedButton(
            onPressed: () {
              pay();
            },
            child: Text('Pay Now'),
          ),
        ],
      ),
    );
  }

  pay() async {
    var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 10);
    executePaymentRequest.sessionId = "2";

    await mfCardView
        .pay(executePaymentRequest, MFLanguage.ENGLISH, (invoiceId) {
          debugPrint(invoiceId);
        })
        .then((value) => {debugPrint(value.toString())})
        .catchError((error) => {debugPrint(error.message)});
  }

  executeDirectPayment() async {
    var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 10);
    executePaymentRequest.paymentMethodId = 20;

    var mfCardRequest = MFCard(
      cardHolderName: 'myFatoorah',
      number: '5454545454545454',
      expiryMonth: '10',
      expiryYear: '23',
      securityCode: '000',
    );
  }
}

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:my_fatoorah/my_fatoorah.dart';

// class Example extends StatelessWidget {
//   const Example({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('my_fatoorah Demo'),
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(8.0),
//           child: MaterialButton(
//             color: Colors.blue,
//             onPressed: () async {
//               var response = await MyFatoorah.startPayment(
//                 context: context,
//                 successChild: const Icon(Icons.abc),
//                 // afterPaymentBehaviour:
//                 //     AfterPaymentBehaviour.BeforeCallbackExecution,
//                 request: MyfatoorahRequest.test(
//                     currencyIso: Country.SaudiArabia,
//                     successUrl: 'https://pub.dev/packages/get',
//                     errorUrl: 'https://www.google.com/',
//                     invoiceAmount: 100,
//                     language: ApiLanguage.English,
//                     token:
//                         'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL'),
//               );
//               log(response.paymentId.toString());
//               log(response.status.toString());
//             },
//             splashColor: Colors.blueGrey,
//             child: const Text(
//               'Show Payment',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
