import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/contact_us_view/contact_us_view_controller.dart';
import 'package:get/get.dart';

class CustomTextFormfield extends StatefulWidget {
  const CustomTextFormfield({
    super.key,
    this.label,
    this.hint,
    this.labelColr,
    this.hintColor,
    this.hieght,
    this.radius,
    this.bordercolor,
    this.fillColor,
    this.width,
    this.isborder,
    this.maxline,
    required this.controller,
    required this.text,
    required this.iscount,
    this.validator,
  });
  final String? label;
  final String? hint;
  final Color? labelColr;
  final Color? hintColor;
  final double? hieght;
  final double? radius;
  final Color? bordercolor;
  final Color? fillColor;
  final double? width;
  final String text;
  final bool? isborder;
  final int? maxline;
  final TextEditingController controller;
  final bool iscount;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

int characterCount = 0;

class _CustomTextFormfieldState extends State<CustomTextFormfield> {
  ContactUsViewController controller = Get.put(ContactUsViewController());
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateCharacterCount);
  }

  void _updateCharacterCount() {
    setState(() {
      characterCount = widget.controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.text,
          colortext: AppColors.mainBlackVColor,
        ),
        screenHieght(80).ph,
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          maxLines: widget.maxline,
          decoration: InputDecoration(
              enabled: true,
              fillColor: widget.fillColor,
              labelText: widget.label,
              labelStyle: TextStyle(
                color: widget.labelColr,
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: screenWidth(30), horizontal: screenWidth(40)),
              constraints: BoxConstraints(
                maxHeight: widget.hieght ?? screenHieght(15),
                // maxWidth: maxWidth ?? screenWidth(1.1),
              ),
              hintText: widget.hint,
              hintStyle:
                  TextStyle(color: widget.hintColor, fontSize: screenWidth(25)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 1),
                borderSide: BorderSide(
                    color: widget.isborder!
                        ? widget.bordercolor!
                        : Colors.grey.withOpacity(0.5)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 1),
                  borderSide: BorderSide(
                      color: widget.isborder!
                          ? widget.bordercolor!
                          : Colors.grey.withOpacity(0.5),
                      width: widget.width ?? 1))),
        ),
      ],
    );
  }
}
