import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_order_info.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/cart_view/cart_controller.dart';
import 'package:flutter_templete/ui/views/checkout_view/checkout_view.dart';
import 'package:flutter_templete/ui/views/product_details/products_view.dart';
import 'package:get/get.dart';

class CartVieww extends StatefulWidget {
  const CartVieww({super.key});

  @override
  State<CartVieww> createState() => _CartViewwState();
}

class _CartViewwState extends State<CartVieww> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: Column(children: [
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
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(children: [
                    // CachedNetworkImage(
                    //     width: screenWidth(4),
                    //     height: screenHieght(4),
                    //     imageUrl:
                    //         "https://s3-alpha-sig.figma.com/img/4d14/0eff/ebc80cec12ead181401214ac7ed97382?Expires=1715558400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=U5ccnZsv9MGg3TveDcy3p~pj8eWQCfstLdDjMSTd5QiJBaXuPBT4baDWCZI8ZXE2dIF71Dtx5rF7781zksokcgo0y7ei8RuXZ73EMUGl08jD2E27u6c6kRpnzipHjyXMfJRkS8yLYtBKBuiP1ea5fWwiOrrHHThM48CdjADRKbA-CT9g8-QFnuE3hgBhmlyIU4XF2b4nCok-cf-HhQ9urZ4~hebSn7-K0E6D5oyIiKt6SfEDyGV~UC~~vBYEzQDF7dv4aTlI6DrgN~qmbUNTYuVGxtACG5T~GO09F~mCrLD9f2xzUOtP~UC-RIbGWB4ytoZni-Pvx0dXuXeirADYBA__"),
                    SizedBox(
                      width: screenWidth(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Name',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: screenHieght(160),
                        ),
                        Text('Shape:Rextangle'),
                        Text('color:Gold'),
                        SizedBox(
                          height: screenHieght(40),
                        ),
                        Text(
                          r'$100',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      width: screenWidth(19),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(children: [
                        Container(
                            height: screenHieght(24),
                            width: screenWidth(8),
                            child: Icon(Icons.add)),
                        Container(
                          height: screenHieght(24),
                          width: screenWidth(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHieght(24),
                          width: screenWidth(8),
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Delete button action
                            },
                          ),
                        ),
                      ]),
                    )
                  ]),
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
                CustomButton(
                    text: 'Continue To checkout',
                    onPressed: () {
                      Get.to(CheckoutView());
                    })
              ]))),
    );
  }
}
