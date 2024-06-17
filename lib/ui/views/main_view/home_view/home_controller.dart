import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/product_id_model.dart';
import 'package:flutter_templete/core/data/reposotories/products_repository.dart';
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

    storage.getAddressList();
    // getAllCategory();
    super.onInit();
  }

  RxList<CategoryModel> categorylistt = <CategoryModel>[].obs;
  // RxList<ProductIdModel> Productbyidlist = <ProductIdModel>[].obs;

  RxInt cartCount = 0.obs;
  String selectedcategory = "Lux";
  RxInt selectedIndex = 0.obs;
  RxInt selectedIndexx = 0.obs;
  RxList<String> categoryList = <String>[].obs;

  RxList<CategoryModel> sliderList = <CategoryModel>[].obs;

  late AddressGetModel selectedValue = dropdownItems.first;
  List<AddressGetModel> dropdownItems = storage.getAddressList();
  void getAllproducts() {
    runLoadingFutureFunction(
        type: OperationType.GATEGORY,
        function:
            //  category != "All"
            // ? getProductsRepository()
            //     .getproductsbycategory(category: category)
            //     .then(
            //     (value) {
            //       value.fold(
            //         (l) {
            //           CustomToast.showMessage(
            //             message: l,
            //             messageType: MessageType.REJECTED,
            //           );
            //         },
            //         (r) {
            //           productsList.clear();
            //           //very import
            //           productsList.addAll(r);
            //         },
            //       );
            //     },
            //   )
            // :
            getProductsRepository().getAll().then(
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

  // getProductsById({required int id}) {
  //   selectedcategory = id.toString();
  //   runLoadingFutureFunction(
  //     // type: OperationType.GATEGORY,
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
}
