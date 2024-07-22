import 'package:flutter_templete/core/data/models/favorite_model.dart';
import 'package:flutter_templete/core/data/reposotories/favorite_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class FavoriteViewController extends BaseController {
  RxList<FavoriteModel> favoriteList = <FavoriteModel>[].obs;
  RxInt id = 0.obs;
  @override
  void onInit() {
    getFavorites();

    super.onInit();
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;

  Future<void> AddAll() async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function: FavoriteRepository()
            .addAll(products: favoriteList.toList())
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
          });
        }));
  }

  Future<void> getFavorites() async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function: FavoriteRepository().getFavorites().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            favoriteList.value = r;
          });
        }));
  }

  void deletFavorite(
      {required int product_id, required int variation_id}) async {
    runLoadingFutureFunction(
        type: OperationType.FAVORITE,
        function: FavoriteRepository()
            .deletFavorite(product_id: product_id, variation_id: variation_id)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
          });
          Get.back(closeOverlays: true);
          update();
        }));
  }
}
