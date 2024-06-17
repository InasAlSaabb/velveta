import 'package:flutter/material.dart';

// class CheckCircleWidget extends StatelessWidget {
//   final bool isChecked;
//   final double size;
//   final Color color;

//   CheckCircleWidget({
//     required this.isChecked,
//     this.size = 24.0,
//     this.color = Colors.green,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isChecked ? color : Colors.transparent,
//         border: Border.all(color: Colors.grey),
//       ),
//       child: isChecked
//           ? Icon(Icons.check, color: Colors.white, size: size * 0.6)
//           : null,
//     );
//   }
// }
class CheckCircleWidget extends StatefulWidget {
  final double size;
  final Color color;

  CheckCircleWidget({
    this.size = 24.0,
    this.color = Colors.white,
  });

  @override
  _CheckCircleWidgetState createState() => _CheckCircleWidgetState();
}

class _CheckCircleWidgetState extends State<CheckCircleWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? widget.color : Colors.transparent,
          border: Border.all(color: Colors.grey),
        ),
        child: isChecked
            ? Icon(Icons.check, color: Colors.black, size: widget.size * 0.6)
            : null,
      ),
    );
  }
}
