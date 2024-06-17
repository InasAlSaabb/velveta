import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/token_info.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/user_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/core/utils/network_util.dart';
import 'package:http/http.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> Login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndpoints.login,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'email': email,
            'password': password,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(
            commonResponse.data2 ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }

  Future<Either<String, bool>> register({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        body: {
          'first_name': first_name,
          'last_name': last_name,
          'email': email,
          'password': password,
        },
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
          extraHeaders: {
            // 'Host': 're-project-8pu1.onrender.com',
          },
        ),
      ).then(
        (response) {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.getStatus);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> verfiy({
    required String email,
    required String otp,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.verfiy,
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
        ),
        body: {"email": email, "otp": otp.toString()},
      ).then(
        (response) {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            int token = commonResponse.data2?["token"] ?? '';
            print(token);
            storage.setToken(token);
            return Right(commonResponse.getStatus);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> sendotp({
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.send_otp,
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
        ),
        body: {
          "email": email,
        },
      ).then(
        (response) {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.getStatus);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.reset,
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
        ),
        body: {
          "email": email,
          "otp": otp,
          "password": password,
          "password_confirmation": password_confirmation,
        },
      ).then(
        (response) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.getStatus);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
