import 'package:flutter_templete/core/data/models/favorite_model.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/product_model.dart';
import 'package:flutter_templete/core/data/reposotories/cart_repository.dart';
import 'package:flutter_templete/core/data/reposotories/favorite_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
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

  void addAllToCart(
      int id, int variation_id, int quantity, ProductFearuresModel model) {
    favoriteList.forEach((element) {
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
                  // CartService().addToCart(model: model, count: quantity);
                },
              ),
            ),
      );
    });
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
        }));
  }
}
