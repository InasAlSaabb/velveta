import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_begin_main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_G.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_form_field.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/edit_profile/edit_profile_view_controller.dart';
import 'package:flutter_templete/ui/views/resetpassword_view/resetpassword_view.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  EditProfileViewController editControler =
      Get.put(EditProfileViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Form(
          key: editControler.formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              screenHieght(18).ph,
              CustomBeginMain(
                text: tr("edit_profile"),
                onTap: () {},
              ),
              screenHieght(18).ph,
              CustomTextFormfield(
                iscount: false,
                isborder: true,
                controller: editControler.firstNameController,
                hintColor: AppColors.blacktext,
                hint: tr("user_name"),
                hieght: screenHieght(15),
                bordercolor: AppColors.blacktext,
                radius: 1,
                fillColor: AppColors.whitecolor,
                text: tr("first_name"),
                width: 1.5,
              ),
              screenHieght(45).ph,
              CustomTextFormfield(
                iscount: false,
                isborder: true,
                controller: editControler.larstNameController,
                hintColor: AppColors.blacktext,
                hint: tr("last_name"),
                hieght: screenHieght(15),
                bordercolor: AppColors.blacktext,
                radius: 1,
                fillColor: AppColors.whitecolor,
                text: tr("last_name"),
                width: 1.5,
              ),
              screenHieght(45).ph,
              CustomTextFormfield(
                iscount: false,
                isborder: true,
                text: tr("email"),
                hintColor: AppColors.blacktext,
                hint: tr("user_gmail"),
                hieght: screenHieght(15),
                bordercolor: AppColors.blacktext,
                radius: 1,
                controller: editControler.emailController,
                fillColor: AppColors.whitecolor,
                width: 1.5,
              ),
              screenHieght(45).ph,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: tr("phone_number"),
                    colortext: AppColors.blacktext,
                  ),
                  screenHieght(80).ph,
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      editControler.selectedCountryCode.value =
                          number.dialCode!;
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        trailingSpace: false),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(color: Colors.black),
                    initialValue: editControler.number.value,
                    textFieldController: editControler.phoneController,
                    formatInput: true,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide:
                            BorderSide(color: AppColors.blacktext, width: 1.5)),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                      editControler.selectedCountryCode.value =
                          number.dialCode!;
                    },
                  )
                ],
              ),
              screenHieght(30).ph,
              CBG(
                  isSide: false,
                  onPressed: () {
                    editControler.editProfile();
                  },
                  width: screenWidth(1),
                  hieght: screenHieght(15),
                  shape: BeveledRectangleBorder(),
                  text: tr("save"),
                  background: AppColors.blacktext,
                  colorText: AppColors.whitecolor),
              screenHieght(30).ph,
              SizedBox(
                width: screenWidth(1),
                child: InkWell(
                  onTap: () {
                    Get.to(ResetPasswordView());
                  },
                  child: CustomText(
                    text: tr("reset_password"),
                    colortext: AppColors.blacktext,
                    fonttext: screenWidth(25),
                  ),
                ),
              ),
              screenHieght(80).ph,
              InkWell(
                onTap: () {
                  editControler.deletAccount();
                },
                child: SizedBox(
                  width: screenWidth(1),
                  child: CustomText(
                    text: tr("delet_account"),
                    fonttext: screenWidth(25),
                    colortext: AppColors.redcolor,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
