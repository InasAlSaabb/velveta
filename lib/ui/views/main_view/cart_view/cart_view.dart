import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_cart_Product.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_order_info.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/checkout_view/checkout_view.dart';
import 'package:flutter_templete/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:flutter_templete/ui/views/product_details/products_view.dart';
import 'package:get/get.dart';

class CartVieww extends StatefulWidget {
  const CartVieww({super.key});

  @override
  State<CartVieww> createState() => _CartViewwState();
}

class _CartViewwState extends State<CartVieww> {
  Cartcontroller controller = Get.put(Cartcontroller());
  @override
  void initState() {
    super.initState();
    update();
    updateInfo();
  }

  void update() {
    controller.getCart();
  }

  void updateInfo() {
    controller.getCartInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: Obx(() => controller.isLoading
                  ? SpinKitCircle(
                      color: AppColors.mainGreyColor,
                    )
                  : ListView(children: [
                      SizedBox(
                        height: screenHieght(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(ProductView());
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/arrow_back.svg')),
                              SizedBox(
                                width: screenWidth(60),
                              ),
                              Text(
                                tr('key_my_cart'),
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: screenHieght(10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHieght(1.5),
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.cartProductList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHieght(70)),
                                child: CustomCArtPRoduct(
                                  counterrcontroller:
                                      controller.counterController,
                                  counter: controller
                                      .cartProductList[index].quantity
                                      .toString(),
                                  onedit: () {
                                    controller.editCart(
                                        //?
                                        id: controller
                                            .cartProductList[index].id,
                                        quantity: int.parse(
                                            controller.counterController.text));
                                  },
                                  ondelete: () {
                                    controller.deleteFromCart(
                                      item_id:
                                          controller.cartProductList[index].id,
                                    );
                                  },
                                  imagename: controller
                                      .cartProductList[index].mainImage,
                                  color: controller.cartProductList[index]
                                          .variation!.color ??
                                      "no color",
                                  price: controller.cartProductList[index].price
                                      .toString(),
                                  productName:
                                      controller.cartProductList[index].name,
                                  shape: controller.cartProductList[index]
                                          .variation!.boxShape ??
                                      "no shape",
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: screenHieght(30),
                      ),
                      Container(
                        height: screenHieght(5),
                        width: screenWidth(1),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth(60)),
                          child: Column(children: [
                            SizedBox(
                              height: screenHieght(40),
                            ),
                            OrdrInfoItem(
                              title: tr('key_subtotal'),
                              value:
                                  controller.cartInfo.value.subTotal.toString(),
                            ),
                            SizedBox(
                              height: screenHieght(80),
                            ),
                            OrdrInfoItem(
                              title: tr('key_shipping'),
                              value:
                                  controller.cartInfo.value.shipping.toString(),
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
                              title: tr('key_total'),
                              value: controller.cartInfo.value.total.toString(),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: screenHieght(20),
                      ),
                      CustomButton(
                          textColor: AppColors.mainWhiteVColor,
                          text: tr('key_continuew_to_checkout'),
                          onPressed: () {
                            Get.to(CheckoutView());
                          })
                    ])))),
    );
  }
}
