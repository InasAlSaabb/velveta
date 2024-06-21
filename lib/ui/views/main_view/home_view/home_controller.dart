import 'dart:convert';

import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/product_id_model.dart';
import 'package:flutter_templete/core/data/models/products_by_id_model.dart';
import 'package:flutter_templete/core/data/models/sliderr_model.dart';
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
    storage.getAddressList();
    // getAllCategory();
    super.onInit();
  }

  RxList<CategoryModel> categorylistt = <CategoryModel>[].obs;
  RxList<SliderrModel> sliderrlist = <SliderrModel>[].obs;
  RxList<ProductsByIDModel> Productbyidlist = <ProductsByIDModel>[].obs;
  RxList<String> third = <String>[].obs;
  RxInt cartCount = 0.obs;
  String selectedcategory = "Lux";
  RxInt selectedIndex = 0.obs;
  RxInt selectedIndexx = 0.obs;

  RxList<CategoryModel> sliderList = <CategoryModel>[].obs;

  late AddressGetModel selectedValue = dropdownItems.first;
  List<AddressGetModel> dropdownItems = storage.getAddressList();
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
      type: OperationType.CATID,
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
}

  // getProductsById({required int id}) {
  //   // selectedcategory = id.toString();
  //   runLoadingFutureFunction(
  //     type: OperationType.CATID,
  //     function: getProductsRepository().getproductsbyid(id: id).then(
  //       (value) {
  //         value.fold(
  //           (l) {
  //             CustomToast.showMessage(
  //               message: l,
  //               messageType: MessageType.REJECTED,
  //             );
  //           },
  //           (r) {
  //             Productbyidlist.clear();
  //             Productbyidlist.value = r;

  //             CustomToast.showMessage(
  //               message: "succed",
  //               messageType: MessageType.SUCCESS,
  //             );
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }