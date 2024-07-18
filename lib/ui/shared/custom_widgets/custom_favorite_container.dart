import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomFavoriteContainer extends StatefulWidget {
  const CustomFavoriteContainer(
      {super.key,
      this.shape,
      this.color,
      this.price,
      this.imagename,
      this.productName,
      required this.deletfavor});
  final String? productName;
  final String? shape;
  final String? color;
  final String? price;
  final String? imagename;
  final VoidCallback deletfavor;

  @override
  State<CustomFavoriteContainer> createState() =>
      _CustomFavoriteContainerState();
}

String getFirstTwoWords(String text) {
  List<String> words = text.split(' ');
  if (words.length >= 2) {
    return '${words[0]} ${words[1]}';
  } else {
    return text;
  }
}

class _CustomFavoriteContainerState extends State<CustomFavoriteContainer> {
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
          // screenWidth(30).pw,
          // SvgPicture.asset(
          //   "assets/images/${widget.imagename!}.svg",
          //   height: screenHeight(8),
          //   fit: BoxFit.cover,
          // ),
          ClipRRect(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: screenWidth(4),
              height: screenHieght(1),
              imageUrl: widget.imagename ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: screenWidth(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenHieght(70).ph,
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(1.8),
                    child: CustomText(
                      text: getFirstTwoWords(widget.productName!),
                      fonttext: screenWidth(30),
                      colortext: AppColors.mainBlackVColor,
                      weigthtext: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.deletfavor();
                    },
                    child: Icon(
                      Icons.favorite_rounded,
                      color: AppColors.mainBlackVColor,
                      size: screenWidth(15),
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
              screenHieght(storage.getAppLanguage() == 'en' ? 60 : 140).ph,
              CustomText(
                text: "\$ ${widget.price!}",
                weigthtext: FontWeight.bold,
                colortext: AppColors.mainBlackVColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
