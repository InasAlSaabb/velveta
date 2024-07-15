import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/favorite_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/favorite_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class FavoriteRepository {
  Future<Either<String, List<FavoriteModel>>> getFavorites() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: FavoriteEndpoints.getfavorites,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          type: RequestType.GET,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<FavoriteModel> result = [];

        commonResponse.getData["data"]!.forEach(
          (element) {
            result.add(FavoriteModel.fromJson(element));
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

  Future<Either<String, String>> addFavorite(
      {required int product_id, required int variation_id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: FavoriteEndpoints.addfavorite,
          headers: NetworkConfig.getHeaders(
            needAuth: true,
            type: RequestType.POST,
          ),
          params: {
            "product_id": product_id.toString(),
            "variation_id": variation_id.toString()
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

  Future<Either<String, String>> deletFavorite(
      {required int product_id, required int variation_id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.DELETE,
          url: FavoriteEndpoints.deletfavorite,
          headers: NetworkConfig.getHeaders(
            needAuth: true,
            type: RequestType.DELETE,
          ),
          params: {
            "product_id": product_id.toString(),
            "variation_id": variation_id.toString()
          });

      // final dynamic responseData = response['body'];

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);
      // ProfileModel model = commonResponse.data! as ProfileModel;

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
