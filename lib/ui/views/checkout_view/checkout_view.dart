import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_order_info.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_radio.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/change_location/change_location.dart';
import 'package:flutter_templete/ui/views/checkout_view/checkout_controller.dart';
import 'package:flutter_templete/ui/views/main_view/cart_view/cart_view.dart';
import 'package:get/get.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  CheckoutController controller = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHieght(20),
            ),
            Row(children: [
              InkWell(
                  onTap: () {
                    Get.to(CartView());
                  },
                  child: SvgPicture.asset('assets/images/arrow_back.svg')),
              SizedBox(
                width: screenWidth(60),
              ),
              Text(
                tr('key_checkout'),
                style: TextStyle(fontSize: 20),
              ),
            ]),
            SizedBox(
              height: screenHieght(20),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/Map.svg'),
                SizedBox(
                  width: screenWidth(40),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery to ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Loaction 1',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(ChangeLocationView());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey,
                    ),
                    child: Text('change'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHieght(15),
            ),
            Text(
              'Payment Method :',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: screenHieght(60),
            ),
            Row(
              children: [
                Text(
                  'cash',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                CustomRadio(value: 0, onTaped: () {}, selected: 0)
              ],
            ),
            SizedBox(
              height: screenHieght(200),
            ),
            Row(
              children: [
                Text(
                  'By Card',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                CustomRadio(value: 1, onTaped: () {}, selected: 0)
              ],
            ),
            SizedBox(
              height: screenHieght(6),
            ),
            Container(
              height: screenHieght(5),
              width: screenWidth(1),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(60)),
                child: Column(children: [
                  SizedBox(
                    height: screenHieght(40),
                  ),
                  OrdrInfoItem(
                    title: 'Subtotal',
                    value: r'$100',
                  ),
                  SizedBox(
                    height: screenHieght(80),
                  ),
                  OrdrInfoItem(
                    title: 'Shipping',
                    value: 'calc at the next step',
                  ),
                  SizedBox(
                    height: screenHieght(80),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: screenHieght(80),
                  ),
                  OrdrInfoItem(
                    title: 'Total',
                    value: 'Calc at the next step',
                  )
                ]),
              ),
            ),
            SizedBox(
              height: screenHieght(20),
            ),
            Center(
              child: CustomButton(
                  text: 'Pay',
                  onPressed: () {
                    Get.to(CheckoutView());
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
