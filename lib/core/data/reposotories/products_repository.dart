import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/var_model.dart';
import 'package:flutter_templete/core/data/models/available_shape_model.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/color_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/mat_product.dart';
import 'package:flutter_templete/core/data/models/produc_feature_model.dart';
import 'package:flutter_templete/core/data/models/product_id_model.dart';
import 'package:flutter_templete/core/data/models/products_by_id_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/products_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class getProductsRepository {
  Future<Either<String, List<ProductsByIDModel>>> getProductsByCategoryId(
      {required int id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: "/en/api/products",
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.GET,
          ),
          params: {"category_id": id.toString()}).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<ProductsByIDModel> resultList = [];
          commonResponse.getData['data'].forEach(
            (element) {
              resultList.add(ProductsByIDModel.fromJson(element));
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

  Future<Either<String, VariationsModel>> getVariations(
      {required int id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getproductsbyId,
        params: {"product_id": id.toString()},
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          VariationsModel model = VariationsModel(
            variations: (commonResponse.getData['variations'] as List)
                .map((e) => Variation.fromJson(e))
                .toList(),
            attributesGrouped: (commonResponse.getData['attributesGrouped']
                    as Map<String, dynamic>)
                .map(
              (key, value) => MapEntry(
                key,
                (value as List)
                    .map((e) => AttributeGrouped.fromJson(e))
                    .toList(),
              ),
            ),
          );
          return Right(model);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getProductsByCategoryIdth(
      {required int id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: "/en/api/products",
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.GET,
          ),
          params: {"category_id": id.toString()}).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<String> resultList = [];

          commonResponse.getData['data']!.forEach(
            (element) {
              resultList.add(element);
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

  Future<Either<String, List<CategoryModel>>> getAll() async {
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
          commonResponse.getData['data']!.forEach(
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

  Future<Either<String, dynamic>> getproductsbyid({required int id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: ProductsEndpoints.getproductsbycategory,
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.GET,
          ),
          params: {"product_id": id.toString()}).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<ProductIdModel> resultList = [];
          commonResponse.getData['data']!.forEach(
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

  Future<Either<String, ProductFearuresModel>> getFeatureOfProduct(
      {required int id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getproductsbyId,
        params: {"product_id": id.toString()},
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          ProductFearuresModel model = ProductFearuresModel.fromJson(
              commonResponse.getData['data'] ?? {});
          return Right(model);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, VariationsModel>> getMatofProduct(
      {required int id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getproductsbyId,
        params: {"product_id": id.toString()},
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          VariationsModel model =
              VariationsModel.fromJson(commonResponse.getData ?? {});
          return Right(model);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, VariationModel>> getVar({
    required int id,
    required int color_id,
    required int shape_id,
    required String material_id,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getavalvar,
        params: {
          "product_id": id.toString(),
          "color_id": color_id.toString(),
          "shape_id": shape_id.toString(),
          "material_id": material_id.toString()
        },
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          VariationModel model =
              VariationModel.fromJson(commonResponse.getData ?? {});
          return Right(model);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, ProductFearuresModel>> getProducts(
      {required int id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: ProductsEndpoints.getPRoduct,
          headers: NetworkConfig.getHeaders(
            needAuth: true,
            type: RequestType.GET,
          ),
          params: {"product_id": id.toString()});

      // final dynamic responseData = response['body'];

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        // List<ProductFearuresModel> result = [];

        // commonResponse.data!.forEach(
        //   (element) {
        //     result.add(ProductFearuresModel.fromJson(element));
        //   },
        // );
        // result.addAll(commonResponse.data!.map(
        //   (element) => ProductFearuresModel.fromJson(element),
        // ));
        ProductFearuresModel model = ProductFearuresModel.fromJson(
            commonResponse.getData['data'] as Map<String, dynamic>);
        return Right(model);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ColorModel>>> getColor(
      {required int product_id,
      required int shape_id,
      required String material_id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getcolorforshape,
        params: {
          "product_id": product_id.toString(),
          "shape_id": shape_id.toString(),
          "material_id": material_id.toString(),
        },
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<ColorModel> result = [];

        commonResponse.getData.forEach(
          (element) {
            result.add(ColorModel.fromJson(element));
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

  Future<Either<String, List<AvailableshapeModel>>> getShape(
      {required int product_id, required String material_id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getshapeformaterial,
        params: {
          "product_id": product_id.toString(),
          "material_id": material_id.toString()
        },
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<AvailableshapeModel> result = [];

        commonResponse.getData.forEach(
          (element) {
            result.add(AvailableshapeModel.fromJson(element));
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
}
