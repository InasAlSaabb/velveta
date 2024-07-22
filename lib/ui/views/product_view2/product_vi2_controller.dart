import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/products_by_id_model.dart';
import 'package:flutter_templete/core/data/reposotories/cart_repository.dart';
import 'package:flutter_templete/core/data/reposotories/favorite_repository.dart';
import 'package:flutter_templete/core/data/reposotories/products_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class ProductView2Controller extends BaseController {
  int? id;
  ProductView2Controller({
    required this.id,
  });
  @override
  void onInit() {
    getProductsFeaturesByID(id: id!);

    super.onInit();
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  RxBool isFavorite = false.obs;
  RxString selecteeedym = "".obs;

  Rx<ProductFearuresModel> Productfeatureelist = ProductFearuresModel().obs;
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
              Productfeatureelist.value = r;
              selecteeedym.value = Productfeatureelist.value.mainImage!;
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

  void addToCart(
      {required id,
      required int variation_id,
      required int quantity,
      required int has_candel}) {
    runFullLoadingFutureFunction(
      function: CartRepository()
          .addToCart(
              product_id: id,
              variation_id: variation_id,
              quantity: quantity,
              has_candel: has_candel)
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

  void addtofav({required int product_id, required int variation_id}) {
    runFullLoadingFutureFunction(
      function: FavoriteRepository()
          .addFavorite(product_id: product_id, variation_id: variation_id)
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: l,
                );
              },
              (r) {
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: r,
                );
              },
            ),
          ),
    );
  }

  RxInt count = 1.obs;
  void changeCount(bool increase) {
    if (increase) {
      count++;
    } else {
      if (count > 1) count--;
    }
  }
}
