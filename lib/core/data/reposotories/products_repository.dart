import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/ProductDetail_model.dart';
import 'package:flutter_templete/core/data/models/address_model.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/product_id_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/address_endpoints.dart';
import 'package:flutter_templete/core/data/network/endpoints/products_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class getProductsRepository {
  // Future<Either<String, List<CategoryModel>>> getproductsbycategory(
  //     {required String category}) async {
  //   try {
  //     return NetworkUtil.sendRequest(
  //       type: RequestType.GET,
  //       url: ProductsEndpoints.getproductsbycategory+id
  //       headers: NetworkConfig.getHeaders(
  //         needAuth: false,
  //         type: RequestType.GET,
  //       ),
  //     ).then((response) {
  //       CommonResponse<List<dynamic>> commonResponse =
  //           CommonResponse.fromJson(response);
  //       if (commonResponse.getStatus) {
  //         List<ProductsModel> resultList = [];
  //         commonResponse.data!.forEach(
  //           (element) {
  //             resultList.add(ProductsModel.fromJson(element));
  //           },
  //         );
  //         return Right(resultList);
  //       } else {
  //         return Left(commonResponse.message ?? '');
  //       }
  //     });
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }

  Future<Either<String, List<CategoryModel>>> getAll({String? category}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getAll,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<CategoryModel> resultList = [];
          commonResponse.data!.forEach(
            (element) {
              resultList.add(CategoryModel.fromJson(element));
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

  Future<Either<String, List<ProductIdModel>>> getproductsbyid(
      {required int id}) async {
    try {
      return NetworkUtil.sendRequest(
        params: {"id": id},
        type: RequestType.GET,
        url: ProductsEndpoints.getproductsbycategory,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<ProductIdModel> resultList = [];
          commonResponse.data!.forEach(
            (element) {
              resultList.add(ProductIdModel.fromJson(element));
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
