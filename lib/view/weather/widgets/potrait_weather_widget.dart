import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/view/weather/widgets/weather_card.dart';

import 'icon_widget.dart';

class PortraitWeatherWidget extends StatelessWidget {
  final WeatherState state;
  const PortraitWeatherWidget({super.key, required this.state});

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
                const Spacer(),

                Icon(Icons.location_on,color: Colors.red,size: 28.sp,),
                Text(state.weather.data!.location!.name!,style: Theme.of(context).textTheme.displaySmall,),
                const Spacer(),
                GestureDetector(
                    onTap: (){
                      context.read<WeatherBloc>().add(FetchWeather(searchQuery: state.weather.data!.location!.name!));

                    },
                    child: IconWidget(icon: 'assets/icons/refresh.png', size: 30.sp)),

                SizedBox(width: 5.w,),
              ],
            ),
            Text(state.weather.data!.location!.country!,style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 2.h,),

            Padding(
              padding:  EdgeInsets.all(10.sp),
              child: Padding(
                padding:  EdgeInsets.all(10.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    const Spacer(),

                    Container(
                      height: 80.sp,
                      width: 15.w,
                      decoration: const BoxDecoration(
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

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),


                  ],
                ),
              ),
            ),

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
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child:
                Container(
                  // height: 12.h,
                  width: 50.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.all(Radius.circular(15)),

                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        Image.network('https:${state.weather.data!.current!.condition!.icon!}',

                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("${state.weather.data!.current!.condition!.text}",textAlign:TextAlign.center,style: Theme.of(context).textTheme.displayLarge?.copyWith(
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

                                Text(' ${state.weather.data!.forecast!.forecastday![0].day!.maxtempC!}',style: Theme.of(context).textTheme.displayLarge?.copyWith(
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

                                Text(' ${state.weather.data!.forecast!.forecastday![0].day!.mintempC!}',style: Theme.of(context).textTheme.displayLarge?.copyWith(
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
                WeatherCard(icon: 'assets/icons/cloud.png', title: 'Wind', value: "${state.weather.data!.current!.windKph!} km/h", height: 18.h),

                SizedBox(
                  width: 10.w,
                ),
                WeatherCard(icon: 'assets/icons/humidity.png', title: 'Humidity', value: "${state.weather.data!.current!.humidity!}%", height: 18.h),


              ],
            ),

          ]
      ),
    );
  }
}
