import 'package:flutter/material.dart';
import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/Login_view/login_view.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.mainWhiteVColor,
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: Transform.scale(
                    scaleY: 6,
                    scaleX: 3,
                    child: Opacity(
                      opacity: 0.35,
                      child: Image.asset(
                        'assets/images/background.jpg',
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: screenHieght(9),
                    ),
                    Text(
                      tr('key_welcome'),
                      style: TextStyle(
                          fontFamily: 'LOGO',
                          fontSize: AppConfig.defaultLanguage == 'en'
                              ? screenWidth(3)
                              : screenWidth(6)),
                    ),
                    Text(
                      tr('key_to_velveta_shop'),
                      style: TextStyle(
                          fontFamily: 'LOGO',
                          fontSize: AppConfig.defaultLanguage == 'en'
                              ? screenWidth(5)
                              : screenWidth(9)),
                    ),
                    SizedBox(
                      height: screenHieght(7),
                    ),
                    CustomButton(
                        textColor: AppColors.mainWhiteVColor,
                        text: tr('key_login'),
                        onPressed: () {
                          Get.to(LoginView());
                        }),
                    SizedBox(
                      height: screenHieght(20),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 4,
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: screenWidth(35)),
                        Text(
                          tr('key_first_time_using_app'),
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: screenWidth(35)),
                        Expanded(
                          child: Divider(
                            height: 4,
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHieght(20),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpView());
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.transparent),
                        overlayColor:
                            WidgetStateProperty.all<Color>(Colors.transparent),
                        side: WidgetStateProperty.all<BorderSide>(
                          BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        minimumSize: WidgetStateProperty.all<Size>(
                          Size(screenWidth(1.1), screenHieght(15)),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      child: Text(
                        tr('key_create_an_account'),
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHieght(30),
                    ),
                    Text(
                        tr(
                          'key_ccontinue_as_a_vesitor',
                        ),
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            )));
  }
}
