import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconWidget extends StatelessWidget {
  final String icon;
  final double size;
   IconWidget({required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(icon)
          )
      ),
    );
  }
}
