import 'package:flutter_templete/core/data/models/profile_model.dart';
import 'package:flutter_templete/core/data/reposotories/profile_repository.dart';
import 'package:flutter_templete/core/data/reposotories/social_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileViewController extends BaseController {
  RxString facUrl = ''.obs;
  RxString instaUrl = ''.obs;

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  Rx<ProfileModel> profileList = ProfileModel(
          city: '',
          countryCode: '',
          email: '',
          firstName: '',
          lastName: '',
          phone: '',
          state: '',
          zipCode: '')
      .obs;

  @override
  void onInit() async {
    getProfileInfo();
    getSocialFac();
    getSocialInsta();
    super.onInit();
  }

  Future<void> getProfileInfo() async {
    runLoadingFutureFunction(
        type: OperationType.CCC,
        function: ProfileRepository().getPrfileInfo().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            profileList.value = r;
            print(r);
          });
        }));
  }

  Future<void> getSocialFac() async {
    runLoadingFutureFunction(
        type: OperationType.BBB,
        function: SocialRepository().getSocialFace().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            facUrl.value = r;
            print(r);
          });
        }));
  }

  Future<void> getSocialInsta() async {
    runLoadingFutureFunction(
        type: OperationType.AAA,
        function: SocialRepository().getSocialInsta().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            // CustomToast.showMessage(
            //     message: "succed", messageType: MessageType.SUCCESS);
            instaUrl.value = r;
            print(r);
          });
        }));
  }
}
