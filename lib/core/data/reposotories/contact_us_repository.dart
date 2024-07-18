import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/contact_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/contact_us_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class ContactUsRepository {
  Future<Either<String, dynamic>> insertContact({
    required String email,
    required String message,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: ContactUsEndpoints.insertContact,
        body: {
          'email': email,
          'message': message,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        List<String> result = [];
        if (commonResponse.getStatus) {
          commonResponse.getData['data']!.forEach(
            (element) {
              result.add(element);
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, ContactModel>> Contact() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ContactUsEndpoints.contact,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(ContactModel.fromJson(commonResponse.getData!["data"]));
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
