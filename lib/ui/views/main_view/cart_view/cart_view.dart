import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_cart_Product.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_favorite_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_order_info.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_product.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/cart_view/cart_controller.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: Obx(() => Column(children: [
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
                              height: screenHieght(20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHieght(20),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.cartProductList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomCArtPRoduct(
                              imagename:
                                  controller.cartProductList[index].mainImage,
                              color: controller.cartProductList[index]
                                  .variations![index].attributes!.color,
                              price: controller.cartProductList[index]
                                  .variations![index].price,
                              productName:
                                  controller.cartProductList[index].name,
                              shape: controller.cartProductList[index]
                                  .variations![index].attributes!.boxShape,
                            );
                          }),
                    ),
                    SizedBox(
                      height: screenHieght(3.4),
                    ),
                    Container(
                      height: screenHieght(5),
                      width: screenWidth(1),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth(60)),
                        child: Column(children: [
                          SizedBox(
                            height: screenHieght(40),
                          ),
                          OrdrInfoItem(
                            title: tr('key_subtotal'),
                            value: r'$100',
                          ),
                          SizedBox(
                            height: screenHieght(80),
                          ),
                          OrdrInfoItem(
                            title: tr('key_shipping'),
                            value: tr('key_calcu'),
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
                            value: tr('key_calcu'),
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
   // Container(
                    //   decoration: BoxDecoration(
                    //       border:
                    //           Border(bottom: BorderSide(color: Colors.grey))),
                    //   child: Row(children: [
                    //     CachedNetworkImage(
                    //         width: screenWidth(4),
                    //         height: screenHieght(4),
                    //         imageUrl: ""),
                    //     SizedBox(
                    //       width: screenWidth(20),
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Product Name',
                    //           style: TextStyle(fontSize: 25),
                    //         ),
                    //         SizedBox(
                    //           height: screenHieght(160),
                    //         ),
                    //         Text('Shape:Rextangle'),
                    //         Text('color:Gold'),
                    //         SizedBox(
                    //           height: screenHieght(40),
                    //         ),
                    //         Text(
                    //           r'$100',
                    //           style: TextStyle(fontSize: 20),
                    //         )
                    //       ],
                    //     ),
                    // SizedBox(
                    //   width: screenWidth(19),
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black.withOpacity(0.2),
                    //         blurRadius: 4.0,
                    //         spreadRadius: 2.0,
                    //         offset: Offset(0, 2),
                    //       ),
                    //     ],
                    //   ),
                    //   child: Column(children: [
                    //     Container(
                    //         height: screenHieght(24),
                    //         width: screenWidth(8),
                    //         child: Icon(Icons.add)),
                    //     Container(
                    //       height: screenHieght(24),
                    //       width: screenWidth(8),
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.rectangle,
                    //         color: Colors.black,
                    //       ),
                    //       child: Center(
                    //         child: Text(
                    //           '1',
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //       height: screenHieght(24),
                    //       width: screenWidth(8),
                    //       child: IconButton(
                    //         icon: Icon(Icons.delete),
                    //         onPressed: () {
                    //           // Delete button action
                    //         },
                    //       ),
                    //     ),
                    //   ]),
                    //     )
                    //   ]),
                    // ),