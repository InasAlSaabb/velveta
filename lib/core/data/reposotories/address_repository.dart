import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/address_get_model.dart';
import 'package:flutter_templete/core/data/models/address_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/address_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class AddressRepository {
  Future<Either<String, Map>> addAddress({
    required String city,
    required String state,
    required String zip_code,
    required String name,
    required String address_line,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: AddressEndpoints.addAddress,
        body: {
          "city": city,
          "state": state,
          "zip_code": zip_code,
          "name": name,
          "address_line": address_line,
        },
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getData['data'] ?? {});
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<AddressGetModel>>> getAllAddress() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: AddressEndpoints.getAllAdress,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      );

      // final dynamic responseData = response['body'];

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<AddressGetModel> result = [];

        commonResponse.getData['data']!.forEach(
          (element) {
            result.add(AddressGetModel.fromJson(element));
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

  Future<Either<String, dynamic>> delete({required int id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: AddressEndpoints.deleteAddress,
        body: {"id": id},
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getData['data'] ?? {});
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
