import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import 'package:get/get.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var operationType = OperationType.NONE.obs;
  RxList<OperationType> operationTypeList = <OperationType>[].obs;
  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  bool get isLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.NONE);

  // bool get isCategoryLoading =>
  //     requestStatus == RequestStatus.LOADING &&
  //     operationTypeList.contains(OperationType.CATEGORY);

  bool get isProductsLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.PRODUCTS);
  bool get isCatLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.GATEGORY);

  // bool get isMealLoading =>
  //     requestStatus == RequestStatus.LOADING &&
  //     operationTypeList.contains(OperationType.MEAL);

  set setOperationType(OperationType value) {
    operationType.value = value;
  }

  Future runFutureFunction({
    required Future function,
    // OperationType? type = OperationType.NONE
  }) async {
    await function;
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    checkConnection(() async {
      requestStatus.value = RequestStatus.LOADING;
      operationType.value = type!;
      await function;
      requestStatus.value = RequestStatus.DEFAULT;
      operationType.value = OperationType.NONE;
    });
  }

  Future runFullLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    customLoader();
    await function;
    BotToast.closeAllLoading();
  }
}
