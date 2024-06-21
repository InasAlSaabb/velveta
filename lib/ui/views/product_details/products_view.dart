import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/product_id_model.dart';
import 'package:flutter_templete/core/data/models/products_by_id_model.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_circle.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_item.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_product.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_switch.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/cart_view/cart_view.dart';
import 'package:flutter_templete/ui/views/product_details/product_controller.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, this.model});
  final ProductsByIDModel? model;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(children: [
            SizedBox(
              height: screenHieght(20),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    width: screenWidth(1),
                    height: screenHieght(3),
                    imageUrl: widget.model!.mainImage ?? "",
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      maxRadius: 25,
                      child: SvgPicture.asset('assets/images/ic_favorite.svg'),
                    ),
                  ),
                  Positioned(top: 2, left: 2, child: Icon(Icons.arrow_back))
                ],
              ),
            ),
            SizedBox(
              height: screenHieght(40),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.model!.name ?? "",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Material : Microfber',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
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
                                      color: Colors.grey, fontSize: 20),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: AppColors.mainWhiteColor),
                              ),
                              Obx(
                                () => Text(
                                  '${controller.count}',
                                  style: TextStyle(fontSize: screenWidth(14)),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.changeCount(true);
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainWhiteColor,
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
                    height: screenHieght(80),
                  ),
                  Row(
                    children: [
                      Text(
                        'With Candel :',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(20),
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
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: screenHieght(80),
                  ),
                  SizedBox(
                    height: screenHieght(40),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.shapes.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Row(
                            children: [
                              Text(
                                controller.shapes[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth(20),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHieght(40),
                  ),
                  Row(
                    children: [
                      Text(
                        'Colors:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Gold',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHieght(60),
                  ),
                  SizedBox(
                    height: screenHieght(20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.colors.length,
                      itemBuilder: (context, index) {
                        final color = controller.colors[index];
                        final isSelected = color == controller.selectedColor;
                        return ColorItem(
                          color: color,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              controller.selectedColor =
                                  isSelected ? null : color;
                            });
                          },
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
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
                    padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                    child: ReadMoreText(
                      widget.model!.description ?? "",
                      trimLines: 3,
                      colorClickableText: Colors.blue,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '...Read more',
                      lessStyle: TextStyle(color: Colors.green),
                      trimExpandedText: ' Read less',
                      style: TextStyle(fontSize: 15),
                      moreStyle: TextStyle(fontWeight: FontWeight.bold),
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
                        width: screenWidth(20),
                      ),
                      Text(
                          overflow: TextOverflow.clip,
                          'venenattum quisque vestibulum praesent \na adipiscing m ')
                    ],
                  ),
                  SizedBox(
                    height: screenHieght(60),
                  ),
                  Row(
                    children: [
                      CheckCircleWidget(),
                      SizedBox(
                        width: screenWidth(20),
                      ),
                      Text('s vel st a adipiscinga adipiscing m ')
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
                padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
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
                  Text(
                    "140\$",
                    style: TextStyle(fontSize: 20, fontFamily: 'welcome'),
                  )
                ]),
              ),
              color: Colors.white,
              width: screenWidth(1),
              height: screenHieght(10),
            ),
          )
        ],
      ),
    ));
  }
}
