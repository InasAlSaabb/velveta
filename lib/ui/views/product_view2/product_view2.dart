import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_circle.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_switch.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/cart_view/cart_view.dart';
import 'package:flutter_templete/ui/views/main_view/cart_view/cart_view.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter_templete/ui/views/product_details/product_controller.dart';
import 'package:flutter_templete/ui/views/product_view2/product_vi2_controller.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductView2 extends StatefulWidget {
  const ProductView2({super.key, this.id});
  final int? id;

  @override
  State<ProductView2> createState() => _ProductView2State();
}

class _ProductView2State extends State<ProductView2> {
  HomeController cc = Get.put(HomeController());
  late ProductView2Controller controller;
  @override
  void initState() {
    controller = Get.put(ProductView2Controller(
      id: widget.id,
    ));
    super.initState();
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Obx(
              () {
                return controller.isLoading
                    ? SpinKitCircle(
                        color: AppColors.mainGreyColor,
                      )
                    : Stack(
                        children: [
                          ListView(children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black))),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      width: screenWidth(1),
                                      height: screenHieght(3),
                                      imageUrl: controller.selecteeedym.value),
                                  Obx(() {
                                    return Positioned(
                                      top: screenHieght(3.4),
                                      left: screenWidth(2.9),
                                      right: screenWidth(8),
                                      child: SizedBox(
                                        height: screenHieght(25),
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .Productfeatureelist
                                                .value
                                                .images!
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  controller
                                                          .selecteeedym.value =
                                                      controller
                                                          .Productfeatureelist
                                                          .value
                                                          .images![index]
                                                          .path!;
                                                },
                                                child: CachedNetworkImage(
                                                  width: screenWidth(7),
                                                  height: screenHieght(20),
                                                  imageUrl: controller
                                                          .Productfeatureelist
                                                          .value
                                                          .images![index]
                                                          .path ??
                                                      " ",
                                                ),
                                              );
                                            }),
                                      ),
                                    );
                                  }),
                                  Positioned(
                                    top: screenHieght(34),
                                    right: screenWidth(40),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        maxRadius: 25,
                                        child: IconButton(
                                          onPressed: () {
                                            controller.isFavorite.value =
                                                !controller.isFavorite.value;
                                            controller.addtofav(
                                                product_id: controller.id!,
                                                variation_id: 29);
                                          },
                                          icon: Icon(
                                            controller.isFavorite.value
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: controller.isFavorite.value
                                                ? AppColors.mainWhiteVColor
                                                : AppColors.mainWhiteVColor,
                                          ),
                                        )
                                        //  SvgPicture.asset(
                                        //     'assets/images/ic_favorite.svg'),
                                        ),
                                  ),
                                  Positioned(
                                      top: screenHieght(30),
                                      left: screenWidth(40),
                                      child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: screenHieght(30),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHieght(100),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth(40)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.Productfeatureelist.value
                                                    .name ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                tr('key_material'),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                controller.Productfeatureelist
                                                        .value.material ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  controller.changeCount(false);
                                                },
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    shape: CircleBorder(),
                                                    backgroundColor: AppColors
                                                        .mainWhiteColor),
                                              ),
                                              Obx(
                                                () => Text(
                                                  '${controller.count}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth(14)),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  controller.changeCount(true);
                                                },
                                                child: Text(
                                                  '+',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.mainWhiteColor,
                                                  shape: CircleBorder(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHieght(150),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        tr('key_Colors'),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth(80),
                                      ),
                                      Text(
                                        controller.Productfeatureelist.value
                                            .variations![0].attributes!.color!,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHieght(80),
                            ),
                            Container(
                              decoration: BoxDecoration(color: Colors.black),
                              width: screenWidth(1),
                              height: screenHieght(500),
                            ),
                            SizedBox(
                              height: screenHieght(60),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tr('key_Description'),
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHieght(60),
                                  ),
                                  Container(
                                    child: ReadMoreText(
                                      controller.Productfeatureelist.value
                                              .description ??
                                          "",
                                      trimLines: 3,
                                      colorClickableText: Colors.blue,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: '...Read more',
                                      lessStyle: TextStyle(color: Colors.green),
                                      trimExpandedText: ' Read less',
                                      style: TextStyle(fontSize: 15),
                                      moreStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHieght(40),
                                  ),
                                  Text(
                                    tr('key_Benefits'),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: screenHieght(60),
                                  ),
                                  Row(
                                    children: [
                                      CheckCircleWidget(),
                                      SizedBox(
                                        width: screenWidth(50),
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.Productfeatureelist.value
                                              .description!,
                                          overflow: TextOverflow.clip,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHieght(60),
                                  ),
                                  Row(
                                    children: [
                                      CheckCircleWidget(),
                                      SizedBox(
                                        width: screenWidth(50),
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.Productfeatureelist.value
                                              .description!,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHieght(2),
                            )
                          ]),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth(20)),
                                child: Row(children: [
                                  CustomButton(
                                      textColor: AppColors.mainWhiteVColor,
                                      width: screenWidth(2),
                                      text: tr('key_add_to_cart'),
                                      onPressed: () {
                                        Get.to(CartVieww());
                                      }),
                                  SizedBox(
                                    width: screenWidth(6),
                                  ),
                                  Obx(() => Text(
                                        controller.Productfeatureelist.value
                                                .price ??
                                            "00",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'welcome'),
                                      ))
                                ]),
                              ),
                              color: Colors.white,
                              width: screenWidth(1),
                              height: screenHieght(10),
                            ),
                          )
                        ],
                      );
              },
            )));
  }
}
