import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/app/my_app.dart';
import 'package:flutter_templete/core/data/models/apis/token_info.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_begin_main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_G.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_row_profile.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/Login_view/login_view.dart';
import 'package:flutter_templete/ui/views/about_us_view/about_us_view.dart';
import 'package:flutter_templete/ui/views/add_address_view/add_address_view.dart';
import 'package:flutter_templete/ui/views/change_location/change_location.dart';
import 'package:flutter_templete/ui/views/change_location/change_location_controller.dart';
import 'package:flutter_templete/ui/views/contact_us_view/contact_us_view.dart';
import 'package:flutter_templete/ui/views/edit_profile/edit_profile_view.dart';
import 'package:flutter_templete/ui/views/landing_view/landing_view.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view_controller.dart';
import 'package:flutter_templete/ui/views/order_view/my_order_view.dart';
import 'package:flutter_templete/ui/views/policy_view/policy_view.dart';
import 'package:flutter_templete/ui/views/splash_screen/spalsh_screen_view.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String selectedLanguage = 'English';
  RxBool isblur = false.obs;
  ProfileViewController controller = Get.put(ProfileViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            width: screenWidth(1),
            height: screenHieght(1),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                child: Obx(
                  () => Column(
                    children: [
                      screenHieght(18).ph,
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CustomBeginMain(
                          text: tr("user_profile"),
                          onTap: () {
                            // Get.back();
                            // Get.to(ContactUsView());
                            // context.push(LoginView());
                          },
                        ),
                      ),
                      screenHieght(18).ph,
                      SizedBox(
                        width: screenWidth(1),
                        child: Text(
                          controller.profileList.value.firstName ?? 'EnasSaab',
                          style: TextStyle(
                              color: AppColors.mainBlackVColor,
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth(20)),
                        ),
                      ),
                      screenHieght(90).ph,
                      SizedBox(
                        width: screenWidth(1),
                        child: Text(
                          controller.profileList.value.email ??
                              'EnasSaab2233@gmail.com',
                          style: TextStyle(
                              color: AppColors.mainBlackVColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      screenHieght(30).ph,
                      SizedBox(
                        width: screenWidth(1),
                        child: CustomText(
                          text: tr("my_account"),
                          colortext:
                              AppColors.mainbackgroundandborderGreyVColor,
                          fonttext: screenWidth(25),
                        ),
                      ),
                      screenHieght(50).ph,
                      InkWell(
                        onTap: () {
                          context.pushReplace(EditProfileView());
                        },
                        child: CustomRowProfile(
                          text: tr("edit_profile"),
                        ),
                      ),
                      screenHieght(35).ph,
                      InkWell(
                        onTap: () {
                          context.push(ChangeLocationView());
                          // Get.off()
                        },
                        child: CustomRowProfile(
                          text: tr("my_location"),
                        ),
                      ),
                      screenHieght(35).ph,
                      InkWell(
                        onTap: () {
                          showLanguageBottomSheet(context);
                          isblur.value = true; // Show the language bottom sheet
                        },
                        child: CustomRowProfile(
                          text: tr("language"),
                        ),
                      ),
                      screenHieght(35).ph,
                      InkWell(
                        onTap: () {
                          context.pushReplace(MyOrderView());
                        },
                        child: CustomRowProfile(
                          text: tr("my_order"),
                        ),
                      ),
                      screenHieght(35).ph,
                      SizedBox(
                        width: screenWidth(1),
                        child: CustomText(
                          text: tr("support"),
                          colortext:
                              AppColors.mainbackgroundandborderGreyVColor,
                          fonttext: screenWidth(25),
                        ),
                      ),
                      screenHieght(50).ph,
                      InkWell(
                        onTap: () {
                          Get.to(AboutUsView());
                        },
                        child: CustomRowProfile(
                          text: tr("about_us"),
                        ),
                      ),
                      screenHieght(35).ph,
                      InkWell(
                        onTap: () {
                          Get.off(ContactUsView());
                        },
                        child: CustomRowProfile(
                          text: tr("contact_us"),
                        ),
                      ),
                      screenHieght(35).ph,
                      InkWell(
                        onTap: () {
                          // controller.getPolicyinfo();
                          Get.to(PolicyView());
                        },
                        child: CustomRowProfile(
                          text: tr("privacy_policy"),
                        ),
                      ),
                      screenHieght(35).ph,
                      CustomRowProfile(
                        text: tr("term_of_service"),
                      ),
                      SizedBox(
                        height: screenHieght(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            screenWidth(3).pw,
                            InkWell(
                              onTap: () async {
                                await launchUrl(
                                    Uri.parse(controller.instaUrl.value));
                              },
                              child: SvgPicture.asset(
                                'assets/images/instagram.svg',
                                width: screenWidth(13.5),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(17),
                            ),
                            InkWell(
                              onTap: () async {
                                await launchUrl(
                                    Uri.parse(controller.facUrl.value));
                              },
                              child: SvgPicture.asset(
                                'assets/images/facebooke.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHieght(500),
                      ),
                      CBG(
                          isSide: false,
                          onPressed: () {
                            storage.setTokenInfo(TokenInfo(token: null));
                            Get.to(LandingView());
                          },
                          width: screenWidth(1),
                          hieght: screenHieght(15),
                          shape: BeveledRectangleBorder(),
                          text: tr("log_out"),
                          background: AppColors.blacktext,
                          colorText: AppColors.whitecolor),
                    ],
                  ),
                )),
          ),
        ],
      )),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              color: Colors.grey.shade200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  screenHieght(70).ph,
                  Container(
                    height: screenHieght(200),
                    width: screenWidth(3),
                    decoration: BoxDecoration(
                        color: AppColors.greydescriptionList,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  ListTile(
                    title: Text('English'),
                    trailing: Radio<String>(
                      value: 'English',
                      activeColor: AppColors.blacktext,
                      groupValue: selectedLanguage,
                      onChanged: (String? value) {
                        setState(() {
                          selectedLanguage = value!;
                          storage.setAppLanguage('en');
                          Get.updateLocale(getlocal());
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('العربية'),
                    trailing: Radio<String>(
                      activeColor: AppColors.blacktext,
                      value: 'العربية',
                      groupValue: selectedLanguage,
                      onChanged: (String? value) {
                        setState(() {
                          selectedLanguage = value!;
                          storage.setAppLanguage('ar');
                          Get.updateLocale(getlocal());
                        });
                      },
                    ),
                  ),
                  CBG(
                      width: screenWidth(1.1),
                      hieght: screenHieght(20),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      text: tr("save"),
                      background: AppColors.blacktext,
                      colorText: AppColors.whitecolor,
                      onPressed: () {
                        Get.back();
                      },
                      isSide: false),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
