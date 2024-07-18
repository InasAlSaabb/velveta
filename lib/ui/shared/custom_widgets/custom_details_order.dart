import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustpmDetailsCotainer extends StatefulWidget {
  const CustpmDetailsCotainer(
      {super.key, this.image, this.name, this.shape, this.color, this.price});
  final String? image;
  final String? name;
  final String? shape;
  final String? color;
  final String? price;
  @override
  State<CustpmDetailsCotainer> createState() => _CustpmDetailsCotainerState();
}

class _CustpmDetailsCotainerState extends State<CustpmDetailsCotainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1),
      height: screenHieght(6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              // spreadRadius: 5, // Spread radius
              blurRadius: 10, // Blur radius
              offset: Offset(0, 6), // Offset in the x,y direction
            ),
          ],
          color: AppColors.mainWhiteVColor,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          screenWidth(30).pw,
          ClipRRect(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: screenWidth(3.5),
              height: screenHieght(1),
              imageUrl: widget.image ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: screenWidth(30),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenHieght(70).ph,
              CustomText(
                text: "${widget.name}",
                fonttext: screenWidth(20),
                colortext: AppColors.blacktext,
              ),
              screenHieght(90).ph,
              Row(
                children: [
                  CustomText(
                    text: tr("shape"),
                    colortext: AppColors.blacktext,
                    fonttext: screenWidth(27),
                  ),
                  CustomText(
                    text: "${widget.shape}",
                    colortext: AppColors.greydescriptionList,
                    fonttext: screenWidth(27),
                  )
                ],
              ),
              Row(
                children: [
                  CustomText(
                    text: tr("color"),
                    colortext: AppColors.blacktext,
                    fonttext: screenWidth(27),
                  ),
                  CustomText(
                    text: "${widget.color}",
                    colortext: AppColors.greydescriptionList,
                    fonttext: screenWidth(27),
                  )
                ],
              ),
              SizedBox(
                height: screenHieght(70),
              ),
              CustomText(
                text: "\$  ${widget.price}",
                weigthtext: FontWeight.bold,
                colortext: AppColors.blacktext,
              ),
            ],
          )
        ],
      ),
    );
  }
}
