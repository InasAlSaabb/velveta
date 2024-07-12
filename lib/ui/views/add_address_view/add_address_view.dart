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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: screenHieght(30),
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
            height: screenHieght(20),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(100), bottom: screenHieght(100)),
            child: Text(
              'Address Line',
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          CustomTextIFormField(
              hintText: 'Address Line',
              controller: controller.addressline,
              fillColor: Colors.white,
              hintTextColor: AppColors.secondaryGreyhintVColor),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(25), bottom: screenHieght(100)),
            child: Text(
              'City',
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(40)),
            child: CustomTextIFormField(
                hintText: 'City',
                controller: controller.city,
                fillColor: Colors.white,
                hintTextColor: AppColors.secondaryGreyhintVColor),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(80), bottom: screenHieght(100)),
            child: Text(
              'Name',
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(40)),
            child: CustomTextIFormField(
                hintText: 'name',
                controller: controller.name,
                fillColor: Colors.white,
                hintTextColor: AppColors.secondaryGreyhintVColor),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(80), bottom: screenHieght(100)),
            child: Text(
              'state',
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenHieght(25)),
            child: CustomTextIFormField(
                hintText: 'state',
                controller: controller.state,
                fillColor: Colors.white,
                hintTextColor: AppColors.secondaryGreyhintVColor),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHieght(80), bottom: screenHieght(100)),
            child: Text(
              'Zip Code',
              style: TextStyle(fontSize: 20, fontFamily: 'Welcome'),
            ),
          ),
          CustomTextIFormField(
              hintText: 'Zip Code',
              controller: controller.zipcode,
              fillColor: Colors.white,
              hintTextColor: AppColors.secondaryGreyhintVColor),
          SizedBox(
            height: screenHieght(20),
          ),
          Center(
              child: CustomButton(
                  text: 'Save',
                  onPressed: () {
                    controller.add();
                  }))
        ]),
      ),
    ));
  }
}
