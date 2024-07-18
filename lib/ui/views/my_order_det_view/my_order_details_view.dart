import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/data/models/my_order_model.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_begin_main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_G.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_details_order.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/my_order_det_view/my_order_details_view_controller.dart';
import 'package:get/get.dart';

class MyOrderDetailsView extends StatefulWidget {
  final MyOrderModel model;
  const MyOrderDetailsView({
    super.key,
    required this.model,
  });

  @override
  State<MyOrderDetailsView> createState() => _MyOrderDetailsViewState();
}

class _MyOrderDetailsViewState extends State<MyOrderDetailsView> {
  late OrderDetailsViewController controller;
  @override
  void initState() {
    controller = Get.put(OrderDetailsViewController(widget.model));
    super.initState();
  }

  String getFirstWords(String text) {
    List<String> words = text.split('T');
    if (words.length >= 2) {
      return '${words[0]}';
    } else {
      return text;
    }
  }

  String getTwoWords(String text) {
    List<String> words = text.split('T');
    if (words.length >= 2) {
      return '${words[1]}';
    } else {
      return text;
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteVColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
            child: Obx(
              () => Column(
                children: [
                  screenHieght(30).ph,
                  CustomBeginMain(text: "My Order"),
                  screenHieght(30).ph,
                  Row(
                    children: [
                      CustomText(
                        text: "#0${widget.model.orderId!}",
                        colortext: AppColors.blacktext,
                      ),
                      SizedBox(
                        width: screenWidth(30),
                      ),
                      CBG(
                          isSide: true,
                          colorBorder: AppColors.greydescriptionList,
                          widthBorder: 0.5,
                          onPressed: () {},
                          width: screenWidth(3.7),
                          hieght: screenHieght(27),
                          shape: BeveledRectangleBorder(),
                          text:
                              "${controller.orderByIdModel.value.orderStatus}",
                          background: AppColors.whitecolor,
                          colorText: AppColors.blacktext),
                    ],
                  ),
                  screenHieght(55).ph,
                  Row(
                    children: [
                      CustomText(
                        text: "Location :",
                        colortext: AppColors.blacktext,
                        fonttext: screenWidth(27),
                      ),
                      CustomText(
                        text: "${controller.orderByIdModel.value.location}",
                        colortext: AppColors.greydescriptionList,
                        fonttext: screenWidth(27),
                      )
                    ],
                  ),
                  screenHieght(60).ph,
                  Row(
                    children: [
                      CustomText(
                        text: "Date :",
                        colortext: AppColors.blacktext,
                        fonttext: screenWidth(27),
                      ),
                      CustomText(
                        text:
                            "${getFirstWords(controller.orderByIdModel.value.date!)}",
                        colortext: AppColors.greydescriptionList,
                        fonttext: screenWidth(27),
                      )
                    ],
                  ),
                  screenHieght(60).ph,
                  Row(
                    children: [
                      CustomText(
                        text: "Time :",
                        colortext: AppColors.blacktext,
                        fonttext: screenWidth(27),
                      ),
                      CustomText(
                        text:
                            "${getTwoWords(controller.orderByIdModel.value.date!)}",
                        colortext: AppColors.greydescriptionList,
                        fonttext: screenWidth(27),
                      )
                    ],
                  ),
                  screenHieght(60).ph,
                  SizedBox(
                      width: screenWidth(1), child: CustomText(text: "Items:")),
                  screenHieght(55).ph,
                  Obx(
                    () => controller.orderListById.length == 0
                        ? SpinKitCircle(
                            color: AppColors.blacktext,
                          )
                        : ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.orderListById.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenHieght(70)),
                                  child: Column(children: [
                                    InkWell(
                                      onTap: () {},
                                      child: CustpmDetailsCotainer(
                                        name: controller
                                            .orderListById[index].name,
                                        color: controller.orderListById[index]
                                            .attributes!.color,
                                        shape: controller.orderListById[index]
                                                .attributes!.boxShape ??
                                            "you don't choose shape",
                                        image: controller
                                            .orderListById[index].mainImage,
                                        price: controller.orderListById[index]
                                                    .discountPrice ==
                                                0
                                            ? controller
                                                .orderListById[index].price
                                                .toString()
                                            : controller.orderListById[index]
                                                .discountPrice
                                                .toString(),
                                      ),
                                    )
                                  ]));
                            }),
                  ),
                  screenHieght(50).ph,
                  Container(
                    width: screenWidth(1),
                    height: screenHieght(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyDotsIndicator)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(40),
                          vertical: screenHieght(30)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Subtotal",
                                colortext: AppColors.blacktext,
                              ),
                              CustomText(
                                text:
                                    "${controller.orderByIdModel.value.price}\$",
                                colortext: AppColors.blacktext,
                              )
                            ],
                          ),
                          screenHieght(50).ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Shipping",
                                colortext: AppColors.blacktext,
                              ),
                              CustomText(
                                text:
                                    "${controller.orderByIdModel.value.shipping}\$",
                                colortext: AppColors.greyDotsIndicator,
                              )
                            ],
                          ),
                          screenHieght(50).ph,
                          Container(
                            width: screenWidth(1),
                            height: screenHieght(400),
                            color: AppColors.blacktext,
                          ),
                          screenHieght(30).ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Total",
                                colortext: AppColors.blacktext,
                              ),
                              CustomText(
                                  text:
                                      "${controller.orderByIdModel.value.totalPrice}\$")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  screenHieght(30).ph,
                  CBG(
                      isSide: false,
                      onPressed: () {
                        controller.reOrder(order_id: widget.model.orderId!);
                      },
                      width: screenWidth(1),
                      hieght: screenHieght(15),
                      shape: BeveledRectangleBorder(),
                      text: tr("re_order"),
                      background: AppColors.blacktext,
                      colorText: AppColors.whitecolor),
                ],
              ),
            )),
      ),
    );
  }
}
