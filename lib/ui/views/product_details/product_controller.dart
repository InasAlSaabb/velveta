import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/products_by_id_model.dart';
import 'package:flutter_templete/core/data/reposotories/products_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class ProductController extends BaseController {
  int? id;
  ProductController({
    this.id,
  });
  @override
  void onInit() {
    getProductsFeaturesByID(id: id!);
    // selecteedym.value = Productfeaturelist.value.mainImage!;

    super.onInit();
  }

  RxString selecteedym = "".obs;
  RxInt selectedIndexcolor = 0.obs;
  Rx<ProductFearuresModel> Productfeaturelist = ProductFearuresModel().obs;
  getProductsFeaturesByID({required int id}) {
    runLoadingFutureFunction(
      function: getProductsRepository().getFeatureOfProduct(id: id).then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              Productfeaturelist.value = r;
              selecteedym.value = Productfeaturelist.value.mainImage!;
              CustomToast.showMessage(
                message: "succed",
                messageType: MessageType.SUCCESS,
              );
            },
          );
        },
      ),
    );
  }

  RxString? selectedColor = "".obs;
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
