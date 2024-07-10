import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({
    Key? key,
    required this.switchValue,
    this.onChanged,
  }) : super(key: key);

  final ValueChanged<bool>? onChanged;
  bool switchValue = false;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlutterSwitch(
          inactiveColor: AppColors.mainWhiteColor,
          inactiveSwitchBorder: Border.all(
            width: 1,
            color: AppColors.mainGreyColor,
          ),
          activeToggleColor: AppColors.mainWhiteColor,
          toggleColor: AppColors.mainbluecolor,
          activeToggleBorder: Border.all(
            width: 1,
            color: AppColors.transparentColor,
          ),
          inactiveToggleColor: AppColors.mainRedColor,
          width: screenWidth(10),
          height: screenHieght(43),
          toggleSize: screenHieght(40),
          value: widget.switchValue,
          borderRadius: screenWidth(22),
          activeColor: AppColors.mainGreenColor,
          onToggle: (bool value) {
            setState(() {
              widget.switchValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
      ),
    );
  }
}
