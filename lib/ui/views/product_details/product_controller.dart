import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/products_by_id_model.dart';
import 'package:flutter_templete/core/data/reposotories/cart_repository.dart';
import 'package:flutter_templete/core/data/reposotories/products_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
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

  RxBool isFavorite = false.obs;
  RxString selecteedym = "".obs;
  RxInt selectedIndexcolor = 0.obs;
  RxInt selectedVaritionGroup = 0.obs;
  Rx<ProductFearuresModel> Productfeaturelist = ProductFearuresModel().obs;

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
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
  void changecount(bool increes) {
    if (increes) {
      count++;
    } else {
      if (count > 1) {
        count--;
      }
    }
  }

  void add(int id, int variation_id, int quantity, ProductFearuresModel model) {
    runFullLoadingFutureFunction(
      function: CartRepository()
          .addToCart(
              product_id: id, variation_id: variation_id, quantity: quantity)
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: l,
                );
              },
              (r) {
                // storage.setTokenInfo(r);
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: r,
                );
                addToCart();
              },
            ),
          ),
    );
  }

  void editCart(
      int id, int variation_id, int quantity, ProductFearuresModel model) {
    runFullLoadingFutureFunction(
      function: CartRepository()
          .editCart(item_id: id, variation_id: variation_id, quantity: quantity)
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: l,
                );
              },
              (r) {
                // storage.setTokenInfo(r);
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: r,
                );
              },
            ),
          ),
    );
  }

  double calcTotal() {
    return (count.value * int.parse(Productfeaturelist.value.price!))
        .toDouble();
  }

  void addToCart() {
    cartService.addToCart(
        model: Productfeaturelist.value,
        count: count.value,
        afterAdd: () {
          // Get.to(CartView());
        });
  }

  Future<void> getProduct() async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function: getProductsRepository().getProducts(id: 1).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            Productfeaturelist.value = r;
          });
        }));
  }

  // void deletFavorite() async {
  //   runLoadingFutureFunction(
  //       type: OperationType.FAVORITE,
  //       function:
  //           FavoriteRepository().deletFavorite(id: id.value).then((value) {
  //         value.fold((l) {
  //           CustomToast.showMessage(
  //               message: l, messageType: MessageType.REJECTED);
  //         }, (r) {
  //           CustomToast.showMessage(
  //               message: "succed", messageType: MessageType.SUCCESS);
  //         });
  //       }));
  // }
}
