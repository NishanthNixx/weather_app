import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context,orientation) {
        if(orientation == Orientation.portrait) {
          return SizedBox(
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Lottie.asset('assets/animations/weather_loading.json',height: 40.h,width: 100.w),
              SizedBox(
                height: 1.h,
              ),
              const Text('Loading Weather...')
            ],
          ),
        );
        } else {
          return SizedBox(
            height: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15.w,
                ),
                Lottie.asset('assets/animations/weather_loading.json',height: 40.w,width: 100.h),
                SizedBox(
                  height: 1.w,
                ),
                const Text('Loading Weather...')
              ],
            ),
          );
        }
      }
    );
  }
}
