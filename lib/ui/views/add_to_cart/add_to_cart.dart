import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_favorite_container.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/add_to_cart/add_to_cart_controller.dart';
import 'package:get/get.dart';

class AddToCartView extends StatefulWidget {
  const AddToCartView({
    super.key,
  });

  @override
  State<AddToCartView> createState() => _AddToCartViewState();
}

class _AddToCartViewState extends State<AddToCartView> {
  Widget build(BuildContext context) {
    AddToCartController controller = Get.put(AddToCartController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            screenHieght(10).ph,
            screenHieght(10).ph,
            Obx(
              () => ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.cartProductList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHieght(70)),
                        child: Column(children: [
                          InkWell(
                            onTap: () {},
                            child: CustomFavoriteContainer(
                              productName:
                                  controller.cartProductList[index].name,
                              shape: "Rectengle",
                              color: "Gold",
                              price: controller.cartProductList[index].price,
                              imagename:
                                  controller.cartProductList[index].mainImage,
                              deletfavor: () {},
                            ),
                          )
                        ]));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
