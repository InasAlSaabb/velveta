import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashSceenView extends StatefulWidget {
  const SplashSceenView({super.key});
  @override
  State<SplashSceenView> createState() => _SplashSceenViewState();
}

class _SplashSceenViewState extends State<SplashSceenView> {
  SplashSceenController controller = Get.put(SplashSceenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.passthrough,
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/VELVETA.png',
                  width: screenWidth(1.5),
                  height: screenHieght(1.5),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: screenWidth(4)),
                  height: screenWidth(12),
                  width: screenWidth(14),
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.mainWhiteColor,
                    color: AppColors.maaingreeydark,
                  ),
                ),
              ],
            )));
  }
}
