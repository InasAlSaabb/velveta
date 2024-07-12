import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/about_us_view/about_us_controller.dart';
import 'package:get/get.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  AboutUsController controller = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SizedBox(
            height: screenHieght(18),
          ),
          Row(children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset('assets/images/arrow_back.svg')),
            SizedBox(
              width: screenWidth(60),
            ),
            Text(
              tr('key_about_us'),
              style: TextStyle(fontSize: 20),
            ),
          ]),
          SizedBox(
            height: screenHieght(20),
          ),
          Container(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/VELVETA.png',
                  height: screenHieght(20),
                ),
                SizedBox(
                  height: screenHieght(80),
                ),
                Text('velveta for mobile V 0.1')
              ],
            ),
          )
        ]),
      ),
    );
  }
}
