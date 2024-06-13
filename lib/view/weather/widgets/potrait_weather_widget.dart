import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'icon_widget.dart';

class PotraitWeatherWidget extends StatelessWidget {
  final WeatherState state;
  const PotraitWeatherWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 4.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 5.w,),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: IconWidget(icon: 'assets/icons/arrow.png', size: 35.sp)),
                Spacer(),

                Icon(Icons.location_on,color: Colors.red,size: 28.sp,),
                Text(state.weather.data!.location!.name!,style: Theme.of(context).textTheme.displaySmall,),
                Spacer(),
                GestureDetector(
                    onTap: (){
                      context.read<WeatherBloc>().add(FetchWeather(searchQuery: state.weather.data!.location!.name!));

                    },
                    child: IconWidget(icon: 'assets/icons/refresh.png', size: 30.sp)),

                SizedBox(width: 5.w,),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 0),
              child: Text(state.weather.data!.location!.country!,style: Theme.of(context).textTheme.titleLarge,),
            ),
            SizedBox(height: 2.h,),

            Padding(
              padding:  EdgeInsets.all(10.sp),
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(color:Colors.grey.shade100,width: 3),
                  // borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: Padding(
                  padding:  EdgeInsets.all(10.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Spacer(),
                      // SizedBox(width: 2.w,),
                      Container(
                        height: 80.sp,
                        width: 15.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icons/temperature.png'),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      SizedBox(width: 2.w,),

                      RichText(
                        text:  TextSpan(
                          children: [
                            TextSpan(text: state.weather.data!.current!.tempC!.toInt().toString(),
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontSize: 80.sp,
                                // letterSpacing: 0.1,

                              ),
                            ),
                            WidgetSpan(
                              child: Transform.translate(
                                offset:  Offset(0.0,  -40.sp),
                                child: Text(
                                  "\u2103",
                                  style:Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontSize: 30.sp,
                                    // letterSpacing: 0.1,

                                    // fontFeatures: [ FontFeature.superscripts()]
                                  ),
                                ),
                              ),
                            ),
                            // TextSpan(
                            //   text: "\u2103",
                            //   style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            //       fontSize: 40.sp,
                            //       fontFeatures: [ FontFeature.superscripts()]
                            //   ),
                            // ),
                            // TextSpan(text: '/',
                            //   style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            //       fontSize: 80.sp,
                            //       letterSpacing: 0.1,
                            //       fontWeight: FontWeight.w100,
                            //       color: ThemeConfig.textColorBCBFC2
                            //   ),
                            // ),
                            // TextSpan(text: state.weather.data!.current!.tempF!.toInt().toString(),
                            //   style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            //       letterSpacing: 0.1,
                            //       fontSize: 30.sp,
                            //       color: ThemeConfig.textColorBCBFC2
                            //
                            //   ),
                            // ),
                            // WidgetSpan(
                            //   child: Transform.translate(
                            //     offset:  Offset(0.0,  -15.sp),
                            //     child: Text(
                            //       "\u2109",
                            //       style:Theme.of(context).textTheme.displayLarge?.copyWith(
                            //         fontSize: 10.sp,
                            //           color: ThemeConfig.textColorBCBFC2
                            //
                            //         // fontFeatures: [ FontFeature.superscripts()]
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Spacer(),

                      // RichText(
                      //   text:  TextSpan(
                      //     children: [
                      //
                      //       TextSpan(text: state.weather.data!.current!.tempF!.toInt().toString(),
                      //         style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      //             // letterSpacing: 0.1,
                      //             fontSize: 35.sp,
                      //             color: ThemeConfig.textColorBCBFC2
                      //
                      //         ),
                      //       ),
                      //       WidgetSpan(
                      //         child: Transform.translate(
                      //           offset:  Offset(0.0,  -15.sp),
                      //           child: Text(
                      //             "\u2109",
                      //             style:Theme.of(context).textTheme.displayLarge?.copyWith(
                      //               fontSize: 10.sp,
                      //                 color: ThemeConfig.textColorBCBFC2
                      //
                      //               // fontFeatures: [ FontFeature.superscripts()]
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //
                      //
                      // Spacer(),
                      // SizedBox(width: 7.w,),

                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: .5.h,
            // ),
            Center(
              child: Text('Temperature',style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500
              ),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child:Card(
                color: Colors.white,

                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child:
                Container(
                  // height: 12.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    // border: Border.all(color: Colors.grey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.white,
                    //     blurRadius: 12,
                    //     spreadRadius: 1,
                    //     offset: Offset(-3, -3)
                    //   ),
                    //   BoxShadow(
                    //       color: Colors.grey.shade300,
                    //       blurRadius: 12,
                    //       spreadRadius: 1,
                    //       offset: Offset(3, 3)
                    //   )
                    // ]
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        Image.network('https:${state.weather.data!.current!.condition!.icon!}',
                          // height: 10.w,
                          // width: 10.w,
                          // fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("${state.weather!.data!.current!.condition!.text}",textAlign:TextAlign.center,style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600
                        ),),
                        SizedBox(
                          height: .5.h,
                        ),
                        Text('Weather',style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                ),
              ),

            ),

            SizedBox(height: 5.h,),
            Center(
              child: Card(
                color: Colors.white,

                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                ),
                child:
                Container(
                  width: 90.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    // border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Max Temp',style: Theme.of(context).textTheme.bodyLarge,),

                            Row(
                              children: [
                                IconWidget(icon: 'assets/icons/max_temp.png', size: 6.w),
                                // Icon(Icons.thermostat),
                                Text(' '+state.weather.data!.forecast!.forecastday![0].day!.maxtempC!.toString(),style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600
                                ),),
                                Text("\u2103",style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text('Min Temp:',style: Theme.of(context).textTheme.bodyLarge,),

                            Row(
                              children: [
                                IconWidget(icon: 'assets/icons/min_temp.png', size: 6.w),

                                Text(' '+state.weather.data!.forecast!.forecastday![0].day!.mintempC!.toString(),style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600
                                ),),
                                Text("\u2103",style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        )
                        // )


                        // SizedBox(
                        //   height: 30.h,
                        //   width: 90.w,
                        //   child: Image.network('https://cdn.weatherapi.com/weather/64x64/day/122.png',
                        //   fit: BoxFit.cover,
                        //   ),
                        // )
                      ],
                    ),
                  ) ,
                ),
              ),
            ),

            SizedBox(height: 3.h,),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                  ,
                  child:
                  Container(
                    height: 18.h,
                    width: 35.w,
                    decoration: BoxDecoration(
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
                            IconWidget(icon: 'assets/icons/cloud.png',size: 10.w,),

                            //  Container(
                            // height: 10.w,
                            // width: 10.w,
                            // decoration: BoxDecoration(
                            // image: DecorationImage(
                            // image: AssetImage('assets/icons/cloud.png')
                            // )
                            // ),
                            // ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text("${state.weather!.data!.current!.windKph!} km/h",style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600
                            ),),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text('Wind',style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Colors.grey,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500
                            ),),


                            // Image.ass('https://cdn.weatherapi.com/weather/64x64/day/122.png',
                            //   // fit: BoxFit.cover,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                // Card(
                //   color: Color(0xfff1cfce).withOpacity(0.5),
                //
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(15))
                //   )
                //   ,
                //   child:
                Card(
                  color: Colors.white,
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                  ,
                  child:
                  Container(
                    height: 18.h,
                    width: 35.w,

                    // width: 40.w,
                    decoration: BoxDecoration(
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
                            IconWidget(icon: 'assets/icons/humidity.png',size: 10.w,),
                            // Container(
                            //   height: 10.w,
                            //   width: 10.w,
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           image: AssetImage('assets/icons/humidity.png')
                            //       )
                            //   ),
                            // ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text("${state.weather!.data!.current!.humidity!}%",style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600
                            ),),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text('Humidity',style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Colors.grey,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500
                            ),),


                            // Image.ass('https://cdn.weatherapi.com/weather/64x64/day/122.png',
                            //   // fit: BoxFit.cover,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 12.h,
                //   width: 40.w,
                //   decoration: BoxDecoration(
                //     color: Color(0xffc4e9ee).withOpacity(0.5),
                //       borderRadius: BorderRadius.all(Radius.circular(15))
                //   ),
                //   child: Center(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text('Humidity:'),
                //         Row(
                //           mainAxisSize: MainAxisSize.min,
                //
                //           children: [
                //             Container(
                //               height: 10.w,
                //               width: 10.w,
                //               decoration: BoxDecoration(
                //                   image: DecorationImage(
                //                       image: AssetImage('assets/icons/humidity.png')
                //                   )
                //               ),
                //             ),
                //             SizedBox(
                //               width: 3.w,
                //             ),
                //             Text("${state.weather!.data!.current!.humidity!} %",style: Theme.of(context).textTheme.displayLarge?.copyWith(
                //                 fontSize: 18.sp
                //             ),),
                //           ],
                //         )
                //         // Image.ass('https://cdn.weatherapi.com/weather/64x64/day/122.png',
                //         //   // fit: BoxFit.cover,
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
                // ),
              ],
            ),

          ]
      ),
    );
  }
}
