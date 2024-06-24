import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_cat.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_product.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter_templete/ui/views/product_details/products_view.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(40)),
          child: ListView(
            children: [
              SizedBox(
                height: screenHieght(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello !",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Welcome'),
                      ),
                      Text(
                        "User name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Welcome'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/Map.svg'),
                          SizedBox(width: screenWidth(40)),
                          DropdownButton<AddressGetModel>(
                            alignment: Alignment.bottomLeft,
                            value: controller.selectedValue,
                            onChanged: (AddressGetModel? newValue) {
                              setState(() {
                                controller.selectedValue = newValue!;
                              });
                            },
                            items: controller.dropdownItems.map((address) {
                              return DropdownMenuItem<AddressGetModel>(
                                value: address,
                                child:
                                    // Text("${address.city!},${address.state}"),
                                    Text("${address.name}"),
                              );
                            }).toList(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: screenHieght(40),
              ),
              Obx(() {
                return controller.isProductsLoading
                    ? SpinKitCircle(
                        color: AppColors.mainBlueColor,
                      )
                    : SizedBox(
                        child: controller.sliderrlist.isEmpty
                            ? Text(tr("key_no_product"))
                            // : ListView.builder(
                            //     physics: BouncingScrollPhysics(),
                            //     shrinkWrap: true,
                            //     itemCount: controller.sliderList.length,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: InkWell(
                            //           onTap: () {
                            //             // Get.to(
                            //             //   () => ProductDetailsView(
                            //             //     model: controller.productsList[index],
                            //             //   ),
                            //             // );
                            //           },
                            //           child: Column(
                            //             children: [
                            //               CustomSlider(
                            //                   items: controller.sliderList),
                            //             ],
                            //           ),
                            //         ),
                            //       );
                            //     })
                            : CustomSlider(
                                items: controller.sliderrlist,
                                imageHeight: screenHieght(4),
                              ),
                      );
              }),
              screenHieght(20).ph,
              Text(
                "Categories",
                style: TextStyle(fontSize: 25, fontFamily: 'WElcome'),
              ),
              screenHieght(40).ph,
              SizedBox(
                height: 50,
                child: Obx(() {
                  return SizedBox(
                      height: 50,
                      child: controller.categorylistt.isEmpty
                          ? Text("no category ")
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.categorylistt.length,
                              itemBuilder: (BuildContext context, int index) {
                                controller.selectedIndex.value = index;

                                int i = index;
                                String categoryy =
                                    controller.categorylistt[index].name ?? "";
                                // controller.selectedcategory = controller
                                //     .categorylistt[index].name
                                //     .toString();
                                return CustomCat(
                                    categoryName: categoryy, index: index);
                              }));
                }),
              ),
              SizedBox(
                height: screenHieght(20),
              ),
              Obx(() {
                return controller.isCatLoading
                    ? SpinKitCircle(
                        color: AppColors.mainBlueColor,
                      )
                    : SizedBox(
                        child: controller.Productbyidlist.isNotEmpty
                            ?
                            // ? Text(tr("key_no_product"))
                            // :
                            ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.Productbyidlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.off(ProductView(
                                                model: controller
                                                    .Productbyidlist[index],
                                              ));
                                            },
                                            child: CustomProduct(
                                              imageurl: controller
                                                      .Productbyidlist[index]
                                                      .mainImage ??
                                                  "",
                                              productdetail: controller
                                                  .Productbyidlist[index]
                                                  .description,
                                              productname: controller
                                                  .Productbyidlist[index].name,
                                            )),
                                      ],
                                    ),
                                  );
                                })
                            : Text(""));
              }),
              Obx(() {
                return controller.isLoading
                    ? SpinKitCircle(
                        color: AppColors.mainBlueColor,
                      )
                    : SizedBox(
                        child: controller.third.isNotEmpty
                            ?
                            // ? Text(tr("key_no_productTH"))
                            // :
                            ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.third.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth(10)),
                                        child: Column(
                                          children: [
                                            Text(
                                              "To Make Your Customer Order ",
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            SizedBox(
                                              height: screenHieght(80),
                                            ),
                                            CustomButton(
                                                text: "Call Us",
                                                onPressed: () {}),
                                          ],
                                        ),
                                      ),
                                      CachedNetworkImage(
                                          width: screenWidth(2),
                                          height: screenHieght(3),
                                          imageUrl: controller.third[index]),
                                    ],
                                  );
                                })
                            : Text(""));
              }),
              // Obx(() {
              //   return SizedBox(
              //       child: controller.sliderrlist.isEmpty
              //           ? Text(tr("key_no_product"))
              //           : ListView.builder(
              //               physics: BouncingScrollPhysics(),
              //               shrinkWrap: true,
              //               itemCount: controller.sliderrlist.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: CachedNetworkImage(
              //                       width: screenWidth(1),
              //                       height: screenHieght(4),
              //                       imageUrl:
              //                           controller.sliderrlist[index].image!),
              //                 );
              //               }));
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//                                   clipBehavior: Clip.antiAlias,
//                                   alignment:
//                                       AlignmentDirectional.center,
//                                   width: screenWidth(3),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.mainWhiteColor,
//                                     borderRadius:
//                                         BorderRadius.circular(20),
//                                     border: Border.all(
//                                       color: AppColors.mainGreyColor,
//                                     ),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       screenWidth(30).ph,
//                                       Container(
//                                         width: screenWidth(4),
//                                         height: screenWidth(4),
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         ),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           child: CachedNetworkImage(
//                                             imageUrl: controller
//                                                     .categorylistt[
//                                                         index]
//                                                     .image ??
//                                                 '',
//                                             fit: BoxFit.cover,
//                                             placeholder:
//                                                 (context, url) =>
//                                                     Container(
//                                               width: screenWidth(20),
//                                               height: screenWidth(20),
//                                               child:
//                                                   CircularProgressIndicator(),
//                                             ),
//                                             errorWidget:
//                                                 (context, url, error) =>
//                                                     Icon(Icons.error),
//                                           ),
//                                         ),
//                                       ),
//                                       screenWidth(25).ph,
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal:
//                                                 screenWidth(20)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               controller
//                                                       .categorylistt[
//                                                           index]
//                                                       .name ??
//                                                   '',
//                                               style: TextStyle(
//                                                 fontWeight:
//                                                     FontWeight.bold,
//                                                 fontSize:
//                                                     screenWidth(30),
//                                               ),
//                                               textAlign:
//                                                   TextAlign.start,
//                                               maxLines: 3,
//                                               overflow:
//                                                   TextOverflow.ellipsis,
//                                             ),
//                                             screenWidth(30).ph,
//                                             Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceAround,
//                                                 children: [
//                                                   Text(
//                                                     tr("key_price"),
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight
//                                                                 .bold,
//                                                         color: AppColors
//                                                             .mainBlueColor),
//                                                   ),
//                                                   Text(
//                                                     '${controller.categorylistt[index].description}',
//                                                     style: TextStyle(
//                                                         color: AppColors
//                                                             .mainblack,
//                                                         fontWeight:
//                                                             FontWeight
//                                                                 .bold),
//                                                     maxLines: 2,
//                                                   ),
//                                                 ])
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

// // InkWell(
// //   onTap: () {
// //     Get.to(ProductView());
// //   },
// //   child: CustomProduct(
// //     imageurl:
// //         "https://s3-alpha-sig.figma.com/img/4d14/0eff/ebc80cec12ead181401214ac7ed97382?Expires=1715558400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=U5ccnZsv9MGg3TveDcy3p~pj8eWQCfstLdDjMSTd5QiJBaXuPBT4baDWCZI8ZXE2dIF71Dtx5rF7781zksokcgo0y7ei8RuXZ73EMUGl08jD2E27u6c6kRpnzipHjyXMfJRkS8yLYtBKBuiP1ea5fWwiOrrHHThM48CdjADRKbA-CT9g8-QFnuE3hgBhmlyIU4XF2b4nCok-cf-HhQ9urZ4~hebSn7-K0E6D5oyIiKt6SfEDyGV~UC~~vBYEzQDF7dv4aTlI6DrgN~qmbUNTYuVGxtACG5T~GO09F~mCrLD9f2xzUOtP~UC-RIbGWB4ytoZni-Pvx0dXuXeirADYBA__",
// //     productdetail: "asdfghasdfghasdfqwedsazxcfvgbthy",
// //     productname: "productname",
// //   ),
// // ),
// .
//       Container(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: screenWidth(10)),
//           child: Column(children: [
//             Text("To Make Your Customer Order "),
//             SizedBox(
//               height: screenHieght(80),
//             ),
//             CustomButton(text: "Call Us", onPressed: () {}),
//           ]),
//         ),
//       ),
//       SizedBox(
//         height: screenHieght(80),
//       ),
//       Text('Sample'),
//       SizedBox(
//         height: screenHieght(5),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: controller.imageUrls.length,
//           itemBuilder: (context, index) {
//             return Container(
//               margin: EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   Image.network(
//                     controller.imageUrls[index],
//                     width: 100.0,
//                     height: 100.0,
//                     fit: BoxFit.cover,
//                   ),
//                   SizedBox(height: 8.0),
//                   Text('Item $index'),
//                 ],
//               ),
//             );
//           },
//         ),
//       )
//     ])),
