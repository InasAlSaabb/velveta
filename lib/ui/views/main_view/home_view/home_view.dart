import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/views/contact_us_view/contact_us_view.dart';
import 'package:flutter_templete/ui/views/test_pay/test_pay.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_cat.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_product.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/favorite_view/favorite_view.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter_templete/ui/views/pay.dart';
import 'package:flutter_templete/ui/views/product_details/product_controller.dart';
import 'package:flutter_templete/ui/views/product_details/products_view.dart';
import 'package:flutter_templete/ui/views/product_view2/product_view2.dart';
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
                        tr('key_hello_!'),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Welcome'),
                      ),
                      Text(
                        '  ${storage.getName() ?? "User name"}   ',
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
                          Obx(
                            () {
                              final selectedName =
                                  controller.selectedName.value;
                              final nameList = controller
                                  .getNameList(controller.addressList);
                              final isSelectedNameValid =
                                  nameList.contains(selectedName);

                              return SizedBox(
                                height: screenHieght(20),
                                child: DropdownButton<String>(
                                  dropdownColor: AppColors.mainWhiteVColor,
                                  value:
                                      isSelectedNameValid ? selectedName : null,
                                  hint: Text('Select Location'),
                                  items: nameList.map(
                                    (name) {
                                      return DropdownMenuItem<String>(
                                        value: name,
                                        child: Text(name),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    controller.selectedName.value = value ?? '';
                                  },
                                ),
                              );
                            },
                          ),
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
                            : CustomSlider(
                                items: controller.sliderrlist,
                                imageHeight: screenHieght(4),
                              ),
                      );
              }),
              screenHieght(20).ph,
              Text(
                tr('key_Categories'),
                style: TextStyle(fontSize: 25, fontFamily: 'WElcome'),
              ),
              screenHieght(60).ph,
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
                                controller.idCategory.value =
                                    controller.selectedIndex.value;
                                String categoryy =
                                    controller.categorylistt[index].name ?? "";
                                return CustomCat(
                                    categoryName: categoryy, index: index);
                              }));
                }),
              ),
              SizedBox(
                height: screenHieght(60),
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
                                              controller.selectedIndexx.value ==
                                                      0
                                                  ? Get.off(ProductView(
                                                      id: controller
                                                          .Productbyidlist[
                                                              index]
                                                          .id!,
                                                    ))
                                                  : Get.off(ProductView2(
                                                      id: controller
                                                          .Productbyidlist[
                                                              index]
                                                          .id!));
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
                                              tr('key_to_make_your'),
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            SizedBox(
                                              height: screenHieght(80),
                                            ),
                                            CustomButton(
                                                textColor:
                                                    AppColors.mainWhiteVColor,
                                                text: tr('key_call'),
                                                onPressed: () {
                                                  Get.to(ContactUsView());
                                                }),
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
            ],
          ),
        ),
      ),
    );
  }
}
