import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
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
                          Get.to(LoginView());
                        },
                        child:
                            SvgPicture.asset('assets/images/arrow_back.svg')),
                    SizedBox(
                      width: screenWidth(60),
                    ),
                    Text(
                      tr('key_login'),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: screenHieght(20),
              ),
              Text(
                'It\'s happened . Don\'t Worry',
                style: TextStyle(fontSize: 27, fontFamily: 'Welcome'),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: screenHieght(30)),
                child: Text(
                  'Please Write Your Email Bellow To Send Code In It',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                'Email',
                style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHieght(60)),
                child: CustomTextIFormField(
                    hintText: 'Email',
                    controller: controller.email,
                    fillColor: Colors.white,
                    hintTextColor: Colors.black),
              ),
              SizedBox(
                height: screenHieght(50),
              ),
              CustomButton(
                  text: 'Send',
                  onPressed: () {
                    controller.sendOtp();
                    // Get.to(VerfificationView(
                    //   email: controller.email.text,
                    // ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
