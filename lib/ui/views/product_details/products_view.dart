import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_circle.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_item.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_switch.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:flutter_templete/ui/views/main_view/cart_view/cart_view.dart';
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
    update();
    super.initState();
  }

  bool isFavorite = false;

  Cartcontroller cc = Get.put(Cartcontroller());
  void update() {
    cc.getCart();
  }

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
                                      imageUrl: controller.selecteedym.value),
                                  Obx(() {
                                    return Positioned(
                                      top: screenHieght(3.4),
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: SizedBox(
                                          height: screenHieght(25),
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .Productfeaturelist
                                                  .value
                                                  .variations!
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    controller
                                                            .selecteedym.value =
                                                        controller
                                                            .Productfeaturelist
                                                            .value
                                                            .variations![index]
                                                            .image!;
                                                  },
                                                  child: CachedNetworkImage(
                                                    width: screenWidth(7),
                                                    height: screenHieght(20),
                                                    imageUrl: controller
                                                        .Productfeaturelist
                                                        .value
                                                        .variations![index]
                                                        .image!,
                                                  ),
                                                );
                                              }),
                                        ),
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
                                            controller.add(
                                                product_id: controller.id!,
                                                variation_id: controller
                                                    .selectedVargroup.value);
                                          },
                                          icon: Icon(
                                            controller.isFavorite.value
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: controller.isFavorite.value
                                                ? AppColors.mainWhiteVColor
                                                : AppColors.mainWhiteVColor,
                                          ),
                                        )),
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
                                  horizontal: screenWidth(20)),
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
                                          Row(
                                            children: [
                                              Text(
                                                tr('key_material'),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(width: screenWidth(20)),
                                              DropdownButton<int>(
                                                value: controller
                                                    .selectedMaterialIndex
                                                    .value,
                                                items: List.generate(
                                                  controller
                                                      .mattt
                                                      .value
                                                      .attributesGrouped!["4"]!
                                                      .length,
                                                  (index) =>
                                                      DropdownMenuItem<int>(
                                                    value: index,
                                                    child: Text(
                                                      controller
                                                              .mattt
                                                              .value
                                                              .attributesGrouped![
                                                                  "4"]![index]
                                                              .name ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                onChanged: (int? newIndex) {
                                                  if (newIndex != null) {
                                                    String materialId =
                                                        controller
                                                            .mattt
                                                            .value
                                                            .attributesGrouped![
                                                                "4"]![newIndex]
                                                            .id
                                                            .toString();
                                                    controller.materilaidd
                                                        .value = materialId;
                                                    controller
                                                        .selectedMaterialIndex
                                                        .value = newIndex;
                                                    controller.getshapeformat(
                                                        id: controller.id!,
                                                        mat: materialId);
                                                  }
                                                },
                                              )
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
                                                  controller.changecount(false);
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
                                                  controller.changecount(true);
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
                                        tr('key_With Candel'),
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
                                    tr('key_BoxShape'),
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
                                        itemCount: controller.getshape.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: screenWidth(4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: controller
                                                                  .selectedshape
                                                                  .value ==
                                                              controller
                                                                  .getshape[
                                                                      index]
                                                                  .id
                                                          ? AppColors.blacktext
                                                          : AppColors
                                                              .mainWhiteVColor)),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.selectedshape
                                                            .value =
                                                        controller
                                                            .getshape[index]
                                                            .id!;
                                                    controller.getcolor(
                                                        id: controller.id!,
                                                        mat: controller
                                                            .materilaidd.value,
                                                        shape: controller
                                                            .selectedshape
                                                            .value);
                                                  },
                                                  child: Text(
                                                    controller.getshape[index]
                                                            .name ??
                                                        " ",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
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
                                      Obx(() => Text(
                                            controller.selectedColorname.value,
                                            style: TextStyle(fontSize: 20),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHieght(140),
                                  ),
                                  SizedBox(
                                    height: screenHieght(20),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.getcolorr.length,
                                      itemBuilder: (context, index) {
                                        return controller.getcolorr.isEmpty
                                            ? Text('choose shape first')
                                            : InkWell(
                                                onTap: () {
                                                  controller.selectedColorname
                                                          .value =
                                                      controller
                                                          .getcolorr[index]
                                                          .name!;
                                                  controller.selectedIndexcolor
                                                      .value = index;
                                                  controller.getVariation(
                                                      id: controller.id!,
                                                      color_id: controller
                                                          .getcolorr[index].id!,
                                                      material_id: controller
                                                          .materilaidd.value,
                                                      shape_id: controller
                                                          .selectedshape.value);
                                                },
                                                child: Container(
                                                  width: screenWidth(15),
                                                  height: screenWidth(15),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                        '0xFF${controller.getcolorr[index].hex!.substring(1)}')),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: controller
                                                                  .selectedIndexcolor
                                                                  .value ==
                                                              index
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 2, 2, 2)
                                                          : Colors.transparent,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: controller
                                                              .selectedIndexcolor
                                                              .value ==
                                                          index
                                                      ? Icon(Icons.check,
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          size: 15)
                                                      : null,
                                                ),
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
                                      controller.Productfeaturelist.value
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
                                          controller.Productfeaturelist.value
                                                  .description ??
                                              "",
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
                                          controller.Productfeaturelist.value
                                                  .description ??
                                              "",
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
                            child: cc.cartProductList.length == 0
                                ? Container(
                                    color: Colors.white,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth(20)),
                                        child: Row(children: [
                                          CustomButton(
                                              textColor:
                                                  AppColors.mainWhiteVColor,
                                              width: screenWidth(2),
                                              text: tr('key_add_to_cart'),
                                              onPressed: () {
                                                controller.addToCart(
                                                    id: controller.id,
                                                    variation_id: controller
                                                        .selectedVargroup.value,
                                                    quantity:
                                                        controller.count.value,
                                                    has_candel: 0);
                                                // Get.to(CartVieww());
                                                cc.getCart();
                                              }),
                                          SizedBox(
                                            width: screenWidth(6),
                                          ),
                                          Obx(
                                            () => Text(
                                              controller.selectedVPriceroup
                                                          .value ==
                                                      0
                                                  ? controller
                                                      .Productfeaturelist
                                                      .value
                                                      .price
                                                      .toString()
                                                  : controller
                                                      .selectedVPriceroup.value
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'welcome'),
                                            ),
                                          )
                                        ])))
                                : SizedBox(
                                    height: screenHieght(40),
                                    child: Container(
                                      width: screenWidth(1),
                                      height: screenHieght(40),
                                      decoration: BoxDecoration(
                                          color: AppColors.blacktext),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'welcome',
                                                  color: AppColors
                                                      .mainWhiteVColor),
                                              '${cc.cartProductList.length} item'),
                                          InkWell(
                                            onTap: () {
                                              Get.off(CartVieww());
                                            },
                                            child: Text(
                                              "View Cart",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'welcome',
                                                  color: AppColors
                                                      .mainWhiteVColor),
                                            ),
                                          ),
                                          Text(
                                            controller.selectedVPriceroup
                                                        .value ==
                                                    0
                                                ? controller.Productfeaturelist
                                                    .value.price
                                                    .toString()
                                                : controller
                                                    .selectedVPriceroup.value
                                                    .toString(),
                                            style: TextStyle(
                                                color:
                                                    AppColors.mainWhiteVColor,
                                                fontSize: 20,
                                                fontFamily: 'welcome'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            width: screenWidth(1),
                            height: screenHieght(10),
                          ),
                        ],
                      );
              },
            )));
  }
}
