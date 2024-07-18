import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/policy_view/policy_view_controller.dart';
import 'package:get/get.dart';

class PolicyView extends StatefulWidget {
  const PolicyView({super.key});

  @override
  State<PolicyView> createState() => _PolicyViewState();
}

class _PolicyViewState extends State<PolicyView> {
  PolicyViewController policyController = Get.put(PolicyViewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      body: Obx(() {
        return policyController.isLoading
            ? SpinKitCircle(
                color: AppColors.mainGreyColor,
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHieght(40),
                    ),
                    Text(
                      policyController.policyInfo.value,
                      style: TextStyle(
                          fontSize: screenWidth(28),
                          color: AppColors.blacktext),
                    )
                  ],
                ),
              );
      }),
    ));
  }
}
