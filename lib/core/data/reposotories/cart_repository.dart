import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/cart_all_model.dart';
import 'package:flutter_templete/core/data/models/cartproductmodel.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/cart_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class CartRepository {
  Future<Either<String, String>> addToCart(
      {required int product_id,
      required int variation_id,
      required int quantity,
      required int has_candel}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: CartEndpoints.addTocart,
          headers: NetworkConfig.getHeaders(
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            },
            needAuth: false,
            type: RequestType.POST,
          ),
          params: {
            "product_id": product_id.toString(),
            "variation_id": variation_id.toString(),
            "quantity": quantity.toString(),
            "has_candle": has_candel.toString()
          });

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(commonResponse.getData['data']!);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CartProductModel>>> getCartProducts() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CartEndpoints.getcart,
        headers: NetworkConfig.getHeaders(
          extraHeaders: {
            "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
          },
          needAuth: false,
          type: RequestType.GET,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<CartProductModel> result = [];

        commonResponse.getData['data']['items'].forEach(
          (element) {
            result.add(CartProductModel.fromJson(element));
          },
        );
        return Right(result);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CartAllModel>> getCartInfo() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CartEndpoints.getcart,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
          extraHeaders: {
            "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
          },
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        CartAllModel model = CartAllModel.fromJson(
            commonResponse.getData['data'] as Map<String, dynamic>);

        return Right(model);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> editCart(
      {required int item_id,
      required int variation_id,
      required int quantity}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.PUT,
          url: CartEndpoints.editcart,
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.PUT,
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            },
          ),
          params: {
            "item_id": item_id.toString(),
            "variation_id": variation_id.toString(),
            "quantity": quantity.toString(),
          });

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(commonResponse.data!);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> addAll({required List products}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: CartEndpoints.addAll,
        body: {"products": products},
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.POST,
          extraHeaders: {
            "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
          },
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(commonResponse.getData['data']!);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
