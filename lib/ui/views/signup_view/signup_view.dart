import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/Login_view/login_view.dart';
import 'package:flutter_templete/ui/views/landing_view/landing_view.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_controller.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                    tr('key_create_an_account'),
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
            height: screenHieght(50),
          ),
          Text(
            'Welcome !',
            style: TextStyle(fontSize: 30, fontFamily: 'Welcome'),
          ),
          SizedBox(
            height: screenHieght(150),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(40)),
            child: Text(
              'Create Account At Our App',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Text(
            'First Name',
            style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHieght(100)),
            child: CustomTextFormField(
                hintText: 'First Name',
                controller: controller.firstname,
                fillColor: Colors.white,
                hintTextColor: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Last Name',
            style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenHieght(100)),
            child: CustomTextFormField(
                hintText: 'Last Name',
                controller: controller.secondname,
                fillColor: Colors.white,
                hintTextColor: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHieght(100)),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHieght(100)),
            child: CustomTextFormField(
                hintText: 'Email',
                controller: controller.email,
                fillColor: Colors.white,
                hintTextColor: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Password',
            style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsetsDirectional.only(top: screenHieght(100)),
              child: CustomTextFormField(
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
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        ),
                ),
                hintText: 'Password',
                fillColor: AppColors.mainWhiteColor,
                hintTextColor: Colors.black,
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
            'Confirm Password',
            style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsetsDirectional.only(top: screenHieght(100)),
              child: CustomTextFormField(
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
                hintText: 'Confirm password',
                fillColor: AppColors.mainWhiteColor,
                hintTextColor: Colors.black,
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
            height: screenHieght(40),
          ),
          CustomButton(
              text: 'Create Account',
              onPressed: () {
                controller.register();
              }),
          SizedBox(
            height: screenHieght(40),
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(6)),
            child: Row(
              children: [
                Text(
                  'have An Account?  ',
                  style: TextStyle(
                    color: AppColors.mainblack,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(LoginView());
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 18, fontFamily: 'Welcome'),
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
