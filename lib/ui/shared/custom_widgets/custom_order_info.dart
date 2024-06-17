import 'package:flutter/material.dart';

class OrdrInfoItem extends StatelessWidget {
  const OrdrInfoItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
        Spacer(),
        Text(value, textAlign: TextAlign.center, style: TextStyle(fontSize: 15))
      ],
    );
  }
}
