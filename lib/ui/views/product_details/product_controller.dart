import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/var_model.dart';
import 'package:flutter_templete/core/data/models/available_shape_model.dart';
import 'package:flutter_templete/core/data/models/color_model.dart';
import 'package:flutter_templete/core/data/models/mat_product.dart';
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
import 'package:get/get_rx/get_rx.dart';

class ProductController extends BaseController {
  int? id;
  ProductController({
    this.id,
  });
  @override
  void onInit() {
    getProductsFeaturesByID(id: id!);
    getMatttt(id: id!);

    super.onInit();
  }

  RxString selectedColorname = "".obs;
  RxInt selecteshaperid = 0.obs;
  RxString materilaidd = "".obs;
  RxBool isFavorite = false.obs;
  RxString selecteedym = "".obs;
  RxInt selectedshape = 3.obs;
  RxInt selectedIndexcolor = 0.obs;
  RxInt selectedVaritionGroup = 0.obs;
  RxInt selectedVPriceroup = 0.obs;
  RxList<ColorModel> getcolorr = <ColorModel>[].obs;
  RxList<AvailableshapeModel> getshape = <AvailableshapeModel>[].obs;
  Rx<ProductFearuresModel> Productfeaturelist = ProductFearuresModel().obs;
  Rx<VariationModel> varitionm = VariationModel().obs;
  Rx<VariationsModel> mattt = VariationsModel().obs;
  getMatttt({
    required int id,
  }) {
    runLoadingFutureFunction(
      type: OperationType.BBB,
      function: getProductsRepository()
          .getMatofProduct(
        id: id,
      )
          .then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              mattt.value = r;

              // CustomToast.showMessage(
              //   message: "succed",
              //   messageType: MessageType.SUCCESS,
              // );
            },
          );
        },
      ),
    );
  }

  RxInt selectedVargroup = 0.obs;
  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  Future<void> getcolor(
      {required int id, required int shape, required String mat}) async {
    runLoadingFutureFunction(
        type: OperationType.PROFILE,
        function: getProductsRepository()
            .getColor(product_id: id, shape_id: shape, material_id: mat)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            getcolorr.value = r;
            print(r);
          });
        }));
  }

  Future<void> getshapeformat({required int id, required String mat}) async {
    runLoadingFutureFunction(
        type: OperationType.PROFILE,
        function: getProductsRepository()
            .getShape(product_id: id, material_id: mat)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            getshape.value = r;
          });
        }));
  }

  void add({required int product_id, required int variation_id}) {
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
                // storage.setTokenInfo(r);
                // CustomToast.showMessage(
                //   messageType: MessageType.SUCCESS,
                //   message: r,
                // );
              },
            ),
          ),
    );
  }

  final selectedMaterialIndex = 0.obs;

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
              // CustomToast.showMessage(
              //   message: "succed",
              //   messageType: MessageType.SUCCESS,
              // );
            },
          );
        },
      ),
    );
  }

  getVariation({
    required int id,
    required int color_id,
    required String material_id,
    required int shape_id,
  }) {
    runLoadingFutureFunction(
      function: getProductsRepository()
          .getVar(
              id: id,
              color_id: color_id,
              material_id: material_id,
              shape_id: shape_id)
          .then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              varitionm.value = r;
              selectedVPriceroup.value = varitionm.value.price!;
              selectedVargroup.value = varitionm.value.variationId!;
              // CustomToast.showMessage(
              //   message: "succed",
              //   messageType: MessageType.SUCCESS,
              // );
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
}
