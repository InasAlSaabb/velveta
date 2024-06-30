import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/slider_model.dart';
import 'package:flutter_templete/core/data/models/sliderr_model.dart';
import 'package:get/get.dart';
import '../colors.dart';
import '../utils.dart';

class CustomSlider extends StatefulWidget {
  final List<SliderrModel> items;
  final double? imageHeight;
  final Function? onTap;

  const CustomSlider({
    Key? key,
    required this.items,
    this.imageHeight,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  RxInt currentIndex = 0.obs;

  void previousSlide() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void nextSlide() {
    if (currentIndex.value < widget.items.length - 1) {
      currentIndex.value++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.items.map((item) {
            return Container(
              width: double.infinity,
              child: Center(
                child: InkWell(
                  onTap: () {
                    if (widget.onTap != null) widget.onTap!();
                  },
                  child: Obx(() {
                    final currentItem = widget.items[currentIndex.value];
                    return CachedNetworkImage(
                      imageUrl: currentItem.image ?? "",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  }),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            // aspectRatio: 3.0,
            // enlargeCenterPage: true,
            height: widget.imageHeight ?? screenWidth(2.7),
            reverse: true,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: false,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth(16),
                height: screenHieght(16),
                color: Colors.black26,
                child: Center(
                  child: IconButton(
                    iconSize: screenWidth(24),
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      previousSlide();
                    },
                  ),
                ),
              ),
              Container(
                width: screenWidth(16),
                height: screenHieght(16),
                color: Colors.black26,
                child: Center(
                  child: IconButton(
                      iconSize: screenWidth(24),
                      color: Colors.white,
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        nextSlide();
                      }),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () {
            print(currentIndex);
            return Positioned(
              bottom: screenHieght(150),
              left: screenWidth(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.items.map((item) {
                  int index = widget.items.indexOf(item);
                  return Container(
                    width: screenWidth(7),
                    height: screenWidth(200),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth(65)),
                    decoration: BoxDecoration(
                      color: currentIndex.value == index
                          ? AppColors.mainWhiteColor
                          : AppColors.mainGrey,
                      border: Border.all(
                        color: currentIndex.value == index
                            ? AppColors.mainWhiteColor
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
