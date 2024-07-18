import 'dart:convert';

import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/product_id_model.dart';
import 'package:flutter_templete/core/data/models/products_by_id_model.dart';
import 'package:flutter_templete/core/data/models/sliderr_model.dart';
import 'package:flutter_templete/core/data/reposotories/address_repository.dart';
import 'package:flutter_templete/core/data/reposotories/cart_repository.dart';
import 'package:flutter_templete/core/data/reposotories/favorite_repository.dart';
import 'package:flutter_templete/core/data/reposotories/products_repository.dart';
import 'package:flutter_templete/core/data/reposotories/sliderr_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    getAllproducts();
    getAllSliderrs();
    getProductsByCatId(id: 1);
    getAllAddress();

    super.onInit();
  }

  RxList<AddressGetModel> addressList = <AddressGetModel>[].obs;
  RxInt idCategory = 0.obs;
  RxList<CategoryModel> categorylistt = <CategoryModel>[].obs;
  RxList<SliderrModel> sliderrlist = <SliderrModel>[].obs;
  RxList<ProductsByIDModel> Productbyidlist = <ProductsByIDModel>[].obs;

  RxList<String> third = <String>[].obs;
  Rx<AddressGetModel> selectedValue = AddressGetModel().obs;
  RxInt cartCount = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxInt selectedIndexx = 0.obs;

  Rx<String?> selectedName = ''.obs;

  RxList<CategoryModel> sliderList = <CategoryModel>[].obs;
  void addtocart(
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

  Future<void> getAllAddress() async {
    runLoadingFutureFunction(
        type: OperationType.ADDRESS,
        function: AddressRepository().getAllAddress().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            addressList.value = r;
            getNameList(addressList);
          });
        }));
  }

  List<String> getNameList(List<AddressGetModel> addressList) {
    List<String> nameList = [];

    for (var address in addressList) {
      nameList.add(address.name ?? '');
    }

    return nameList;
  }

  void getAllproducts() {
    runLoadingFutureFunction(
        function: getProductsRepository().getAll().then(
      (value) {
        value.fold(
          (l) {
            CustomToast.showMessage(
              message: l,
              messageType: MessageType.REJECTED,
            );
          },
          (r) {
            categorylistt.value = r;
            sliderList.clear();
            sliderList.value = r;

            CustomToast.showMessage(
              message: "succed",
              messageType: MessageType.SUCCESS,
            );
          },
        );
      },
    ));
  }

  void getAllSliderrs() {
    runLoadingFutureFunction(
        type: OperationType.SLIDER,
        function: SliderrREpository().getAll().then(
          (value) {
            value.fold(
              (l) {
                CustomToast.showMessage(
                  message: l,
                  messageType: MessageType.REJECTED,
                );
              },
              (r) {
                sliderrlist.clear();
                sliderrlist.value = r;

                CustomToast.showMessage(
                  message: "succed",
                  messageType: MessageType.SUCCESS,
                );
              },
            );
          },
        ));
  }

  getProductsByCatId({required int id}) {
    runLoadingFutureFunction(
      // type: OperationType.CATID,
      function: getProductsRepository().getProductsByCategoryId(id: id).then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              third.clear();
              Productbyidlist.clear();
              Productbyidlist.value = r;

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
  //fea

  getProductsByCatIdth({required int id}) {
    runLoadingFutureFunction(
      function: getProductsRepository().getProductsByCategoryIdth(id: id).then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              Productbyidlist.clear();
              third.value = r;
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

  void add() {
    runFullLoadingFutureFunction(
      function: FavoriteRepository()
          .addFavorite(product_id: 1, variation_id: 29)
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
}
