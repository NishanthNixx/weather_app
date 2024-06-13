import 'package:weather_app/model/weather/weather_model.dart';



/// Abstract class defining methods for movies API repositories.
abstract class WeatherApiRepository {
  /// Fetches the weather data from the API.
  ///
  /// Returns a [Weather] model representing the weather data.
  Future<Weather> fetchWeather({required String query});
}
