import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:flutter_templete/ui/views/resetpassword_view/resetpassword_controller.dart';
import 'package:flutter_templete/ui/views/varification_view/verification_view.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, this.email});
  final String? email;
  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late ResetPasswordController controller;
  @override
  void initState() {
    controller = Get.put(ResetPasswordController(
      email: widget.email,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.mainWhiteVColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: screenHieght(18),
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(VerfificationView());
                    },
                    child: SvgPicture.asset('assets/images/arrow_back.svg')),
                SizedBox(
                  width: screenWidth(60),
                ),
                Text(
                  tr('key_reset_password'),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: screenHieght(20),
            ),
            Text(
              tr('reset_password'),
              style: TextStyle(fontSize: 30, fontFamily: 'Welcome'),
            ),
            SizedBox(
              height: screenHieght(200),
            ),
            Text(
              tr('key_please enter new password'),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              tr('key_password'),
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsetsDirectional.only(top: screenHieght(100)),
                child: CustomTextIFormField(
                  obscureText: !controller.passwordVisible.value,
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.hidePassword(
                        password: controller.passwordVisible,
                        value: controller.passwordVisible.value,
                      );
                    },
                    child: controller.passwordVisible.value
                        ? Icon(
                            Icons.visibility,
                            color: AppColors.mainbackgroundandborderGreyVColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: AppColors.mainbackgroundandborderGreyVColor,
                          ),
                  ),
                  hintText: tr('key_password'),
                  fillColor: AppColors.mainWhiteColor,
                  hintTextColor: AppColors.mainbackgroundandborderGreyVColor,
                  controller: controller.password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please check your password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              tr('key_confirm_password'),
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsetsDirectional.only(top: screenHieght(100)),
                child: CustomTextIFormField(
                  obscureText: !controller.passwordVisible2.value,
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.hidePassword2(
                        password: controller.passwordVisible2,
                        value: controller.passwordVisible2.value,
                      );
                    },
                    child: controller.passwordVisible2.value
                        ? Icon(
                            Icons.visibility,
                            color: AppColors.mainbackgroundandborderGreyVColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: AppColors.mainbackgroundandborderGreyVColor,
                          ),
                  ),
                  hintText: tr('key_confirm_password'),
                  fillColor: AppColors.mainWhiteColor,
                  hintTextColor: AppColors.mainbackgroundandborderGreyVColor,
                  controller: controller.confirmpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please check your confirm password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: screenHieght(50),
            ),
            CustomButton(
                textColor: AppColors.mainWhiteVColor,
                text: tr('reset_password'),
                onPressed: () {
                  controller.reset();
                  // Get.to(MainView());
                }),
          ]),
        ),
      ),
    );
  }
}
