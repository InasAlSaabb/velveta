import 'package:flutter_templete/core/data/reposotories/policy_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class PolicyViewController extends BaseController {
  Rx<String> policyInfo = ''.obs;
  @override
  void onInit() async {
    getPolicyinfo();

    super.onInit();
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  Future<void> getPolicyinfo() async {
    runLoadingFutureFunction(
        type: OperationType.PROFILE,
        function: PolicyRepository().getPolicyinfo().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            policyInfo.value = r;
          });
        }));
  }
}
