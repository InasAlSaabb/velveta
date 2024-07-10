import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class ColorItem extends StatelessWidget {
  final String color;
  final bool isSelected;
  final Function() onTap;

  ColorItem({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Center(
          child: isSelected
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                )
              : null,
        ),
        width: screenWidth(15),
        height: screenHieght(15),
        decoration: BoxDecoration(
          color: Color(hexColor(color)),
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
        ),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
