import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/forget_view/forgetpasword_view.dart';
import 'package:flutter_templete/ui/views/resetpassword_view/resetpassword_view.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_view.dart';
import 'package:flutter_templete/ui/views/varification_view/verification_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerfificationView extends StatefulWidget {
  const VerfificationView({super.key, this.email});
  final String? email;
  @override
  State<VerfificationView> createState() => _VerfificationViewState();
}

class _VerfificationViewState extends State<VerfificationView> {
  late VerficationController controller;

  TextEditingController controllerCode = TextEditingController();
  @override
  void initState() {
    controller = Get.put(VerficationController(
      email: widget.email,
    ));
    super.initState();
  }

  int start = 30;
  void startTime() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHieght(20),
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(ForgetPasswordView());
                      },
                      child: SvgPicture.asset('assets/images/arrow_back.svg')),
                  SizedBox(
                    width: screenWidth(60),
                  ),
                  Text(
                    tr('key_otp_code'),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: screenHieght(20),
              ),
              Text(
                'Otp Code',
                style: TextStyle(fontSize: 30, fontFamily: 'Welcome'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'code sent to your email',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    widget.email.toString(),
                    style: TextStyle(
                        fontSize: 15, color: AppColors.secondaryGreyColor),
                  ),
                  SizedBox(
                    width: screenHieght(400),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignUpView());
                    },
                    child: Text(
                      "?Change It",
                      style: TextStyle(
                          fontSize: 15, color: AppColors.secondaryGreyColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHieght(15),
              ),
              PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                appContext: context,
                length: 4,
                obscureText: true,
                obscuringCharacter: '*',
                animationType: AnimationType.slide,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  selectedFillColor: AppColors.mainWhiteColor,
                  inactiveFillColor: AppColors.mainGrey,
                  fieldHeight: screenWidth(7),
                  fieldWidth: screenWidth(5),
                  activeFillColor: AppColors.fillGreyColor,
                  activeColor: AppColors.fillGreyColor,
                  inactiveColor: AppColors.fillGreyColor,
                  selectedColor: AppColors.fillGreyColor,
                  borderWidth: screenWidth(40),
                ),
                cursorColor: AppColors.fillGreyColor,
                hintCharacter: '*',
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: controller.controllerCode,
                onChanged: controller.OnChangedCode,
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");

                  return true;
                },
              ),
              SizedBox(
                height: screenHieght(50),
              ),
              CustomButton(
                  text: 'Reset Password',
                  onPressed: () {
                    // Get.to(ResetPasswordView()
                    // );
                    controller.verfiy();
                  }),
              SizedBox(
                height: screenHieght(50),
              ),
              Center(
                  child: InkWell(
                onTap: () {
                  startTime();

                  controller.sendOtp();
                  setState(() {
                    start = 30;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Resend code '), Text('00:${start}')],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
