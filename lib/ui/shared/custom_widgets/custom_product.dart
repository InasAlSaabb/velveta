import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomProduct extends StatefulWidget {
  const CustomProduct(
      {super.key,
      this.productname,
      this.productdetail,
      required this.imageurl});
  final String? productname;
  final String? productdetail;
  final String imageurl;
  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(22)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHieght(40),
            ),
            Stack(
              children: [
                CachedNetworkImage(
                    width: screenWidth(1),
                    height: screenHieght(6),
                    imageUrl: widget.imageurl),
              ],
            ),
            SizedBox(
              height: screenHieght(60),
            ),
            Text(
              widget.productname ?? "",
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
            SizedBox(
              height: screenHieght(200),
            ),
            Text(
              widget.productdetail ?? "",
              style: TextStyle(color: AppColors.secondary2GreyVColor),
            ),
            SizedBox(
              height: screenHieght(100),
            ),
            SizedBox(
              height: screenHieght(40),
            ),
          ],
        ),
      ),
    );
  }
}
