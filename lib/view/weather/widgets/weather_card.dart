
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'icon_widget.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  final double height;
  const WeatherCard({super.key, required this.icon, required this.title, required this.value, required this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
      )
      ,
      child:
      Container(
        height: height,
        width: 35.w,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:10.sp,horizontal: 15.sp),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconWidget(icon: icon,size: 10.w,),

                SizedBox(
                  height: 1.h,
                ),
                Text(value,style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(
                  height: .5.h,
                ),
                Text(title,style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500
                ),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
