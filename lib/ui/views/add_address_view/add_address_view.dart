import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/add_address_view/add_address-controller.dart';
import 'package:flutter_templete/ui/views/change_location/change_location.dart';
import 'package:get/get.dart';

class AddAdressView extends StatefulWidget {
  const AddAdressView({super.key});

  @override
  State<AddAdressView> createState() => _AddAdressViewState();
}

class _AddAdressViewState extends State<AddAdressView> {
  AddAddressController controller = Get.put(AddAddressController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: screenHieght(18),
          ),
          Row(children: [
            InkWell(
                onTap: () {
                  Get.to(ChangeLocationView());
                },
                child: SvgPicture.asset('assets/images/arrow_back.svg')),
            SizedBox(
              width: screenWidth(60),
            ),
            Text(
              tr('key_add_new_address'),
              style: TextStyle(fontSize: 20),
            ),
          ]),
          SizedBox(
            height: screenHieght(30),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(80), bottom: screenHieght(200)),
            child: Text(
              tr("key_name"),
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(100)),
            child: CustomTextIFormField(
                hintText: tr("key_name"),
                controller: controller.name,
                fillColor: Colors.white,
                hintTextColor: AppColors.secondaryGreyhintVColor),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(100), bottom: screenHieght(200)),
            child: Text(
              tr('key_address_line'),
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          CustomTextIFormField(
              hintText: tr('key_address_line'),
              controller: controller.addressline,
              fillColor: Colors.white,
              hintTextColor: AppColors.secondaryGreyhintVColor),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(50), bottom: screenHieght(100)),
            child: Text(
              tr('key_city'),
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(100)),
            child: CustomTextIFormField(
                hintText: tr('key_city'),
                controller: controller.city,
                fillColor: Colors.white,
                hintTextColor: AppColors.secondaryGreyhintVColor),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(80), bottom: screenHieght(100)),
            child: Text(
              tr('key_state'),
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(100)),
            child: CustomTextIFormField(
                hintText: tr('key_state'),
                controller: controller.state,
                fillColor: Colors.white,
                hintTextColor: AppColors.secondaryGreyhintVColor),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(80), bottom: screenHieght(100)),
            child: Text(
              tr('key_zip_code'),
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          CustomTextIFormField(
              hintText: tr('key_zip_code'),
              controller: controller.zipcode,
              fillColor: Colors.white,
              hintTextColor: AppColors.secondaryGreyhintVColor),
          SizedBox(
            height: screenHieght(20),
          ),
          Center(
              child: CustomButton(
                  textColor: AppColors.mainWhiteVColor,
                  text: tr('key_save'),
                  onPressed: () {
                    controller.add();
                  }))
        ]),
      ),
    ));
  }
}
