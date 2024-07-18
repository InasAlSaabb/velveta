import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_blur.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_images.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_pop.dart';
import 'package:flutter_templete/ui/views/Login_view/login_view.dart';
import 'package:get/get.dart';

double screenWidth(double percent) {
  return Get.width / percent;
}

double screenHieght(double percent) {
  return Get.height / percent;
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
          decoration: BoxDecoration(
              color: AppColors.mainback.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          width: screenWidth(4),
          height: screenHieght(4),
          child: SpinKitCircle(
            color: AppColors.mainOrangeColor,
          ));
    });

void sendFeedBack({
  Widget? widget,
}) {
  Get.dialog(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.DIALOUG,
      child: Container(
          width: screenWidth(1.1),
          height: screenHieght(2.8),
          decoration: BoxDecoration(
            color: AppColors.mainWhiteVColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.mainBlackVColor,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(20), vertical: screenHieght(55)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHieght(25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    screenWidth(20).pw,
                    CustomImages(
                      imageName: 'Vector',
                      imageSize: screenHieght(8),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHieght(35),
                ),
                Material(
                  child: Text(
                    "Password Change successfully",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: screenHieght(35),
                ),
                CustomButton(
                  textColor: AppColors.mainWhiteVColor,
                  onPressed: () {
                    Get.to(LoginView());
                  },
                  backgroundColor: AppColors.mainBlackVColor,
                  text: "Login",
                ),
              ],
            ),
          )),
    ),
  );
}

void sendFeedBack2({
  Widget? widget,
}) {
  Get.dialog(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.DIALOUG,
      child: Container(
          width: screenWidth(1.1),
          height: screenHieght(2.8),
          decoration: BoxDecoration(
            color: AppColors.mainWhiteVColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.mainBlackVColor,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(20), vertical: screenHieght(55)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHieght(25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    screenWidth(20).pw,
                    CustomImages(
                      imageName: 'Vector',
                      imageSize: screenHieght(8),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHieght(35),
                ),
                CustomButton(
                  textColor: AppColors.mainWhiteVColor,
                  onPressed: () {
                    Get.to(LoginView());
                  },
                  backgroundColor: AppColors.mainBlackVColor,
                  text: "MY ORDER",
                ),
                SizedBox(
                  height: screenHieght(35),
                ),
                CustomButton(
                  borderColor: AppColors.mainBlackVColor,
                  textColor: AppColors.mainBlackVColor,
                  onPressed: () {
                    Get.to(LoginView());
                  },
                  backgroundColor: AppColors.mainWhiteVColor,
                  text: "Back Home",
                ),
              ],
            ),
          )),
    ),
  );
}
