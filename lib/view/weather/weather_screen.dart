import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/data/response/status.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/city_list/city_model.dart';
import 'package:weather_app/view/weather/widgets/error_widget.dart';
import 'package:weather_app/view/weather/widgets/icon_widget.dart';
import 'package:weather_app/view/weather/widgets/landscape_weather_widget.dart';
import 'package:weather_app/view/weather/widgets/loading_widget.dart';
import 'package:weather_app/view/weather/widgets/potrait_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';
import '../../bloc/city_bloc/city_bloc.dart';

import '../../configs/themes/theme_config.dart';


class WeatherScreen extends StatefulWidget {
  final CityModel city;
  const WeatherScreen({required this.city});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc weatherBloc;

  // late CityModel city;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherBloc = WeatherBloc(weatherRepository: getIt());
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("sdsd"+(ModalRoute.of(context)!.settings.arguments).toString());
   // final city = ModalRoute.of(context)!.settings.arguments as CityModel;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:BlocProvider(
  create: (context) => weatherBloc..add(FetchWeather(searchQuery: widget.city.city)),
  child: BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) {
     switch(state.weather!.status!){
    case Status.loading:
    return const LoadingWidget();
    case Status.error:
    return  WeatherErrorWidget(query: widget.city.city,); // Widget for displaying error state
    case Status.completed:
      return OrientationBuilder(
        builder: (context,Orientation orientation) {
           if(orientation == Orientation.portrait)
             return PotraitWeatherWidget(state: state);
           else
             return LandscapeWeatherWidget(state: state);
        }
      );
       default:
         return SizedBox();

    }


  },
),
)
    )
    );
  }
}
