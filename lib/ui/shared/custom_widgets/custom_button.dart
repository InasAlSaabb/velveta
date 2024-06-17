import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.ImageName,
    this.width,
    this.hieght,
  });

  final String text;
  final String? ImageName;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressed;
  final double? width;
  final double? hieght;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: borderColor != null
            ? BorderSide(
                width: 2.0,
                color: borderColor!,
              )
            : null,
        backgroundColor: backgroundColor ?? AppColors.secondarytextBlackVColor,
        fixedSize: Size(width ?? screenWidth(1.1), hieght ?? screenHieght(15)),
      ),
    );
  }
}
