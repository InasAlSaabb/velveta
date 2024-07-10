import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_circle.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_item.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_switch.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/cart_view/cart_view.dart';
import 'package:flutter_templete/ui/views/product_details/product_controller.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, this.id});
  final int? id;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late ProductController controller;
  @override
  void initState() {
    controller = Get.put(ProductController(
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
                return Stack(
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
                                imageUrl: controller.selecteedym.value),
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
                                      itemCount: controller.Productfeaturelist
                                          .value.images!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            controller.selecteedym.value =
                                                controller.Productfeaturelist
                                                    .value.images![index].path!;
                                          },
                                          child: CachedNetworkImage(
                                            width: screenWidth(7),
                                            height: screenHieght(20),
                                            imageUrl: controller
                                                    .Productfeaturelist
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
                                      setState(() {
                                        isFavorite = !isFavorite;
                                      });
                                    },
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite ? Colors.white : null,
                                    ),
                                  )
                                  //  SvgPicture.asset(
                                  //     'assets/images/ic_favorite.svg'),
                                  ),
                            ),
                            Positioned(
                                top: screenHieght(30),
                                left: screenWidth(40),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: screenHieght(30),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHieght(100),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                              .Productfeaturelist.value.name ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Material: ',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Text(
                                          controller.Productfeaturelist.value
                                                  .material ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
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
                                              backgroundColor:
                                                  AppColors.mainWhiteColor),
                                        ),
                                        Obx(
                                          () => Text(
                                            '${controller.count}',
                                            style: TextStyle(
                                                fontSize: screenWidth(14)),
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
                                  'With Candel :',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth(6),
                                ),
                                CustomSwitch(
                                  switchValue: true,
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHieght(80),
                            ),
                            Text(
                              'BoxShape :',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: screenHieght(100),
                            ),
                            SizedBox(
                              height: screenHieght(30),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: controller.Productfeaturelist.value
                                      .variations?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: screenHieght(12),
                                      child: InkWell(
                                        onTap: () {
                                          controller.selecteedym.value =
                                              controller
                                                  .Productfeaturelist
                                                  .value
                                                  .variations![index]
                                                  .image!;
                                        },
                                        child: Text(
                                          controller
                                              .Productfeaturelist
                                              .value
                                              .variations![index]
                                              .attributes!
                                              .boxShape!,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Colors:',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth(80),
                                ),
                                Text(
                                  controller
                                          .Productfeaturelist
                                          .value
                                          .variations![controller.id!]
                                          .attributes!
                                          .color ??
                                      "",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHieght(140),
                            ),
                            SizedBox(
                              height: screenHieght(20),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.Productfeaturelist.value
                                    .variations!.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      ColorItem(
                                        color: controller
                                            .Productfeaturelist
                                            .value
                                            .variations![index]
                                            .attributes!
                                            .hex!,
                                        isSelected:
                                            controller.selectedColor?.value ==
                                                controller
                                                    .Productfeaturelist
                                                    .value
                                                    .variations![index]
                                                    .attributes!
                                                    .hex!,
                                        onTap: () {
                                          controller.selectedColor?.value =
                                              controller
                                                  .Productfeaturelist
                                                  .value
                                                  .variations![index]
                                                  .attributes!
                                                  .hex!;
                                          controller.selecteedym.value =
                                              controller
                                                  .Productfeaturelist
                                                  .value
                                                  .variations![index]
                                                  .image!;
                                        },
                                      ),
                                      SizedBox(
                                        width: screenWidth(40),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description ',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: screenHieght(60),
                            ),
                            Container(
                              child: ReadMoreText(
                                controller
                                        .Productfeaturelist.value.description ??
                                    "",
                                trimLines: 3,
                                colorClickableText: Colors.blue,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...Read more',
                                lessStyle: TextStyle(color: Colors.green),
                                trimExpandedText: ' Read less',
                                style: TextStyle(fontSize: 15),
                                moreStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: screenHieght(40),
                            ),
                            Text(
                              'Benefits',
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
                                    controller
                                        .Productfeaturelist.value.description!,
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
                                    controller
                                        .Productfeaturelist.value.description!,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth(20)),
                          child: Row(children: [
                            CustomButton(
                                width: screenWidth(2),
                                text: "Add To Cart",
                                onPressed: () {
                                  Get.to(CartVieww());
                                }),
                            SizedBox(
                              width: screenWidth(6),
                            ),
                            Obx(() => Text(
                                  controller.Productfeaturelist.value.price ??
                                      "00",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'welcome'),
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
