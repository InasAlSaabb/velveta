import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/social_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class SocialRepository {
  Future<Either<String, String>> getSocialFace() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SocialEndpoints.social,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          type: RequestType.GET,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(commonResponse.getData!["data"]['facebook']);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> getSocialInsta() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SocialEndpoints.social,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          type: RequestType.GET,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(commonResponse.getData!["data"]['instagram']);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
