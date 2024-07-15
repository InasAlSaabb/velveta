import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/sliderr_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/products_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class SliderrREpository {
  Future<Either<String, List<SliderrModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getSlider,
        body: {},
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          extraHeaders: {},
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<SliderrModel> resultList = [];
          commonResponse.getData['data']!.forEach(
            (element) {
              resultList.add(SliderrModel.fromJson(element));
            },
          );
          return Right(resultList);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
