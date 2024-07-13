import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomTextIFormField extends StatelessWidget {
  const CustomTextIFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.fillColor,
    required this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.prefixIconColor,
    this.maxHeight,
    this.maxWidth,
    this.suffixIcon,
    this.suffixiconcolor,
  });

  final String hintText;
  final TextEditingController controller;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixiconcolor;

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      cursorColor: AppColors.mainBlackVColor,
      // onChanged: myValidator,
      controller: controller,
      validator: validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixiconcolor,
        prefixIconColor: prefixIconColor,
        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? screenHieght(15),
          maxWidth: maxWidth ?? screenWidth(1.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainbackgroundandborderGreyVColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainbackgroundandborderGreyVColor,
          ),
          // borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
              strokeAlign: 2,
              color: AppColors.mainbackgroundandborderGreyVColor),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: hintTextColor ?? AppColors.secondaryGreyhintVColor,
        ),
        hintText: hintText,
        fillColor: fillColor,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}
