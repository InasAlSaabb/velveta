import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_begin_main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_G.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_favorite_container.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/favorite_view/favorite_view_controller.dart';
import 'package:get/get.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  FavoriteViewController controller = Get.put(FavoriteViewController());

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    controller.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
        child: Obx(() {
          return controller.isLoading
              ? SpinKitCircle(
                  color: AppColors.mainGreyColor,
                )
              : ListView(
                  shrinkWrap: true,
                  children: [
                    screenHieght(30).ph,
                    CustomBeginMain(text: tr("favorite")),
                    screenHieght(30).ph,
                    ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.favoriteList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHieght(70)),
                              child: Column(children: [
                                InkWell(
                                  onTap: () {},
                                  child: CustomFavoriteContainer(
                                    deletfavor: () {
                                      controller.id.value = controller
                                          .favoriteList[index].productId!;
                                      controller.deletFavorite(
                                          product_id: controller
                                              .favoriteList[index].productId!,
                                          variation_id: controller
                                              .favoriteList[index]
                                              .variationId!);
                                      update();
                                    },
                                    productName:
                                        controller.favoriteList[index].name,
                                    shape: controller.favoriteList[index]
                                            .attributes!.boxShape ??
                                        'not shape',
                                    color: controller
                                        .favoriteList[index].attributes!.color,
                                    price: controller.favoriteList[index].price
                                        .toString(),
                                    imagename: controller
                                        .favoriteList[index].mainImage,
                                  ),
                                )
                              ]));
                        }),
                    screenWidth(1.2).ph,
                    CBG(
                      isSide: false,
                      onPressed: () {
                        controller.AddAll();
                      },
                      width: screenWidth(1),
                      hieght: screenHieght(15),
                      text: tr("add_all_to_cart"),
                      background: AppColors.blacktext,
                      colorText: AppColors.whitecolor,
                      shape: BeveledRectangleBorder(),
                      fontText: screenWidth(21),
                    ),
                  ],
                );
        }),
      ),
    ));
  }
}
