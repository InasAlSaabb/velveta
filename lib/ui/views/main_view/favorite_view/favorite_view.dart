import 'package:flutter/material.dart';
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

  void update() {
    controller.getFavorites();
  }

  @override
  // void initState() {
  //   super.initState();
  //   update();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteVColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
          child: Column(
            // shrinkWrap: true,
            children: [
              screenHieght(30).ph,
              CustomBeginMain(text: tr("favorite")),
              screenHieght(30).ph,
              Obx(
                () => SizedBox(
                  height: screenHieght(2),
                  child: ListView.builder(
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
                                    controller.id.value =
                                        controller.favoriteList[index].id!;
                                    controller.deletFavorite(
                                        product_id:
                                            controller.favoriteList[index].id!,
                                        variation_id: controller
                                            .favoriteList[index].variationId!);
                                    update();
                                  },
                                  productName:
                                      controller.favoriteList[index].name,
                                  shape: controller.favoriteList[index]
                                          .attributes!.boxShape ??
                                      'not shape',
                                  color: controller
                                      .favoriteList[index].attributes!.color,
                                  price: controller.favoriteList[index].price,
                                  imagename:
                                      controller.favoriteList[index].mainImage,
                                ),
                              )
                            ]));
                      }),
                ),
              ),
              Spacer(),
              CBG(
                isSide: false,
                onPressed: () {},
                width: screenWidth(1.1),
                hieght: screenHieght(15),
                text: tr("add_all_to_cart"),
                background: AppColors.mainBlackVColor,
                colorText: AppColors.mainWhiteVColor,
                shape: BeveledRectangleBorder(),
                fontText: screenWidth(21),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
