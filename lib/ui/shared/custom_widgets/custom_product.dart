import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    height: screenHieght(4),
                    imageUrl: widget.imageurl),
                Positioned(
                  top: 2,
                  right: 2,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 25,
                    child: SvgPicture.asset('assets/images/ic_favorite.svg'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHieght(40),
            ),
            Text(
              widget.productname ?? "",
              style: TextStyle(fontSize: 25, fontFamily: 'Welcome'),
            ),
            SizedBox(
              height: screenHieght(100),
            ),
            Text(widget.productdetail ?? ""),
            SizedBox(
              height: screenHieght(100),
            ),
            CustomButton(text: "Add To Cart", onPressed: () {}),
            SizedBox(
              height: screenHieght(40),
            ),
          ],
        ),
      ),
    );
  }
}
