import 'package:weather_app/repository/weather_repository/weather_api_repository.dart';

import '../../data/network/network_api_services.dart';
import '../../model/weather/weather_model.dart';
import '../../utils/app_url.dart';


/// Implementation of [WeatherApiRepository] for making HTTP requests to fetch weather data.
class WeatherHttpApiRepository implements WeatherApiRepository {
  final _apiServices = NetworkApiService();



  @override
  Future<Weather> fetchWeather({required String query}) async {
    final response = await _apiServices.getApi(AppUrl.weatherUrl+query);
    return Weather.fromJson(response);
  }
}
