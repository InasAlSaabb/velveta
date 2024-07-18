import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_G.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form_message.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_form_field.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/contact_us_view/contact_us_view_controller.dart';
import 'package:get/get.dart';

import '../../shared/custom_widgets/custom_begin_main.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  ContactUsViewController controller = Get.put(ContactUsViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainWhiteVColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: Obx(() {
                return controller.isLoading
                    ? SpinKitCircle(
                        color: AppColors.mainGreyColor,
                      )
                    : Column(
                        children: [
                          screenHieght(18).ph,
                          CustomBeginMain(text: tr("contact_us")),
                          screenHieght(40).ph,
                          SizedBox(
                            width: screenWidth(1),
                            child: CustomText(
                              text: tr("contact_information :"),
                              colortext: AppColors.mainBlackVColor,
                            ),
                          ),
                          screenHieght(80).ph,
                          Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/bxs_phone-call.svg"),
                              screenWidth(30).pw,
                              CustomText(
                                text: controller.contact.value.phone!,
                                fonttext: screenWidth(25),
                              ),
                              SizedBox(
                                width: screenWidth(20),
                              ),
                              SvgPicture.asset(
                                  "assets/images/ic_sharp-email.svg"),
                              screenWidth(30).pw,
                              CustomText(
                                text: controller.contact.value.email ??
                                    "user@gmail.com",
                                fonttext: screenWidth(25),
                              ),
                            ],
                          ),
                          screenHieght(50).ph,
                          Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/carbon_location-filled.svg"),
                              screenWidth(30).pw,
                              CustomText(
                                text: controller.contact.value.phone!,
                                fonttext: screenWidth(25),
                              )
                            ],
                          ),
                          screenHieght(30).ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenWidth(3.5),
                                height: screenHieght(500),
                                decoration: BoxDecoration(
                                    color: AppColors.mainBlackVColor,
                                    border: Border.all(width: 2)),
                              ),
                              CustomText(
                                text: tr("or"),
                                colortext: AppColors.mainBlackVColor,
                              ),
                              Container(
                                width: screenWidth(3.5),
                                height: screenHieght(500),
                                decoration: BoxDecoration(
                                    color: AppColors.mainBlackVColor,
                                    border: Border.all(width: 2)),
                              ),
                            ],
                          ),
                          screenHieght(40).ph,
                          CustomTextFormfield(
                            controller: controller.emailController.value,
                            iscount: false,
                            isborder: false,
                            hieght: screenHieght(15),
                            hintColor:
                                AppColors.mainbackgroundandborderGreyVColor,
                            hint: tr("your_email"),
                            radius: 1,
                            fillColor: AppColors.mainWhiteVColor,
                            text: tr("email"),
                          ),
                          screenHieght(35).ph,
                          CustomFormMessage(
                            iscount: true,
                            controller: controller.messageController.value,
                            isborder: false,
                            hintColor:
                                AppColors.mainbackgroundandborderGreyVColor,
                            hint: tr("your_message"),
                            maxline: 7,
                            hieght: screenHieght(3),
                            radius: 1,
                            fillColor: AppColors.mainWhiteVColor,
                            text: tr("message"),
                            obscureText: false,
                          ),
                          screenHieght(20).ph,
                          CBG(
                              isSide: false,
                              onPressed: () {
                                controller.insertContact();
                              },
                              width: screenWidth(1),
                              hieght: screenHieght(15),
                              shape: BeveledRectangleBorder(),
                              text: tr("send"),
                              background: AppColors.mainBlackVColor,
                              colorText: AppColors.mainWhiteVColor),
                        ],
                      );
              })),
        ));
  }
}
