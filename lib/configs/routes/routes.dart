import 'package:weather_app/configs/routes/routes_name.dart';
import 'package:weather_app/model/city_list/city_model.dart';
import 'package:weather_app/view/city/city_screen.dart';
import 'package:weather_app/view/weather/weather_screen.dart';
import 'package:flutter/material.dart';

import '../../view/views.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());

      case RoutesName.home:
        // debugPrint("dadad"+settings.arguments!.toString());
        return MaterialPageRoute(builder: (BuildContext context) =>  WeatherScreen(city:settings.arguments! as CityModel ,));

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const CityScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
