import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/policy_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class PolicyRepository {
  Future<Either<String, String>> getPolicyinfo() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: PolicyEndPoints.getPolicy,
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.GET),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        // log(response["response"]);
        return Right(commonResponse.getData!);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
