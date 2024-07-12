import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';
import 'package:get/get.dart';

class CustomBeginMain extends StatefulWidget {
  const CustomBeginMain({super.key, required this.text, this.onTap});
  final String text;
  final Function? onTap;

  @override
  State<CustomBeginMain> createState() => _CustomBeginMainState();
}

class _CustomBeginMainState extends State<CustomBeginMain> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // widget.onTap!();
            Get.to(ProfileView());
          },
          child: storage.getAppLanguage() == 'en'
              ? SvgPicture.asset(
                  "assets/images/arrow_back.svg",
                  color: AppColors.mainBlackVColor,
                )
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                  child: SvgPicture.asset(
                    "assets/images/arrow_back.svg",
                    color: AppColors.mainBlackVColor,
                  ),
                ),
        ),
        screenWidth(30).pw,
        CustomText(
          text: widget.text,
          colortext: AppColors.mainBlackVColor,
          fonttext: screenWidth(20),
        ),
      ],
    );
  }
}
