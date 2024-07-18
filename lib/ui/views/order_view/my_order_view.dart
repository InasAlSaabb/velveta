import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_begin_main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_my_order_container.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/my_order_det_view/my_order_details_view.dart';
import 'package:flutter_templete/ui/views/order_view/my_order_view_controllre.dart';
import 'package:get/get.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  MyOrderViewController controller = Get.put(MyOrderViewController());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
        child: ListView(
          shrinkWrap: true,
          children: [
            screenHieght(18).ph,
            CustomBeginMain(
              text: tr("my_order"),
              onTap: () {
                Get.back();
              },
            ),
            screenHieght(18).ph,
            Obx(
              () => ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.OrderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHieght(70)),
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              Get.to(MyOrderDetailsView(
                                  model: controller.OrderList[index]));
                            },
                            child: CustomMyOrderContainer(
                              date: getFirstWords(
                                  controller.OrderList[index].date!),
                              time: getTwoWords(
                                  controller.OrderList[index].date!),
                              price:
                                  controller.OrderList[index].price.toString(),
                              stateButton:
                                  controller.OrderList[index].orderStatus,
                              id: controller.OrderList[index].orderId
                                  .toString(),
                              imagename: controller.OrderList[index].image,
                            ),
                          )
                        ]));
                  }),
            )
          ],
        ),
      )),
    );
  }
}
