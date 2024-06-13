import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
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
    // Function from splashServices to navigate from splash screen
    splashServices.runTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: OrientationBuilder(
        builder: (context,orientation) {
          if(orientation == Orientation.portrait) {
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Padding(
                padding:  EdgeInsets.all(20.sp),
                child: Lottie.asset(
                    'assets/animations/splash_center.json',

                ),
              ),


            ],
          );
          } else {
            return Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Padding(
                  padding:  EdgeInsets.all(20.sp),
                  child: Lottie.asset(
                    'assets/animations/splash_center.json',

                  ),
                ),
              ],
            );
          }
        }
      ),
    );
  }
}
