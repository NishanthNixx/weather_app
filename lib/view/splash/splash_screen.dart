import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashServices splashServices = SplashServices(); // Instance of SplashServices for handling splash screen logic

  @override
  void initState() {
    super.initState();
    // Calls the [checkAuthentication] method from [SplashServices] to handle authentication logic
    splashServices.runTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     gradient: SweepGradient(
      //       colors: [Color(0xff00fff0), Color(0xff0083fe)],
      //       stops: [0, 1],
      //       center: Alignment.bottomRight,
      //     )
      //
      //
      //
      // ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: OrientationBuilder(
          builder: (context,orientation) {
            if(orientation == Orientation.portrait)
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // SizedBox(height: 10.h,),
                Padding(
                  padding:  EdgeInsets.all(20.sp),
                  child: Lottie.asset(
                      'assets/animations/splash_center.json',
                    // fit: BoxFit.fill,
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    // animate: true,
                    // repeat: true
                  ),
                ),
                  // TextLiquidFill(
                  //   loadDuration: Duration(
                  //     seconds: 3
                  //   ),
                  //   text: 'WEATHER',
                  //   waveColor: Colors.blueAccent,
                  //   boxBackgroundColor: Colors.white,
                  //   textStyle: TextStyle(
                  //     fontSize: 30.sp,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   boxHeight: 30.sp,
                  //   // boxWidth: 45.w,
                  // )

                // Spacer(),
                // Lottie.asset(
                //     'assets/animations/splash_bg.json',
                // ),
                // Text('Weather App',style: TextStyle(
                //     fontSize: 50.sp,
                //     fontWeight: FontWeight.w800
                // ),),

              ],
            );
            else
              return Row(
                // children: [
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // SizedBox(height: 10.h,),
                  Padding(
                    padding:  EdgeInsets.all(20.sp),
                    child: Lottie.asset(
                      'assets/animations/splash_center.json',
                      // fit: BoxFit.fill,
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      // animate: true,
                      // repeat: true
                    ),
                  ),
                ],
              );
          }
        ),
      ),
    );
  }
}
