import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/bottom_Navigation.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';

class maincontroller extends BaseController {
  PageController controller = PageController(initialPage: 2);
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;

  BottomNavigationWidget getBottomNavigation() {
    BottomNavigationWidget bottomnav;
    bottomnav = BottomNavigationWidget(
      navitm: selected,
      ontap: (select, pagenumber) {
        controller.jumpToPage(pagenumber);

        selected = select;
      },
    );
    return bottomnav;
  }
}
