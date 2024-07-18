import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/enums/order_state.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_G.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CustomMyOrderContainer extends StatefulWidget {
  const CustomMyOrderContainer(
      {super.key,
      this.productName,
      this.shape,
      this.color,
      this.price,
      this.imagename,
      this.id,
      this.date,
      this.time,
      this.stateButton});

  final String? productName;
  final String? shape;
  final String? color;
  final String? price;
  final String? imagename;
  final String? id;
  final String? date;
  final String? time;
  final String? stateButton;
  @override
  State<CustomMyOrderContainer> createState() => _CustomMyOrderContainerState();
}

Rx<OrderStateEnum> state = OrderStateEnum.DEFAULT.obs;

void updateState(stateButton) {
  if (stateButton.toLowerCase().contains('completed')) {
    state.value = OrderStateEnum.COMPLETED;
  } else if (stateButton.toLowerCase().contains('deciling')) {
    state.value = OrderStateEnum.DECILING;
  } else if (stateButton.toLowerCase().contains('pending')) {
    state.value = OrderStateEnum.PANDING;
  } else if (stateButton.toLowerCase().contains('on way')) {
    state.value = OrderStateEnum.ONWAY;
  }
}

class _CustomMyOrderContainerState extends State<CustomMyOrderContainer> {
  @override
  @override
  void initState() {
    updateState(widget.stateButton);
    super.initState();
  }

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
          // screenWidth(3).pw,
          // SvgPicture.asset(
          //   "assets/images/${widget.imagename}.png",
          //   height: screenHieght(8),
          //   fit: BoxFit.cover,
          // ),
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
          // CachedNetworkImage(imageUrl: "${widget.imagename}"),
          SizedBox(
            width: screenWidth(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenHieght(70).ph,
              // CustomText(
              //   text: "Chocalet",
              //   fonttext: screenWidth(20),
              //   colortext: AppColors.blacktext,
              // ),
              // screenHieght(200).ph,
              // CustomText(
              //   text: "${tr("shape")}: ${widget.shape}",
              //   colortext: AppColors.blacktext,
              //   fonttext: screenWidth(27),
              // ),
              // CustomText(
              //   text: "${tr("color")}: ${widget.color}",
              //   colortext: AppColors.blacktext,
              //   fonttext: screenWidth(27),
              // ),
              CustomText(
                text: "#0${widget.id}",
                colortext: AppColors.blacktext,
                fonttext: screenWidth(23),
                weigthtext: FontWeight.w500,
              ),
              screenHieght(70).ph,
              CustomText(
                text: " ${widget.date}",
                colortext: AppColors.blacktext,
                fonttext: screenWidth(28),
              ),
              CustomText(
                text: "${widget.time}  ",
                colortext: AppColors.blacktext,
                fonttext: screenWidth(28),
              ),
              Spacer(),
              screenHieght(storage.getAppLanguage() == 'en' ? 70 : 140).ph,
              CustomText(
                text: "\$  ${widget.price}",
                weigthtext: FontWeight.bold,
                colortext: AppColors.blacktext,
              ),
            ],
          ),
          Column(
            children: [
              // screenHieght(100).ph,
              // Row(
              //   children: [
              //     screenWidth(4.5).pw,
              //     CustomText(
              //       text: "#0${widget.id}",
              //       colortext: Colors.grey,
              //       fonttext: screenWidth(30),
              //     ),
              //   ],
              // ),
              // CustomText(
              //   text: "${widget.date}  ${widget.time}",
              //   colortext: Colors.grey,
              //   fonttext: screenWidth(30),
              // ),
              screenHieght(10).ph,
              Row(
                children: [
                  SizedBox(
                    width: screenWidth(30),
                  ),
                  CBG(
                      isSide: true,
                      colorBorder: state.value == OrderStateEnum.DECILING
                          ? AppColors.redcolor
                          : state.value == OrderStateEnum.PANDING
                              ? AppColors.greycolor
                              : state.value == OrderStateEnum.ONWAY
                                  ? AppColors.blacktext
                                  : AppColors.blacktext,
                      widthBorder: 0.5,
                      onPressed: () {},
                      width: screenWidth(4.2),
                      hieght: screenWidth(90),
                      shape: ContinuousRectangleBorder(),
                      text: widget.stateButton!,
                      fontText: screenWidth(30),
                      background: state.value == OrderStateEnum.COMPLETED
                          ? AppColors.blacktext
                          : AppColors.whitecolor,
                      colorText: state.value == OrderStateEnum.COMPLETED
                          ? AppColors.whitecolor
                          : state.value == OrderStateEnum.DECILING
                              ? AppColors.redcolor
                              : state.value == OrderStateEnum.PANDING
                                  ? AppColors.greydescriptionList
                                  : state.value == OrderStateEnum.ONWAY
                                      ? AppColors.blacktext
                                      : AppColors.blacktext),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
