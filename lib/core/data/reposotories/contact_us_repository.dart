import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/contact_us_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

import '../models/apis/token_info.dart';

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
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        List<String> result = [];
        if (commonResponse.getStatus) {
          commonResponse.data!.forEach(
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
}
