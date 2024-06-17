import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:get/get.dart';

class CustomCat extends StatefulWidget {
  const CustomCat({
    super.key,
    required this.categoryName,
    required this.index,
  });
  final String categoryName;
  final int index;
  @override
  State<CustomCat> createState() => _CustomCatState();
}

class _CustomCatState extends State<CustomCat> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: () {
                controller.selectedIndex.value = widget.index;
                // controller.getProductsById(
                //     id: controller.getProductsById(
                //         id: controller.selectedIndex.value));
                controller.getAllproducts();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColors.mainGrey),
                    shape: BoxShape.rectangle,
                    color: controller.selectedIndex.value == widget.index
                        ? Colors.black
                        : AppColors.mainWhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    widget.categoryName,
                    style: TextStyle(
                      fontSize: 20,
                      color: controller.selectedIndex.value == widget.index
                          ? AppColors.mainWhiteColor
                          : AppColors.mainblack,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
