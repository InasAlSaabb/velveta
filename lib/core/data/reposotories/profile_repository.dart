import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/profile_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/profile_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class ProfileRepository {
  Future<Either<String, ProfileModel>> getPrfileInfo() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProfileEndpoints.getinfoP,
        headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.GET,
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            }),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);
      ProfileModel model = ProfileModel.fromJson(
          commonResponse.getData['data'] as Map<String, dynamic>);
      if (commonResponse.getStatus) {
        return Right(model);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> deletAccount() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: ProfileEndpoints.deletAccount,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          type: RequestType.POST,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(commonResponse.getData['messages']['successMessage']);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> editProfile(
      {required String first_name,
      required String last_name,
      required String country_code,
      required email,
      required String phone}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: ProfileEndpoints.editProfile,
        body: {
          "first_name": first_name,
          "last_name": last_name,
          "country_code": country_code,
          "email": email,
          "phone": phone
        },
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          type: RequestType.POST,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(commonResponse.getData['messages']['successMessage']);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
