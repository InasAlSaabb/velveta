import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/my_order_model.dart';
import 'package:flutter_templete/core/data/models/my_order_pay.dart';
import 'package:flutter_templete/core/data/models/order_by_id_all_info_model.dart';
import 'package:flutter_templete/core/data/models/order_by_id_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/my_order_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class MyOrderRepository {
  Future<Either<String, List<MyOrderModel>>> getOrder() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: MyOrderEndpoints.getOrder,
        headers: NetworkConfig.getHeaders(
          extraHeaders: {
            "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
          },
          needAuth: false,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<MyOrderModel> result = [];

          commonResponse.getData['data']!.forEach(
            (element) {
              result.add(MyOrderModel.fromJson(element));
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

  Future<Either<String, String>> submitOrder(
      {required int basket_id, required int address_id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: MyOrderEndpoints.submitOrder,
        headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.POST,
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            }),
        params: {
          "basket_id": basket_id.toString(),
          "address_id": address_id.toString(),
        },
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          storage.setOrderInfo(
              OrderPayModel.fromJson(commonResponse.getData['data']!));
          return Right(commonResponse.getData['messages']);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<OrderByIdModel>>> getOrderById(
      {required int order_id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: MyOrderEndpoints.getOrderyId,
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            },
          ),
          params: {"order_id": order_id.toString()}).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<OrderByIdModel> result = [];

          commonResponse.getData['data']['products'].forEach(
            (element) {
              result.add(OrderByIdModel.fromJson(element));
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

  Future<Either<String, OrderByIdAllInfoModel>> getOrderByIdInfo(
      {required int order_id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: MyOrderEndpoints.getOrderyId,
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            },
          ),
          params: {"order_id": order_id.toString()}).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          OrderByIdAllInfoModel model = OrderByIdAllInfoModel.fromJson(
              commonResponse.getData['data'] as Map<String, dynamic>);

          return Right(model);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> reOrder({required int order_id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: MyOrderEndpoints.reOrder,
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            extraHeaders: {
              "Authorization": "Bearer ${storage.getTokenInfo()!.token}"
            },
          ),
          params: {"order_id": order_id.toString()}).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getData['data']!);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
