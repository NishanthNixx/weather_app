import 'package:weather_app/bloc/city_bloc/city_bloc.dart';
import 'package:weather_app/configs/routes/routes_name.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late CityBloc cityBloc;



  @override
  void initState() {
    super.initState();
    cityBloc = CityBloc();
    // Dispatches the [PostFetched] event to trigger fetching movies data
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
      create: (context) => cityBloc..add(CitiesFetched()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: OrientationBuilder(
          builder: (context, orientation) {
            if(orientation == Orientation.portrait) {
              return PortriatCityWidget(cityBloc: cityBloc);
            } else {
              return LandScapeCityWidget(cityBloc: cityBloc);
            }

          }
        ),

      ),
    ),
    );
  }
}

class LandScapeCityWidget extends StatelessWidget {
  const LandScapeCityWidget({
    super.key,
    required this.cityBloc,
  });

  final CityBloc cityBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15.sp,),
              Text("Search City",style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 25.sp),),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.all(10.sp),
          child: Card(
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            elevation: 2,
            child: TextFormField(
              decoration: InputDecoration(

                labelText: 'City',
                hintText: 'Search For City',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.grey.shade200 ),
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(30)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.grey.shade400 ),
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(30)
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.grey.shade200 ),
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(30)
                ),

              ),
              onChanged: (val){
                if(val.trim().isNotEmpty) {
                  cityBloc.add(SearchCity(val));
                } else {
                  cityBloc.add(CitiesFetched());
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.sp),
            child: BlocBuilder<CityBloc, CityStates>(

              builder: (context, state) {

                return state.cities.isNotEmpty? ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cities.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder:(context, i){
                      return Card(
                        color: Colors.grey.shade200,
                        child: ListTile(
                          onTap: (){
                            Navigator.pushNamed(context,RoutesName.home,arguments:state.cities[i]

                            );
                          },
                          title: Text(state.cities[i].city,style: Theme.of(context).textTheme.titleMedium,),
                          subtitle: Text(state.cities[i].country,style: Theme.of(context).textTheme.titleSmall,),
                          trailing: const Icon(Icons.location_city),
                        ),
                      );
                    })
                    : Center(
                  child: Column(
                    children: [
                      // SizedBox(height: 10.h,),
                      Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                        child: SizedBox(
                            height: 20.h,
                            child: Lottie.asset('assets/animations/cities_not_found.json')),
                      ),
                      Text("Sorry, Couldn't find the city you have searched for!!",textAlign:TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 15.sp
                      ),),

                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class PortriatCityWidget extends StatelessWidget {
  const PortriatCityWidget({
    super.key,
    required this.cityBloc,
  });

  final CityBloc cityBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      SizedBox(
        height: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15.sp,),
            Text("Search City",style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600),),
          ],
        ),
      ),
      Padding(
        padding:  EdgeInsets.all(10.sp),
        child: Card(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          elevation: 2,
          child: TextFormField(
            decoration: InputDecoration(

              labelText: 'City',
              hintText: 'Search For City',

              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.grey.shade200 ),
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(30)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.grey.shade400 ),
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(30)
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.grey.shade200 ),
                gapPadding: 0,
                borderRadius: BorderRadius.circular(30)
              ),

            ),
            onChanged: (val){
              if(val.trim().isNotEmpty) {
                cityBloc.add(SearchCity(val));
              } else {
                cityBloc.add(CitiesFetched());
              }
            },
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.sp),
          child: BlocBuilder<CityBloc, CityStates>(

            builder: (context, state) {

              return state.cities.isNotEmpty? ListView.builder(
            shrinkWrap: true,
            itemCount: state.cities.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder:(context, i){
            return Card(
              color: Colors.grey.shade200,
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context,RoutesName.home,arguments:state.cities[i]

                  );
                },
                title: Text(state.cities[i].city,style: Theme.of(context).textTheme.titleMedium,),
                subtitle: Text(state.cities[i].country,style: Theme.of(context).textTheme.titleSmall,),
                trailing: const Icon(Icons.location_city),
              ),
            );
          }): Center(
                child: Column(
                  children: [
                SizedBox(height: 10.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 40.sp,vertical: 20.sp),
                      child: Lottie.asset('assets/animations/cities_not_found.json'),
                    ),
                    Text("Sorry, Couldn't find the city you have searched for!!",textAlign:TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp
                    ),),

                  ],
                ),
              );
    },
                ),
        ),
      )
    ],
                );
  }
}
