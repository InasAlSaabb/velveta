import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_texti.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomCArtPRoduct extends StatefulWidget {
  const CustomCArtPRoduct({
    super.key,
    this.shape,
    this.color,
    this.price,
    this.imagename,
    this.productName,
  });
  final String? productName;
  final String? shape;
  final String? color;
  final String? price;
  final String? imagename;

  @override
  State<CustomCArtPRoduct> createState() => _CustomCArtPRoductState();
}

class _CustomCArtPRoductState extends State<CustomCArtPRoduct> {
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
          ClipRRect(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: screenWidth(3.5),
              height: screenHieght(1),
              imageUrl: widget.imagename ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: screenWidth(40),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(2.2),
                    child: CustomText(
                      text: widget.productName!,
                      fonttext: screenWidth(30),
                      colortext: AppColors.mainBlackVColor,
                      weigthtext: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomText(
                text: "${tr("shape")}: ${widget.shape!}",
                colortext: AppColors.mainBlackVColor,
                fonttext: screenWidth(27),
              ),
              CustomText(
                text: "${tr("color")}: ${widget.color!}",
                colortext: AppColors.mainBlackVColor,
                fonttext: screenWidth(27),
              ),
              screenHieght(storage.getAppLanguage() == 'en' ? 120 : 140).ph,
              CustomText(
                text: "\$ ${widget.price!}",
                weigthtext: FontWeight.bold,
                colortext: AppColors.mainBlackVColor,
              ),
            ],
          ),
          Column(children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blacktext)),
                height: screenHieght(24),
                width: screenWidth(10),
                child: Icon(Icons.add)),
            Container(
              height: screenHieght(24),
              width: screenWidth(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.blacktext)),
              height: screenHieght(24),
              width: screenWidth(10),
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Delete button action
                },
              ),
            ),
          ])
        ],
      ),
    );
  }
}
