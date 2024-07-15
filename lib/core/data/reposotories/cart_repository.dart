import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/cartproductmodel.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/product_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/cart_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class CartRepository {
  Future<Either<String, String>> addToCart(
      {required int product_id,
      required int variation_id,
      required int quantity}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: CartEndpoints.addTocart,
          headers: NetworkConfig.getHeaders(
            needAuth: true,
            type: RequestType.POST,
          ),
          params: {
            "product_id": product_id.toString(),
            "variation_id": variation_id.toString(),
            "quantity": quantity.toString(),
          });

      // final dynamic responseData = response['body'];

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

  Future<Either<String, List<ProductFearuresModel>>> getCartProducts() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CartEndpoints.getcart,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          type: RequestType.GET,
        ),
      );

      // final dynamic responseData = response['body'];

      CommonResponse<Map<String, dynamic>> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<ProductFearuresModel> result = [];

        commonResponse.getData['data']['items'].forEach(
          (element) {
            result.add(ProductFearuresModel.fromJson(element));
          },
        );
        // result.addAll(commonResponse.data!.map(
        //   (element) => CartProductModel.fromJson(element),
        // ));
        return Right(result);
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
            needAuth: true,
            type: RequestType.PUT,
          ),
          params: {
            "item_id": item_id.toString(),
            "variation_id": variation_id.toString(),
            "quantity": quantity.toString(),
          });

      // final dynamic responseData = response['body'];

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
