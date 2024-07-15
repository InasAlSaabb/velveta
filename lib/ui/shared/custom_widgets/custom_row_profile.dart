import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomRowProfile extends StatefulWidget {
  const CustomRowProfile({super.key, this.text});
  final String? text;

  @override
  State<CustomRowProfile> createState() => _CustomRowProfileState();
}

class _CustomRowProfileState extends State<CustomRowProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: widget.text!,
          colortext: AppColors.mainBlackVColor,
          fonttext: screenWidth(25),
          weigthtext: FontWeight.w400,
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.mainBlackVColor,
        ),
      ],
    );
  }
}
