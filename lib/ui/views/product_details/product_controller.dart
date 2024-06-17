import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:get/get.dart';

class ProductController extends BaseController {
  List<String> shapes = ['Rectangle', 'Oval', 'Square'];
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];
  Color? selectedColor;
  // ProductsModel product = ProductsModel();
  RxInt count = 1.obs;
  void changeCount(bool increase) {
    if (increase) {
      count++;
    } else {
      if (count > 1) count--;
    }
  }

  // double calcTotal() {
  //   return (count.value * product.price!);
  // }

  void addToCart() {
    // cartService.addToCart(
    //     product: product,
    //     count: count.value,
    //     afterAdd: () {
    //       Get.find<HomeController>().cartCount.value += count.value;
    //       CustomToast.showMessage(message: "addd succesfully");
    //       // Get.to(CartView());
    //     });
  }
}
