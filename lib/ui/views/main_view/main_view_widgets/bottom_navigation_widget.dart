import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/enums/bottom_Navigation.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum navitm;
  final Function(BottomNavigationEnum, int) ontap;
  const BottomNavigationWidget(
      {super.key, required this.navitm, required this.ontap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  void initState() {
    // TODO: implement initState
    update();
    super.initState();
  }

  Cartcontroller cc = Get.put(Cartcontroller());
  void update() {
    cc.getCart();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            boxShadow: [
              BoxShadow(
                color: Color(0x0D0D0D0A),
                offset: Offset(0, -4),
                blurRadius: 10,
              ),
            ],
          ),
          width: screenWidth(1),
          height: screenHieght(12),
        ),
        Positioned(
          bottom: screenWidth(70),
          child: Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
            child: Row(children: [
              navItem(
                  text: "Home",
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.HOME, 0);
                  },
                  size: size,
                  imagename: 'ic_home',
                  isslected: widget.navitm == BottomNavigationEnum.HOME),
              SizedBox(
                width: screenWidth(6),
              ),
              navItem(
                  text: "Favorite",
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.FAVORITE, 1);
                  },
                  size: size,
                  imagename: 'ic_favorite',
                  isslected: widget.navitm == BottomNavigationEnum.FAVORITE),
              SizedBox(
                width: screenWidth(6),
              ),
              Stack(
                children: [
                  navItem(
                      text: "Cart",
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.CART, 2);
                      },
                      size: size,
                      imagename: 'ic_cart',
                      isslected: widget.navitm == BottomNavigationEnum.CART),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Obx(() => cc.cartProductList.length > 0
                        ? Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${cc.cartProductList.length}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()),
                  ),
                ],
              ),
              SizedBox(
                width: screenWidth(6),
              ),
              navItem(
                  text: "Profile",
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.PROFILE, 3);
                  },
                  size: size,
                  imagename: 'ic_profile',
                  isslected: widget.navitm == BottomNavigationEnum.PROFILE),
            ]),
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required Size size,
      required String imagename,
      required bool isslected,
      required String text,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$imagename.svg',
            color: isslected ? Colors.black : AppColors.mainGrey,
            width: screenWidth(17),
          ),
          screenHieght(80).ph,
          Text(
            text,
            style: TextStyle(
              color: isslected ? Colors.black : AppColors.mainGrey,
            ),
          ),
        ],
      ),
    );
  }
}
