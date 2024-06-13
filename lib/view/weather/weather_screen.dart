import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/data/response/status.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/city_list/city_model.dart';
import 'package:weather_app/view/weather/widgets/error_widget.dart';

import 'package:weather_app/view/weather/widgets/landscape_weather_widget.dart';
import 'package:weather_app/view/weather/widgets/loading_widget.dart';
import 'package:weather_app/view/weather/widgets/potrait_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class WeatherScreen extends StatefulWidget {
  final CityModel city;
  const WeatherScreen({super.key, required this.city});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc weatherBloc;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherBloc = WeatherBloc(weatherRepository: getIt());
    // Dispatches the [FetchWeather] event to trigger fetching movies data
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:BlocProvider(
  create: (context) => weatherBloc..add(FetchWeather(searchQuery: widget.city.city)),
  child: BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) {
     switch(state.weather.status!){
    case Status.loading:
    return const LoadingWidget(); // Widget for displaying loading state
    case Status.error:
    return  WeatherErrorWidget(query: widget.city.city,); // Widget for displaying error state
    case Status.completed:
      return OrientationBuilder(
        builder: (context,Orientation orientation) {
           if(orientation == Orientation.portrait) {
             return PortraitWeatherWidget(state: state); // Widget for displaying portrait view
           } else {
             return LandscapeWeatherWidget(state: state); // Widget for displaying landscape view
           }
        }
      );
       default:
         return const SizedBox();

    }


  },
),
)
    )
    );
  }
}
