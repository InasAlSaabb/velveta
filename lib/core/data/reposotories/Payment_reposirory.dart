import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/payment_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class PaymentReposirory {
  Future<Either<String, String>> Pay(
      {required String payment_id,
      required String payment_status,
      required String order_id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: PaymentEnsPoints.Pay,
          headers: NetworkConfig.getHeaders(
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            },
            needAuth: false,
            type: RequestType.POST,
          ),
          params: {
            "order_id": order_id.toString(),
            "payment_id": payment_id.toString(),
            "payment_status": payment_status.toString()
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

  Future<Either<String, String>> PayFailed(
      {required String payment_id,
      required String payment_status,
      required String order_id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: PaymentEnsPoints.failedpay,
          headers: NetworkConfig.getHeaders(
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            },
            needAuth: false,
            type: RequestType.POST,
          ),
          params: {
            "payment_id": payment_id.toString(),
            "payment_status": payment_status.toString(),
            "order_id": payment_status.toString()
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
}
