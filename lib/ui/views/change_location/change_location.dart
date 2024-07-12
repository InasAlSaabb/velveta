import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_radio.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_texti.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/add_address_view/add_address_view.dart';
import 'package:flutter_templete/ui/views/change_location/change_location_controller.dart';
import 'package:flutter_templete/ui/views/checkout_view/checkout_view.dart';
import 'package:get/get.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class ChangeLocationView extends StatefulWidget {
  const ChangeLocationView({super.key});

  @override
  State<ChangeLocationView> createState() => _ChangeLocationViewState();
}

class _ChangeLocationViewState extends State<ChangeLocationView> {
  @override
  void initState() {
    setState(() {
      updatePage();
    });
    super.initState();
  }

  ChangeLocation controller = Get.put(ChangeLocation());
  void updatePage() {
    controller.getAllAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: ListView(children: [
          SizedBox(
            height: screenHieght(18),
          ),
          Row(children: [
            InkWell(
                onTap: () {
                  Get.to(CheckoutView());
                },
                child: SvgPicture.asset('assets/images/arrow_back.svg')),
            SizedBox(
              width: screenWidth(60),
            ),
            Text(
              tr('key_address'),
              style: TextStyle(fontSize: 20),
            ),
          ]),
          SizedBox(
            height: screenHieght(20),
          ),
          Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  controller.addressList.length,
                  (index) {
                    return Slidable(
                      key: ValueKey(controller.addressList[index].id),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              controller.deleteTask(
                                  id: controller.addressList[index].id!);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/Map.svg',
                                  height: screenHieght(30),
                                )
                              ],
                            ),
                            SizedBox(
                              width: screenWidth(40),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.addressList[index].name!}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    CustomTextI(
                                      textColor: Colors.grey,
                                      textAlign: TextAlign.center,
                                      text:
                                          controller.addressList[index].city! +
                                              ",",
                                    ),
                                    CustomTextI(
                                      textColor: Colors.grey,
                                      textAlign: TextAlign.center,
                                      text:
                                          controller.addressList[index].state! +
                                              ",",
                                    ),
                                    CustomTextI(
                                      textColor: Colors.grey,
                                      textAlign: TextAlign.center,
                                      text:
                                          controller.addressList[index].name! +
                                              ",",
                                    ),
                                    CustomTextI(
                                      textColor: Colors.grey,
                                      textAlign: TextAlign.center,
                                      text: controller
                                          .addressList[index].zipCode!,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHieght(100),
                                ),
                              ],
                            ),
                            Spacer(),
                            CustomRadio(
                              selected: controller.collegeId.value,
                              onTaped: (value) {
                                controller.collegeId.value = value!;
                              },
                              value: controller.addressList[index].id!,
                            ),
                            SizedBox(
                              width: screenWidth(20),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
          SizedBox(
            height: screenHieght(15),
          ),
          Container(
            width: screenWidth(1.2),
            height: screenHieght(17),
            decoration: BoxDecoration(
                border: DashedBorder.fromBorderSide(
                    dashLength: 15,
                    strokeCap: StrokeCap.square,
                    side: BorderSide(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid)),
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.off(AddAdressView());
                },
                child: Text(
                  'Add new Address',
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
 // CustomRadio(
              //   selected: controller.collegeId.value,
              //   onTaped: (value) {
              //     controller.collegeId.value = value!;
              //   },
              //   value: controller.specializationList[index][1],
              // ),
              // CustomRadio(value: 2, onTaped: () {}, selected: 0)