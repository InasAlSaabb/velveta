import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/Login_view/login_view.dart';
import 'package:flutter_templete/ui/views/forget_view/forgetpassword_controller.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_view.dart';
import 'package:flutter_templete/ui/views/varification_view/verification_view.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  ForgetPasswordController controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteVColor,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHieght(30),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child:
                            SvgPicture.asset('assets/images/arrow_back.svg')),
                    SizedBox(
                      width: screenWidth(60),
                    ),
                    Text(
                      tr('key_forget_password'),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: screenHieght(20),
              ),
              Text(
                tr('key_Its_happened._Dont_worry'),
                style: TextStyle(fontSize: 27, fontFamily: 'Welcome'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: screenHieght(30)),
                child: Text(
                  tr('key_Please_write_your_email'),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                tr('key_email'),
                style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHieght(120)),
                child: CustomTextIFormField(
                    hintText: tr('key_email'),
                    controller: controller.email,
                    fillColor: Colors.white,
                    hintTextColor: AppColors.mainbackgroundandborderGreyVColor),
              ),
              SizedBox(
                height: screenHieght(30),
              ),
              CustomButton(
                  textColor: AppColors.mainWhiteVColor,
                  text: tr('key_send_code'),
                  onPressed: () {
                    controller.sendOtp();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
