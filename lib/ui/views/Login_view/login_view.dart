import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/Login_view/login_controller.dart';
import 'package:flutter_templete/ui/views/forget_view/forgetpasword_view.dart';
import 'package:flutter_templete/ui/views/landing_view/landing_view.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        Get.to(LandingView());
                      },
                      child: SvgPicture.asset('assets/images/arrow_back.svg')),
                  SizedBox(
                    width: screenWidth(60),
                  ),
                  Text(
                    tr('key_login'),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/VELVETA.png',
                height: screenHieght(20),
              ),
            ],
          ),
          SizedBox(
            height: screenHieght(10),
          ),
          Text(
            tr('key_welcome_back_!'),
            style: TextStyle(fontSize: 30, fontFamily: 'Welcome'),
          ),
          SizedBox(
            height: screenHieght(130),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(30)),
            child: Text(
              tr('key_login_with_your_account'),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Text(
            tr('key_email'),
            style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHieght(60)),
            child: CustomTextIFormField(
              hintText: tr('key_email'),
              controller: controller.emailController,
              fillColor: Colors.white,
              hintTextColor: AppColors.secondaryGreyhintVColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            tr('key_password'),
            style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenHieght(60)),
            child: Obx(
              () => CustomTextIFormField(
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
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        ),
                ),
                hintText: tr('key_password'),
                fillColor: Colors.white,
                hintTextColor: AppColors.secondaryGreyhintVColor,
                controller: controller.passwordController,
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool? newValue) {
                      newValue = false;
                    },
                  ),
                  Text(tr('key_rememebr _me')),
                ],
              ),
              InkWell(
                  onTap: () {
                    Get.to(ForgetPasswordView());
                  },
                  child: Text(tr('key_Forgot_Password'))),
            ],
          ),
          SizedBox(
            height: screenHieght(50),
          ),
          CustomButton(
              text: tr('key_login'),
              onPressed: () {
                controller.login();
              }),
          SizedBox(
            height: screenHieght(40),
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(10)),
            child: Row(
              children: [
                Text(
                  tr('key_Don\'nt_have_an_account'),
                  style: TextStyle(
                    color: AppColors.mainblack,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignUpView());
                  },
                  child: Text(
                    tr('key_sign_up'),
                    style: TextStyle(fontSize: 15, fontFamily: 'Welcome'),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
