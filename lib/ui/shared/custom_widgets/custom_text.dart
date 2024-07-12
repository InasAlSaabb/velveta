import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomText extends StatefulWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.colortext,
      this.fonttext,
      this.weigthtext});
  final String text;
  final Color? colortext;
  final double? fonttext;
  final FontWeight? weigthtext;
  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.text}",
      style: TextStyle(
          color: widget.colortext,
          fontSize: widget.fonttext ?? screenWidth(20),
          fontWeight: widget.weigthtext),
    );
  }
}
