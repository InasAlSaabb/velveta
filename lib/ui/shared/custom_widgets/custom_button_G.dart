import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CBG extends StatefulWidget {
  const CBG(
      {super.key,
      required this.width,
      required this.hieght,
      required this.text,
      required this.background,
      required this.colorText,
      this.shape,
      this.colorBorder,
      this.widthBorder,
      this.fontText,
      this.weight,
      required this.onPressed,
      required this.isSide});
  final double width;
  final double hieght;
  final String text;
  final Color background;
  final Function onPressed;
  final Color colorText;
  final OutlinedBorder? shape;
  final Color? colorBorder;
  final double? widthBorder;
  final double? fontText;
  final FontWeight? weight;
  final bool isSide;

  @override
  State<CBG> createState() => _CBGState();
}

class _CBGState extends State<CBG> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      child: Text(
        widget.text,
        style: TextStyle(
            color: widget.colorText,
            fontSize: widget.fontText ?? screenWidth(25),
            fontWeight: widget.weight ?? FontWeight.normal),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(widget.width, widget.hieght),
          backgroundColor: widget.background,
          shape: widget.shape!,
          side: widget.isSide
              ? BorderSide(
                  color: widget.colorBorder!, width: widget.widthBorder!)
              : BorderSide.none),
    );
  }
}
